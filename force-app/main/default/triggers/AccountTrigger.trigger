trigger AccountTrigger on Account (before insert, after insert) {
    if(Trigger.isInsert){
        if(Trigger.isBefore){
            AccountTriggerHandler.updateDes(Trigger.new);
            AccountTriggerHandler.populateRating(Trigger.new);
        }else if(Trigger.isAfter){
            AccountTriggerHandler.createOpp(Trigger.new);
        }
    } 
}