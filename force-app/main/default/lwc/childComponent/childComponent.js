import { LightningElement, api, track } from 'lwc';

export default class ChildComponent extends LightningElement {
    @api cases; // Receives the list of cases from the parent component
    viewCaseRecord = false;
    @track selectedCase = {};
    columns = [
        { label: 'Case Number', fieldName: 'CaseNumber' },
        { label: 'Priority', fieldName: 'Priority' },
        { label: 'Status', fieldName: 'Status' },
        {
            label: 'View', type: 'button',
            typeAttributes: {
                label: 'View',
                name: 'view',
                variant: 'brand',
                title: 'View Case',
                disabled: false,
                value: 'view',
            }
        }
    ];

    get hasCases() {
        return this.cases && this.cases.length > 0;
    }

    handleViewEvent(event) {
        const actionName = event.detail.action.name;
        const row = event.detail.row;
        if (actionName === 'view') {
            this.selectedCase = row; // Store only the selected case data
            this.viewCaseRecord = true; // Show the record in view/edit mode
        }
    }

    handleInputChange (event) {
        const field = event.target.dataset.field; // Get the field name (Priority or Status)
        const value = event.target.value; // Get the updated value
        this.selectedCase = {...this.selectedCase, [field] : value};

        const caseUpdatedEvent = new CustomEvent('caseupdated', { detail: { updatedCase: this.selectedCase } });
        this.dispatchEvent(caseUpdatedEvent);
    };
}
