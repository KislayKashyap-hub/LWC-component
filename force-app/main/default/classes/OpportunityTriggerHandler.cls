public class OpportunityTriggerHandler {

    public static void updateMinOpportunityAmount(Set<Id> accountIds) {
        // Prepare a list to hold accounts that need to be updated
        List<Account> accountsToUpdate = new List<Account>();
        
        // Query the minimum Opportunity Amount for each Account using aggregate SOQL
        for (AggregateResult aggResult : [
            SELECT AccountId, MIN(Amount) minAmount
            FROM Opportunity
            WHERE AccountId IN :accountIds
            GROUP BY AccountId
        ]) {
            // Create an Account record to update the MinOpportunityAmount__c field
            Account acc = new Account();
            acc.Id = (Id)aggResult.get('AccountId');  // Set the Account ID
            acc.MinOpportunityAmount__c = (Decimal)aggResult.get('minAmount');  // Set the minimum opportunity amount
            
            // Add the account to the list of accounts to be updated
            accountsToUpdate.add(acc);
        }

        // Update the Account records if any exist
        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }
}