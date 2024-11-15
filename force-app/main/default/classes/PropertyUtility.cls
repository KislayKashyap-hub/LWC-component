public class PropertyUtility {

    // Public static method to retrieve properties listed in the last 30 days
    public static void newListedProperties() {
        // Create a list to hold the query results
        List<Property__c> newPropList = [SELECT Name, Broker__r.Broker_Email__c
                                         FROM Property__c
                                         WHERE CreatedDate = LAST_N_DAYS:30];

        // Loop through the newPropList
        for (Property__c prop : newPropList) {
            // Concatenate property name and broker's email
            String propEmail = prop.Name + ' : ' + prop.Broker__r.Broker_Email__c;

            // Print the concatenated string to the debug log
            System.debug(propEmail);
        }
    }
}