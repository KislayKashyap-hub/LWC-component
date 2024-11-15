public class OppProcessor implements Database.Batchable<sObject>, Database.stateful {
    
    public integer recordCount = 0;
    
    public Database.QueryLocator start (Database.BatchableContext bc){
        return Database.getQueryLocator([select Id, LeadSource from Opportunity]);
    }
    public void execute(Database.BatchableContext bc,List<Opportunity>opps){
        if(!opps.isEmpty()){
            for(Opportunity opp : opps){
                opp.LeadSource = 'Web Source';
            }
            update opps;
            recordCount = recordCount + opps.size();
        }
    }
    public void finish(Database.BatchableContext bc ){
        System.debug('Total Record Processed '+ recordCount);
    }
		
}