public class AccountTriggerHandler {
   // public static void updatePhone(List<Account>accList, Map<Id, Account> accOldMap){
     //   for(Account acc : accList){
       //     if(acc.Phone : accList){
         //       acc.Description = 'Phone is Updated | Old Value = ' + accOldMap.get(acc.Id).Phone + 'New Value = ' + acc.Phone;
           // }
      //  }
    //}
    
    public static void createOpp(List<Account>accList){
        List<Opportunity>oppList = new List <Opportunity>();
        
        for(Account acc : accList){
            Opportunity opp = new Opportunity ();
            opp.Name = acc.Name;
            opp.CloseDate = System.today();
            opp.StageName = 'Prospecting';
            opp.AccountId = acc.Id;
            oppList.add(opp);
        }
        if(oppList.isEmpty()){
            insert oppList; 
        }
    }
    
    public static void updateDes(List<Account>accList){
        for(Account acc : accList){
            acc.Description = 'Account is created';
        }
    }
    public static void populateRating(List<Account>accList){
        for(Account acc : accList){
            if(acc.Industry != null && acc.Industry == 'Media'){
                acc.Rating = 'Hot';
            }
        }
    }
}