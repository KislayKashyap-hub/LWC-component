public class DailyOppProcessor implements schedulable{
    public void execute (SchedulableContext ctx){
        List<Opportunity> oppList = [select Id, LeadSource from Opportunity
                                     where LeadSource = null limit 200];
        for(Opportunity opp : oppList){
            opp.leadSource ='Web';
        }
        if(!oppList.isEmpty()){
            update OppList;
        }
    }
}