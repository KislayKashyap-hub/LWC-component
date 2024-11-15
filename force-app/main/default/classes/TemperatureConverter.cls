public class TemperatureConverter {
    // Take a Fehrenheit temp and returns the Celsius equivalent.
    public static Decimal FahrenheitToCelsius(Decimal fh){
        Decimal cs = (fh - 32)* 5/9;
        return cs.setScale(2);
    }
}