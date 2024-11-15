public class ListDemo {
    public static void sObjectListDemo(){
        List<Account>accList= new List<Account>();
        Account acc1 = new Account (Name='Acc111');
        acclist.add(acc1);
        
        Account acc2 = new Account ();
        acc2.Name='Acc121';
        accList.add(acc2);
        
        insert accList;
    }
    public static void sObjectListPosition(){
        List<position__c> posList=new List<Position__c>();
        Position__c pos1 = new Position__c(Name = 'WordPress Developer');
        posList.add(pos1);
        
        Position__c pos2 = new Position__c(Name='Automation Testing');
        posList.add(pos2);
        
        insert posList;
        
    }
    
    
    public static List<String> returnDemo(String str1,String str2){
        List <String> colors = new List<String>{'Red','Yellow','Green'};
            colors.add(str1);
        colors.add(str2);
        return colors;
    }
    public static void ListDemoMethod(){
        List<String> returnedValues=new List<String>();
        returnedValues = returnDemo('Black','Purple');
        System.debug('ReturnedValues List Contains = '+returnedValues);
        
        List<String> colors = new List <String>();
        colors.add('Red');
        colors.add('Yellow');
        colors.add('Green');
        colors.add('Blue');
        
        System.debug('Colors List Contains = '+colors);
        colors.add(1,'Dark Green');
        System.debug('Colors List Contains = '+colors);
        
        List <String> colorsList2 = new List<String>();
        colorsList2.add('White');
        colorsList2.add('Purple');
        
        colors.addAll(colorsList2);
        System.debug('Colors List Contains = '+ colors);
        System.debug('ColorsList2 contains = '+colorsList2);
        
        colors.remove(3);
        System.debug('Colors list Contains ='+colors);
        System.debug('Size ='+colorsList2.size());
        colors.sort();
        System.debug('Sorted Values = '+ colors);
    }
}