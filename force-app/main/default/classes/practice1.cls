public class practice1 implements Database.Batchable<sObject> , Database.stateful{
	public integer recordCount =0;
    public Database.QueryLocator start (Database.BatchableContext bc){
        return Database.getQueryLocator ([Select Id, Deal_Type__c From Opportunity]);
    }
    public void execute(Database.BatchableContext bc, List<Opportunity> opps){
        if(!opps.isEmpty()){
            for(Opportunity opp : opps){
                opp.Deal_Type__c ='Rental';
            }
            update opps;
            recordCount = recordCount + opps.size();
        }
    }
    public void finish(Database.BatchableContext bc){
        System.debug ('Total Records Processed '+ recordCount);
    }
}