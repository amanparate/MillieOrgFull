import { LightningElement } from 'lwc';

export default class OwnerComponent extends LightningElement {

    eventParams = {};

    handleUpdateName(){
        this.template.querySelector('c-c/calculator').updateName('Cognizant','Technology');
    }

    handleSampleEvent(event){
        this.eventParams = event.detail;
    }
}