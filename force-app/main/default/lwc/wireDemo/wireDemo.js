import { LightningElement, api, wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';

// import NAME_FIELD from '@salesforce/schema/Account.Name';
// import PHONE_FIELD from '@salesforce/schema/Account.Phone';

export default class WireDemo extends LightningElement {
    @api recordId;

    @wire(getRecord, { recordId: '$recordId', fields: ['Account.Name', 'Account.Phone'] }) // data calling through strings
    record; // data or error

    get name() {
        return this.record.data ? getFieldValue(this.record.data, 'Account.Name') : '';
    }
    get phone() {
        return this.record.data ? getFieldValue(this.record.data, 'Account.Phone') : '';
    }
}