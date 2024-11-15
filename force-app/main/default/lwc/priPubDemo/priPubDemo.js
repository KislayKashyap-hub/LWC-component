import { api, LightningElement } from 'lwc';

export default class PriPubDemo extends LightningElement {
    message = 'Public Message';
    @api recordId;
}