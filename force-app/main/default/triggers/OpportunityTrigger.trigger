trigger OpportunityTrigger on Opportunity (after insert, after update, after delete) {
    // Create a Set to hold Account IDs
    Set<Id> accountIds = new Set<Id>();

    // Collect Account IDs from inserted Opportunities (Always calculate for new opportunities)
    if (Trigger.isInsert) {
        for (Opportunity opp : Trigger.new) {
            if (opp.AccountId != null) {
                accountIds.add(opp.AccountId);
            }
        }
    }

    // Check if Amount was changed in updated Opportunities (Trigger only when Amount is changed)
    if (Trigger.isUpdate) {
        for (Opportunity opp : Trigger.new) {
            Opportunity oldOpp = Trigger.oldMap.get(opp.Id);
            // Only add AccountId to the set if the Amount field has changed
            if (opp.AccountId != null && opp.Amount != oldOpp.Amount) {
                accountIds.add(opp.AccountId);
            }
        }
    }

    // Collect Account IDs from deleted Opportunities (Always calculate for deleted opportunities)
    if (Trigger.isDelete) {
        for (Opportunity opp : Trigger.old) {
            if (opp.AccountId != null) {
                accountIds.add(opp.AccountId);
            }
        }
    }

    // Call the handler method to update the minimum opportunity amount for related accounts
    if (!accountIds.isEmpty()) {
        OpportunityTriggerHandler.updateMinOpportunityAmount(accountIds);
    }
}