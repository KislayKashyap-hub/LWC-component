import { LightningElement } from 'lwc';

export default class RenderingListForEach extends LightningElement {
    contacts = [
        {
            Id: 1,
            Name: 'Om',
            Title: 'Civil Engineer',
        },
        {
            Id: 2,
            Name: 'Jaya',
            Title: 'Doctor',
        },
        {
            Id: 3,
            Name: 'Sai',
            Title: 'Mechanical Engineer',   
        },
        {
            Id: 4,
            Name: 'Nikhita',
            Title: 'Law Student',   
        },
        {
            Id: 5,
            Name: 'Sowmya',
            Title: 'Doctor',   
        },
        {
            Id: 6,
            Name: 'Rama',
            Title: 'Law Student',   
        }, 
    ]
};