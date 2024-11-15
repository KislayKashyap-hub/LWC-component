public with sharing class ContactEmailController {
 
    // Fetch related contacts for a given Account ID
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactsByAccountId(Id accountId) {
        // Validate if the user has READ access to the Contact object
        if (!Schema.sObjectType.Contact.isAccessible()) {
            throw new UnauthorizedAccessException('User does not have access to read Contact records.');
        }
 
        // Validate if the user has READ access to the Account object
        if (!Schema.sObjectType.Account.isAccessible()) {
            throw new UnauthorizedAccessException('User does not have access to Account records.');
        }
       
        // Query for related contacts by AccountId
        return [SELECT Id, FirstName, LastName, Email FROM Contact WHERE AccountId = :accountId];
    }
   
    // Fetch available email templates
    @AuraEnabled(cacheable=true)
    public static List<EmailTemplate> getEmailTemplates() {
        // Validate if the user has READ access to the EmailTemplate object
        if (!Schema.sObjectType.EmailTemplate.isAccessible()) {
            throw new UnauthorizedAccessException('User does not have access to EmailTemplate records.');
        }
       
        // Query for email templates
        return [SELECT Id, Name FROM EmailTemplate WHERE DeveloperName != NULL];
    }
   
    // Send email to the selected contact using the chosen email template
    @AuraEnabled
    public static void sendEmail(Id contactId, Id templateId) {
        // Validate if the user has CREATE access to the EmailMessage object
        if (!Schema.sObjectType.EmailMessage.isCreateable()) {
            throw new UnauthorizedAccessException('User does not have access to create EmailMessage records.');
        }
 
        // Validate if the user has READ access to the Contact object
        if (!Schema.sObjectType.Contact.isAccessible()) {
            throw new UnauthorizedAccessException('User does not have access to read Contact records.');
        }
 
        // Validate if the user has READ access to the EmailTemplate object
        if (!Schema.sObjectType.EmailTemplate.isAccessible()) {
            throw new UnauthorizedAccessException('User does not have access to read EmailTemplate records.');
        }
 
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setTemplateId(templateId);
        mail.setTargetObjectId(contactId);
        mail.setSaveAsActivity(true);
       
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }
 
    // Custom exception to handle unauthorized access
    public class UnauthorizedAccessException extends Exception {}
}