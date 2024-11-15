import { LightningElement, api, wire } from 'lwc';
import getCaseDetails from '@salesforce/apex/CaseEscalationHandler.getCaseDetails';
import updateEscalationStatus from '@salesforce/apex/CaseEscalationHandler.updateEscalationStatus';

export default class CaseEscalationOverride extends LightningElement {
    @api recordId; // The Case record ID, automatically provided by the record page
    isEscalated = false;

    // Fetch case escalation status when component loads
    @wire(getCaseDetails, { caseId: '$recordId' })
    wiredCase({ error, data }) {
        if (data) {
            this.isEscalated = data.Escalated__c;
            console.log('Fetched escalation status: ', this.isEscalated);
        } else if (error) {
            console.error('Error fetching case details: ', error);
        }
    }

    // Handle Mark Resolved button click
    handleMarkResolved() {
        console.log('Mark as Resolved button clicked');
        this.updateEscalation(false); // Set isEscalated to false when resolved
    }

    // Handle Cancel Escalation button click
    handleCancelEscalation() {
        console.log('Cancel Escalation button clicked');
        this.updateEscalation(false); // Cancel escalation, set isEscalated to false
    }

    // Method to update escalation status
    updateEscalation(isEscalated) {
        console.log('Updating escalation status: ', isEscalated);
        updateEscalationStatus({ caseId: this.recordId, isEscalated })
            .then(() => {
                this.isEscalated = isEscalated; // Update local state after successful update
                console.log('Escalation status updated to: ' + this.isEscalated);
            })
            .catch(error => {
                console.error('Error updating escalation status: ', error);
            });
    }
}