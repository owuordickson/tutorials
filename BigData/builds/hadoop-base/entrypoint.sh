#!/bin/bash
set -e

# Dynamically target the real configuration directory
CONF_DIR="/opt/hadoop/etc/hadoop"
mkdir -p "$CONF_DIR"

# Generate Hadoop XML files from environment variables safely in Alpine
generate_xml() {
    PREFIX=$1
    FILE=$2

    cat > "$FILE" <<EOF
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
EOF

    # Swapped process substitution to a standard Unix pipe loop
    env | while IFS='=' read -r VAR VALUE; do
        if [[ "$VAR" == ${PREFIX}_* ]]; then
            KEY=${VAR#${PREFIX}_}
            # Restores dots for Hadoop configuration parameter names
            KEY=${KEY//_/.}

            cat >> "$FILE" <<EOF
    <property>
        <name>${KEY}</name>
        <value>${VALUE}</value>
    </property>
EOF
        fi
    done

    echo "</configuration>" >> "$FILE"
}

# Aligned with standard Docker environment injection conventions
generate_xml CORE_CONF   "$CONF_DIR/core-site.xml"
generate_xml HDFS_CONF   "$CONF_DIR/hdfs-site.xml"
generate_xml YARN_CONF   "$CONF_DIR/yarn-site.xml"
generate_xml MAPRED_CONF "$CONF_DIR/mapred-site.xml"

# Re-route local metadata paths cleanly
mkdir -p /opt/hadoop/dfs/name
mkdir -p /opt/hadoop/dfs/data

case "$HADOOP_NODE_TYPE" in
namenode)
    if [ ! -d "/opt/hadoop/dfs/name/current" ]; then
        echo "Formatting NameNode filesystem root..."
        hdfs namenode -format -force -nonInteractive
    fi
    echo "Launching NameNode..."
    exec hdfs namenode
    ;;

datanode)
    echo "Waiting for NameNode (namenode:9000) to accept incoming connections..."
    until nc -z namenode 9000
    do
        sleep 2
    done
    echo "Launching DataNode..."
    exec hdfs datanode
    ;;

*)
    echo "ERROR: Unknown or missing HADOOP_NODE_TYPE: '$HADOOP_NODE_TYPE'"
    exit 1
    ;;
esac
