import { LightningElement } from 'lwc';
import createContact from "@salesforce/apex/ContactProvider.createContact"


export default class ContactCreate extends LightningElement {

    conFName
    conLName
    conMName

    createContactHandler(){
        var inputFields = this.template.querySelectorAll("lightning-input");
        inputFields.forEach(element => {
            if(element.value == 'conFName'){
                this.conFName = element.value;
            }
            if(element.value == 'conLName'){
                this.conLName = element.value;
            }
            if(element.value == 'conMName'){
                this.conMName = element.value;
            }
        });
        console.log("First Name "+ this.conFName);
        console.log("Last Name "+ this.conLName);
        console.log("Middle Name "+ this.conMName);

    }
}