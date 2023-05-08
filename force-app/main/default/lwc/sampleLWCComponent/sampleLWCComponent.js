import { LightningElement,api } from 'lwc';
import { concatenate, convertToUpperCase } from './util';

export default class SampleLWCComponent extends LightningElement {

    @api companyName = 'Company';
    firstName = 'firstName';
    lastName = 'lastName';
    firstTemplate = true;
    items =[{id : 1, name :'LWC'},{id : 2, name :'Traning'},{id : 3 , name : 'Cognizant'}];

    handleSwitch(){
        this.firstTemplate = this.firstTemplate === true ? false : true;
    }

    get upperCasedFullName(){
        return convertToUpperCase(this.firstName, this.lastName);
    }

    @api updateName(firstName,lastName){
        this.firstName = firstName;
        this.lastName = lastName;
    }

    handleChange(event){
        if(event.target.name == "firstName"){
            this.firstName = event.target.value;
        }else{
            this.lastName = event.target.value;
        }
    }
}