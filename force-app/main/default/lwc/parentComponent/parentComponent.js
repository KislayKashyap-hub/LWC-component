import { LightningElement, api, wire, track } from 'lwc';
import activeUsers from '@salesforce/apex/CaseController.getAllActiveUsers';
import createNewCase from '@salesforce/apex/CaseController.createNewCase';
import getAllCases from '@salesforce/apex/CaseController.getAllCasesRecords';
import updateCase from '@salesforce/apex/CaseController.updateCase';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

const columns = [
    { label: 'Case Number', fieldName: 'CaseNumber' },
    { label: 'Priority', fieldName: 'Priority' },
    { label: 'Status', fieldName: 'Status' }
];

export default class ParentComponent extends LightningElement {
    @api recordId;
    @track allActiveUsers = [];
    @track selectedUserId;
    @track cases = [];
    @track isLoading = false;
    selectedCase = {};
    columns = columns;

    @wire(activeUsers)
    wiredActiveUsers({ data, error }) {
        if (data) {
            this.allActiveUsers = data.map(user => ({
                label: user.Name,
                value: user.Id
            }));
        } else if (error) {
            this.showToast('Error', 'Error fetching active users.', 'error');
        }
    }

    userSelected(event) {
        this.selectedUserId = event.detail.value;
    }

    createCaseEvent() {
        if (!this.selectedUserId) {
            this.showToast('Error', 'Please select a user to initiate the case.', 'error');
            return;
        }

        if (!this.recordId) {
            this.showToast('Error', 'Error while fetching recordId', 'error');
            return;
        }

        this.isLoading = true;

        createNewCase({ accId: this.recordId, userId: this.selectedUserId })
            .then(() => {
                this.showToast('Success', 'Case created successfully.', 'success');
                return getAllCases({ accId: this.recordId });
            })
            .then((result) => {
                this.cases = result;
                this.isLoading = false;
            })
            .catch((error) => {
                this.showToast('Error', 'Error updating case: ' + (error.body ? error.body.message : error.message), 'error');
                this.isLoading = false;
            });
    }

    handleCaseUpdated(event) {
        this.selectedCase = event.detail.updatedCase;
    }

    updateSelectedCase(event) {
        updateCase({ updatedCase: this.selectedCase })
            .then(() => {
                this.showToast('Success', 'Case updated successfully.', 'success');
            })
            .catch((error) => {
                this.showToast('Error', 'Error updating case: ' + (error.body ? error.body.message : error.message), 'error');
            });
    }

    showToast(title, message, variant) {
        const event = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant,
        });
        this.dispatchEvent(event);
    }
}
