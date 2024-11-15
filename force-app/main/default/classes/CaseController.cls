public with sharing class CaseController {

    @AuraEnabled(cacheable=true)
    public static List<User> getAllActiveUsers(){
        try {
            // Check if user has permission to read User records
            if (!Schema.sObjectType.User.isAccessible()) {
                throw new AuraHandledException('User does not have read permission for User object.');
            }
            
            return [SELECT Id, Name FROM User WHERE IsActive = true];
        } catch (Exception e) {
            throw new AuraHandledException('Error fetching active users: ' + e.getMessage());
        }
    }

    @AuraEnabled
    public static Case createNewCase(ID accId, ID userId){
        try {
            // Check if the user has create permissions on the Case object
            if (!Schema.sObjectType.Case.isCreateable()) {
                throw new AuraHandledException('User does not have permission to create Case.');
            }

            Case c = new Case();
            c.AccountId = accId;
            c.OwnerId = userId;
            c.Status = 'New';
            c.Subject = 'New Case Initiated';
            c.Origin = 'Web';
            insert c;
            return c;
        } catch (Exception e) {
            throw new AuraHandledException('Error creating case: ' + e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<Case> getAllCasesRecords(ID accId){
        try {
            // Check if user has read permissions on the Case object
            if (!Schema.sObjectType.Case.isAccessible()) {
                throw new AuraHandledException('User does not have read permission for Case object.');
            }
            
            return [SELECT Id, CaseNumber, Priority, Status, AccountId FROM Case WHERE AccountId = :accId];
        } catch (Exception e) {
            throw new AuraHandledException('Error fetching cases: ' + e.getMessage());
        }
    }

    @AuraEnabled
    public static void updateCase(Case updatedCase){
        try {
            // Check if user has update permissions on the Case object
            if (!Schema.sObjectType.Case.isUpdateable()) {
                throw new AuraHandledException('User does not have permission to update Case.');
            }
            
            update updatedCase;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
