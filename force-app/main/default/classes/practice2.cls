public class practice2 implements Database.Batchable<sObject> , Database.stateful {
    public integer recordCount = 0;
    public Database.QueryLocator start (Database.BatchableContext bc){
        return Database.getQueryLocator ([ select id , NumberOfEmployees FROM Account]);  
    }
    public void execute(Database.BatchableContext bc, List<Account>appList){
        if(!appList.isEmpty())
            System.debug('Total Record Processed : '+ appList);
        {
            for (Account app : appList){
                app.NumberOfEmployees = 5999;
            }
            System.debug('Total Record Processed : '+appList);
            update appList;
            recordCount = recordCount + appList.size();
        }
    }
    public void finish (Database.BatchableContext bc){
        System.debug('Total Record Processed : '+ recordCount);
    }
}