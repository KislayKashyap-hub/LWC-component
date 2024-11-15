trigger CreateContactOnAccountTrigger on Account (after insert, after update) {
    if (Trigger.isAfter) {
        if (Trigger.isInsert || Trigger.isUpdate) {
            CreateContactHandler.createRelatedContacts(Trigger.new, Trigger.oldMap);
        }
    }
}