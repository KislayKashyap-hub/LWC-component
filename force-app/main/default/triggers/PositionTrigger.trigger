trigger PositionTrigger on Position__c (before insert, after insert) {
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            PositionTriggerHandler.populateData(Trigger.New);
        }else if(Trigger.isAfter){
           PositionTriggerHandler.createTask(Trigger.New);
        }
    }
}