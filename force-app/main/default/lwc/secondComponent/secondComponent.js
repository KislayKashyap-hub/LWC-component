// 2Component.js
import { LightningElement } from 'lwc';

export default class SecondComponent extends LightningElement {
    firstName = '';
    lastName = '';
    fullName = '';

    handleFirstNameChange(event) {
        this.firstName = event.target.value;
        this.updateFullName();
    }

    handleLastNameChange(event) {
        this.lastName = event.target.value;
        this.updateFullName();
    }

    updateFullName() {
        // Combine first name and last name to create full name
        if (this.firstName && this.lastName) {
            this.fullName = `${this.firstName} ${this.lastName}`;
        } else {
            this.fullName = '';
        }
    }
}
