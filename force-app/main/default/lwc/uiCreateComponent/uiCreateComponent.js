import { LightningElement, wire } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import ACCOUNT_NAME from '@salesforce/schema/Account.Name';
export default class UiCreateComponent extends LightningElement {
    
    accountID;
    name;
    error;
    handleChange(event){
        this.name = event.target.value;
        this.accountID = undefined;
    }
    handleClick(){
        const fields = {};
        fields[ACCOUNT_NAME.fieldApiName]=this.name;
        const recordInput = {apiName:ACCOUNT_OBJECT.objectApiName,fields};
        createRecord(recordInput)
        .then(account=> {
            console.log('account'+JSON.stringify(account));
            this.accountID = account.id;
        })
        .catch(error=>{
            console.log('error'+JSON.stringify(error));
            this.error = error;
        })
    }
}