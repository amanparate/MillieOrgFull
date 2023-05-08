import { LightningElement,wire } from 'lwc';
import getContacts from '@salesforce/apex/LightningController.getContacts';
import updateContacts from '@salesforce/apex/LightningController.updateContacts';
import {ShowToastEvent} from 'lightning/platformShowToastEvent';

const COLS = [
    {label:'First Name',fieldName:'FirstName',editable:true},
    {label:'Last Name',fieldName:'LastName',editable:true},
    {label:'Phone',fieldName:'Phone',type:'phone'},
    {label:'Email',fieldName:'Email',type:'email'}
];

export default class ApexComponent extends LightningElement {
    columns = COLS;
    draftValues = [];
    error;
    @wire(getContacts) contact;
     //to be used to save the records
     handleSave(event){
        const updatedFields = event.detail.draftValues;
        //Calling Apex method
        updateContacts({data:updatedFields})
        .then((result)=>{
                this.dispatchEvent(new ShowToastEvent(
                    {
                        title:'Success',
                        message:'Records updated',
                        variant:'success'
                    }
                ));
        })
        .catch((error)=> {
            this.error = error;
        });
     }
}