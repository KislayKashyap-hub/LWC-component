public class Calculator {
    public static void addition(){
      	Integer var1 =5,var2 = 6, sum;
        sum = var1 + var2;
        System.debug('Addition = '+sum);
    }
    public static void subtraction(){
        Integer var1 = 5, var2 =6, sum;
        sum = var1 - var2;
        System.debug('Subtraction = '+ sum);
    }
    public static void multiplication(Integer var1, Integer var2){
        Integer mul;
        mul = var1* var2;
        System.debug('Multiplication = ' + mul);
    }
    public static void division(Integer var1 , Integer var2){
        Integer div;
        div = var1 / var2;
        System.debug('Division = ' + div);
	}
}