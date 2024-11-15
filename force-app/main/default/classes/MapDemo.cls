public class MapDemo {
    public static void sObjectDemo(){
        List<Account> accList= new List<Account>();
        Map<Id,  Account> accMap = new Map <Id,Account>();
        accList =[Select Id , Name, Phone From Account Limit 5];
        accMap.putAll(accList);
        System.debug('Map Contains = ' + accMap);
    }
    
    public static void sObjectDemoWithLoop(){
        List<Account> accList = new List <Account>();
        accList = [Select name from Account limit 5];
        Map<Id, Account> accMap = new Map <Id, Account>(accList);
        System.debug('Map Contains : '+ accMap);
        System.debug('Map Keys : '+accMap.keySet());
        System.debug('Map Values : '+ accMap.values());
    }
     public static void customObjectDemoWithLoop(){
        List<Position__c> posList = new List <Position__c>();
        posList = [Select name from Position__c limit 5];
        Map<Id, Position__c> posMap = new Map <Id, Position__c>(posList);
        System.debug('Map Contains : '+ posMap);
        System.debug('Map Keys : '+posMap.keySet());
        System.debug('Map Values : '+ posMap.values());
    }
    
    
    
    public static void demo(){
        Map<Integer,String>colors= new Map<Integer,String>();
        Map<Integer, String> moreColors = new Map<Integer, String>();
        Map<Integer, String> cloneColors = new Map<Integer, String>();
		 
        colors.put(1,'Red');
        colors.put(2,'Blue');
        colors.put(3,'Green');
        System.debug('Map Contains = '+colors);
        colors.put(2,'Yellow');
        System.debug('Map Contains = '+ colors);
        moreColors.put(10,'Black');
        moreColors.put(11,'White');
        colors.putAll(moreColors);
        System.debug('Map Contain '+ moreColors);
        colors.remove(1);
        System.debug('Map Contains : '+ colors);
        System.debug('Map Size : '+ colors.size());
        System.debug('Map Values : '+ colors.values());
        // colors.clear();
        // System.debug('Map Contains : '+ colors);   
        cloneColors = colors.clone();
        System.debug('Map Cloned : '+ cloneColors );      
        System.debug('Map Contains : '+ colors.containsKey(11));
        System.debug('Map Contains : '+ colors.containsKey(12));
        System.debug('Map Equals or Not : '+ colors.equals(colors));
        System.debug('Map Equals or Not : '+ colors.equals(moreColors));
        System.debug('Map Contains Get : '+ colors.get(11));
        System.debug('Map Contains Empty or Not : '+colors.isEmpty());
        System.debug('Map Keys : '+ colors.keySet());
    }
}