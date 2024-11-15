import { LightningElement, api, wire, track } from 'lwc';
import getContactsByAccountId from '@salesforce/apex/ContactEmailController.getContactsByAccountId';
import getEmailTemplates from '@salesforce/apex/ContactEmailController.getEmailTemplates';
import sendEmail from '@salesforce/apex/ContactEmailController.sendEmail';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
 
export default class ContactEmail extends LightningElement {
    @api recordId;
    @track contacts = [];
    @track selectedContacts = [];
    @track emailTemplates = [];
    @track selectedTemplateId;
    @track showModal = false;
 
    columns = [
        { label: 'First Name', fieldName: 'FirstName' },
        { label: 'Last Name', fieldName: 'LastName' },
        { label: 'Email', fieldName: 'Email' }
    ];
 
    @wire(getContactsByAccountId, { accountId: '$recordId' })
    wiredContacts({ error, data }) {
        if (data) {
            this.contacts = data;
        } else if (error) {
            console.error(error);
        }
    }
 
    @wire(getEmailTemplates)
    wiredEmailTemplates({ error, data }) {
        if (data) {
            this.emailTemplates = data.map(template => {
                return { label: template.Name, value: template.Id };
            });
        } else if (error) {
            console.error(error);
        }
    }
 
    handleRowSelection(event) {
        this.selectedContacts = event.detail.selectedRows;
    }
 
    handleTemplateChange(event) {
        this.selectedTemplateId = event.target.value;
    }
 
    handleNextButtonClick() {
        if (this.selectedContacts.length > 0) {
            this.showModal = true;
        } else {
            this.showToast('Warning', 'Please select at least one contact.', 'warning');
        }
    }
 
    handleSendEmail() {
        if (this.selectedTemplateId) {
            const promises = this.selectedContacts.map(contact => {
                return sendEmail({ contactId: contact.Id, templateId: this.selectedTemplateId });
            });
 
            Promise.all(promises)
                .then(() => {
                    this.showToast('Success', 'Email sent successfully to selected contacts!', 'success');
                    this.showModal = false;
                })
                .catch(error => {
                    console.error(error);
                    this.showToast('Error', 'Error sending email.', 'error');
                });
        } else {
            this.showToast('Warning', 'Please select an email template.', 'warning');
        }
    }
 
    showToast(title, message, variant) {
        const event = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant,
        });
        this.dispatchEvent(event);
    }
    showSuccessToast() {
        const evt = new ShowToastEvent({
            title: 'Toast Success',
            message: 'Opearion sucessful',
            variant: 'success',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
    }
    showErrorToast() {
        const evt = new ShowToastEvent({
            title: 'Toast Error',
            message: 'Some unexpected error',
            variant: 'error',
            mode: 'dismissable'
        });
        this.dispatchEvent(evt);
    }
 
    handleModalClose() {
        this.showModal = false;
    }
}