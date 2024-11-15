trigger AccountTriggerPrevent on Account (before delete) {
    if (Trigger.isBefore && Trigger.isDelete) {
        // Step 1: Create a Set to hold Account IDs being deleted
        Set<Id> accountIds = new Set<Id>();

        // Step 2: Populate the Set with IDs of accounts being deleted
        for (Account acc : Trigger.old) {
            accountIds.add(acc.Id);
        }

        // Step 3: Call the handler method to prevent deletion of accounts with Closed Won Opportunities
        AccountHandler.preventAccountDeletion(Trigger.old, accountIds);
    }
}