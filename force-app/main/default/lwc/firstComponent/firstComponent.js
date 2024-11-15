// 1Component.js
import { LightningElement } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class FirstComponent extends NavigationMixin(LightningElement) {
    handleNavigation() {
        // Navigate to the Lightning App Page created for the second component
        this[NavigationMixin.Navigate]({
            type: 'standard__navItemPage',
            attributes: {
                // Replace 'Second_Component_Page' with the actual API name of your Lightning App Page
                apiName: 'Second_Component_Page'
            }
        });
    }
}
