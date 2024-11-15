public class StringListTest {
    
    // Public static method to generate a list of formatted strings
    public static List<String> generateStringList(Integer numberOfStrings) {
        // Initialize an empty list to hold the formatted strings
        List<String> stringList = new List<String>();

        // Loop from 0 to numberOfStrings - 1
        for (Integer i = 0; i < numberOfStrings; i++) {
            // Add formatted string to the list
            stringList.add('Test ' + i);
        }

        // Return the populated list
        return stringList;
    }
}