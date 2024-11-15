public class AccountUtility {

    // Public static method to view the Annual Revenue of all accounts
    public static void viewAnnualRevenue() {
        // Query to get Account Name and Annual Revenue
        List<Account> accountsList = [SELECT Name, AnnualRevenue FROM Account];

        // Loop through the accountsList
        for (Account acc : accountsList) {
            // Concatenate account name and annual revenue
            String acctRev = acc.Name + ' : ' + acc.AnnualRevenue;
            
            // Print the concatenated string to the debug log
            System.debug(acctRev);
        }
    }
}