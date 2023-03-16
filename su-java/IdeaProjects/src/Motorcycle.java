public class Motorcycle {

    public int wheels;
    private String color;

    public void setColor(String x){
        this.color = x;
    }

    public String getColor(){
        return this.color;
    }

    public void printDetails(){
        System.out.println("No. of wheels: "+ this.wheels);
        System.out.println("Color: "+ this.getColor());
    }

    public static int calculate(){
        return (3*4);
    }

}
