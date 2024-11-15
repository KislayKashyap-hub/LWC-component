public class AllDataType {
    public static void method1(){
        Boolean isActive = true;
        System.debug('Value of isActive ' +true);
    }
    public static void method2(){
        Integer age = 27;
        System.debug('Num = '+age);
    }
    public static void method3(){
        Decimal marks = 77.72;
        System.debug('Marks Value : '+marks);
    }
    public static void method4(){
        String FirstName ='Kislay ', LastName = 'Kashyap';
        System.debug('Full Name = ' + FirstName + LastName);
    }
    public static void method5(){
        Long mobNum = 6301400265L;
        System.debug('Mobile Number : '+mobNum);
    }
    public static void method6(){
        ID accId = '001NS00000ZcrWZYAZ';
        System.debug('ID : ' +accId);
    }
    public static void method7(){
        Date todayDate = Date.today();
        System.debug('Today Date : '+todayDate);
    }
    public static void method8(){
        DateTime now =DateTime.now();
        System.debug('Current Time : '+now);
    }
    public static void method9() {
        DateTime currentDateTime = DateTime.now();   // Get the current DateTime
        Time currentTime = currentDateTime.time();   // Extract the Time from DateTime
        System.debug('Current Time = ' + currentTime);
    }
    public static void method10(){
        List<String>fruits =new List<String>{'Apple', 'Mango', 'Mango'};
            System.debug('Fruits : '+fruits);
    }    
    public static void method11(){
        Set<Integer> uniqueNumbers = new Set<Integer>{1,2,3,4,5,6,7,7}; 
            // 7 is duplicate here -> which automatically removed by Set Data Type.
            System.debug('Unique Numbers : '+uniqueNumbers);
    }
    public Static void method12(){
        Map<String, Integer> polulationMap = new Map <String, Integer>{'India'=> 1380000000, 'USA' => 331000000};
            System.debug('Polulation Map = '+ polulationMap);
    }
    public static void method13(){
        Blob data =Blob.valueOf('Hello Apex');
        System.debug('Blob Data : '+data);
    }
    public static void insertAccountWithConAndOpp(String name, String rating){
        Account acc = new Account();
        acc.Name = name;
        acc.Rating = rating;
        insert acc;
        
        Contact con = new Contact(firstname = 'Kislay',lastname='Kashyap');
        con.AccountId=acc.Id;
            
            Opportunity opp = new Opportunity();
        opp.Name = 'Opp 1';
        opp.CloseDate= System.today();
        opp.StageName='Prospecting';
        opp.AccountId=acc.Id;
        insert opp;
    }
}