public class accountRecord {
    public static void insertData(){
        Account acc = new Account();
        acc.Name = 'Safari';
        acc.Rating ='Hot';
        
        insert acc;
    }
    public static ID insertAccount(String name, String rating){
        Account acc = new Account();
        acc.Name = name;
        acc.Rating =rating;
        insert acc;
        return acc.Id;
    }     
    public static void insertContact(){
        Id accId;
        accId= insertAccount('The Batman', 'Hot');
        Contact con = new Contact(FirstName = 'Heath', LastName = 'Leadger');
        con.accountId =accId;
        insert con;
    }
    public static void insertAccountWithConAndOpp(String name, String rating){
        Account acc = new Account();
        acc.Name =name;
        acc.Rating=rating;
        insert acc;
        
        Contact con = new Contact(firstname = 'Ajit',lastname='Prabhakar');
        con.AccountId=acc.Id;
        insert con;
        
        Opportunity Opp = new Opportunity();
        Opp.Name='Grab this Value';
        Opp.CloseDate=System.today();
        Opp.StageName='Prospecting';
        Opp.AccountId=acc.Id;
        insert Opp;
    }
    public static void insertAccountWithConOppAndCase(String name, String rating){
        Account acc = new Account();
        acc.Name=name;
        acc.Rating=rating;
        insert acc;
        
        Contact con = new Contact (firstname='Suman',lastname='Pandit');
        con.AccountId=acc.Id;
        insert con; 
        
        Opportunity opp = new Opportunity();
        opp.Name='Big Billions Day';
        opp.StageName='Prospecting';
        opp.CloseDate=System.today();
        opp.AccountId=acc.Id;
        insert opp;
        
        Case cas = new Case();
        cas.Origin= 'Email';
        cas.Status='New';
        cas.AccountId=acc.Id;
    }
}