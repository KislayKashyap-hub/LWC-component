@isTest
public class AccountCalculatorTest {
    @isTest
    private static void countContactsTest(){
        List<Account>accList = new List<Account>();
        for(Integer i= 0; i<=250;i++){
            accList.add(new Account(Name ='Test' + i));   
        }
        Test.startTest();
        insert accList;
        Test.stopTest();
        List<Contact> conList = new List <Contact>();
        List<Id> accIds = new List<Id>();
        for(Account acc : accList){
            Contact con = new Contact();
            con.FirstName = 'Test';
            con.LastName = acc.Name;
            con.AccountId = acc.Id;
            conList.add(con);
            accIds.add(acc.id);
        }
        insert conList;
        
        AccountCalculator.countContacts(accIds);
        Test.stopTest();
        List<Account> accs = [select Id, Count_Number_of_Contacts__c from Account];
        System.assertEquals(1,accs[0].Count_Number_of_Contacts__c,
                            'Contacts are not counted successfully');
    }
}