public class AccountHandler {
 
    // Method to prevent deletion of Accounts that have Closed Won Opportunities
    public static void preventAccountDeletion(List<Account> accountList, Set<Id> accountIds) {
        Set<Id> accountIdsWithClosedOpportunities = new Set<Id>();
 
        // Step 1: Query for Closed Won Opportunities related to the accounts being deleted
        List<Opportunity> closedOpps = [
            SELECT AccountId 
            FROM Opportunity 
            WHERE AccountId IN :accountIds 
            AND StageName = 'Closed Won' 
            AND AccountId != null
        ];
 
        // Step 2: Collect the Account IDs that have Closed Won Opportunities
        for (Opportunity opp : closedOpps) {
            accountIdsWithClosedOpportunities.add(opp.AccountId);
        }
 
        // Step 3: Prevent deletion ONLY for accounts that have Closed Won Opportunities
        for (Account acc : accountList) {
            if (accountIdsWithClosedOpportunities.contains(acc.Id)) {
                acc.addError('This account cannot be deleted because it has Closed Won opportunities.');
            }
        }
    }
}