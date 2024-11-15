public class CreateContactHandler {

    public static void createRelatedContacts(List<Account> newAccounts, Map<Id, Account> oldAccounts) {
        Map<Id, Account> accountsToProcess = new Map<Id, Account>();

        for (Account acc : newAccounts) {
            Boolean wasCheckedBefore = false;

            // Handle only update context where oldAccounts is not null
            if (oldAccounts != null && oldAccounts.containsKey(acc.Id)) {
                wasCheckedBefore = oldAccounts.get(acc.Id).Create_Contact__c;
            }

            // Create_Contact__c is set to true then create Related Contact
           
            if (acc.Create_Contact__c == true && (oldAccounts == null || wasCheckedBefore == false)) {
                accountsToProcess.put(acc.Id, acc); 
            }
        }

        if (!accountsToProcess.isEmpty()) {
            List<Contact> contactsToCreate = new List<Contact>();

            for (Account acc : accountsToProcess.values()) {
                Contact newContact = new Contact(
                    FirstName = acc.Name,  
                    LastName = 'Contact',  
                    AccountId = acc.Id   
                );
                contactsToCreate.add(newContact);
            }

            // Insert all the contacts at once (bulk DML)
            if (!contactsToCreate.isEmpty()) {
                try {
                    insert contactsToCreate;
                } catch (DmlException e) {
                    System.debug('Error inserting contacts: ' + e.getMessage());
                }
            }
        }
    }
}