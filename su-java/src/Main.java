public class Main {

    public static void main(String args[]){
        Motorcycle r = new Motorcycle();
        r.wheels = 3;
        r.setColor("green");
        r.printDetails();

        Motorcycle m2 = new Motorcycle();
        m2.wheels = 2;
        m2.setColor("red");
        m2.printDetails();

        Motorcycle.calculate();


        SampleFrame sFrame = new SampleFrame();
        sFrame.setVisible(true);

    }

}
