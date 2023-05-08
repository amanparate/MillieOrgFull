import { LightningElement,track} from 'lwc';
import getAccounts from '@salesforce/apex/customSearchAccountController.getAccounts';
 
export default class SearchComponent extends LightningElement {
    key;
    @track accounts;
    updateKey(event){
        this.key = event.target.value;
    }

    handleSearch(){
        getAccounts({searchKey: this.key})
        .then(result =>{
            this.accounts = result;
        })
        .catch(error =>{
            this.accounts = null;
        });
    }
    cols = [
        { label: 'Account Name' , fieldName: 'Name' , type:'text' },
        { label: 'Phone' , fieldName: 'Phone' , type:'phone' },
        { label: 'Email' , fieldName: 'Email_ID__c' , type:'Email' },
    ]
}