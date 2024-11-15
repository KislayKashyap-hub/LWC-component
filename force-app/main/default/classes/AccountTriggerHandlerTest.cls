@isTest
public class AccountTriggerHandlerTest {
    @isTest
    static void createOppTest(){
        List<Account>accList= new List <Account>();
        for(Integer i = 1; i<10; i++){
            Account acc = new Account();
            acc.Name = 'Test ' + i;
            accList.add(acc);
        }
        Test.startTest();
        insert accList;
        Test.stopTest();
        List<Opportunity> oppList =[Select Id
                                    from Opportunity
                                    where AccountId =: accList[0].Id];
        System.assert(oppList != null, 'Opportunity is not created');
    }
}