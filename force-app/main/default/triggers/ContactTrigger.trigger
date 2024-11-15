trigger ContactTrigger on Contact (After insert, After delete, After undelete) {
    if(Trigger.isInsert){
        if(Trigger.isAfter){
            ContactTriggerHandler.totalContactCount(Trigger.new);
        }
    }
    if(Trigger.isDelete){
        if(Trigger.isAfter){
            ContactTriggerHandler.totalContactCount(Trigger.Old);
                        
        }
    }
    if(Trigger.isUndelete){
        if(Trigger.isAfter){
            ContactTriggerHandler.totalContactCount(Trigger.new);
            
        }
    }
}