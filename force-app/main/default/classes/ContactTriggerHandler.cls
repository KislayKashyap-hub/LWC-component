// When a contact record is inserted, deleted then update 
// 'Total Contact Count' field on related Account.

public class ContactTriggerHandler {
    public static void totalContactCount(List<Contact>conList){
        List<Account> accList = new List<Account>();
        Set<Id> accIds = new Set<Id>();
        for(Contact con : conList){
            if(con.AccountId != null){
                // Collect all Account Ids 
              accIds.add(con.AccountId);
            }
        }
        for(Account acc : [Select Id, (Select Id from Contacts)
                           From Account where Id IN: accIds]){
                               acc.Total_Contact_Count__c = acc.Contacts.size();
                               accList.add(acc);
                           }
        if(!accList.isEmpty()){
            update accList;
        }
    }
}