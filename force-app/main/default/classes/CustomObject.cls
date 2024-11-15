public class CustomObject {
    public static void createPosition(){
        position__c pos = new position__c();
        pos.Name='NetSuit Developer';
        insert pos;
    }
    public static void createCandidate(){
        Candidate__c can = new Candidate__c();
        can.First_Name__c = 'Samir';
        can.Last_Name__c ='Maurya';
        can.Phone__c='9874563210';
        can.Mobile__c='9874563210';
        can.Education__c= 'HS Diploma';
        can.Email__c='samirkumarmaurya26@gmail.com';    
        insert can;
    }
    public static void createJobApplication(){
        Position__c pos = new Position__c();
        pos.Name='NetSuit Developer';
        //  pos.Id = 'a01NS00000ak7rSYAQ';
        insert pos;
        
        Candidate__c can = new Candidate__c();
        can.First_Name__c='Simant';
        can.Last_Name__c='Ishwar';
        can.Phone__c='9874563210';
        can.Mobile__c='9874563210';
        can.Education__c= 'HS Diploma';
        can.Email__c='kislay.tech@gmail.com';  
        insert can;
        
        Job_Appilication__c ja = new Job_Appilication__c();
        ja.Position__c=pos.Id;
        ja.Candidate__c=can.Id;
        ja.Status__c= 'New';
        insert ja;
        
        Review__c rev = new Review__c();
        rev.Job_Application__c = ja.Id;
        rev.Rating__c = 5;
        insert rev;
    }
}