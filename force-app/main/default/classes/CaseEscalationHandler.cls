public with sharing class CaseEscalationHandler { 
    // Method to handle case escalation based on certain conditions
    public static void handleCaseEscalation(List<Case> cases) {
        for (Case c : cases) {
            if (c.Priority == 'High' && c.Account.VIP__c == true) {
                c.Escalated__c = true; // Set Escalated__c field if the condition is met
            }
        }
    }

    // Method to fetch case details (Escalated__c)
    @AuraEnabled(cacheable=true)
    public static Case getCaseDetails(Id caseId) {
        return [SELECT Escalated__c FROM Case WHERE Id = :caseId LIMIT 1];
    }

    // Method to update escalation status (Escalated__c)
    @AuraEnabled
    public static void updateEscalationStatus(Id caseId, Boolean isEscalated) {
        System.debug('Case ID: ' + caseId); // Log the Case ID
        System.debug('Escalated Status: ' + isEscalated); // Log the status
        
        Case caseRecord = [SELECT Escalated__c FROM Case WHERE Id = :caseId LIMIT 1];
        caseRecord.Escalated__c = isEscalated; // Set Escalated__c field
        update caseRecord; // Update the record
    }
}