import java.util.Scanner;
public class Welcome {

    public static void main(String args[])
    {
        Scanner input = new Scanner(System.in);
        int number1;
        int number2;
        int sum;

        System.out.print("Enter first number: ");
        number1 = input.nextInt();

        System.out.print("Enter second number: ");
        number2 = input.nextInt();

        sum = number1 + number2;
        System.out.printf("Sum is "+ sum);
        //System.out.println("Sum is" +sum);
    }

}
