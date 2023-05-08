import { LightningElement } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import ACCOUNT_NAME from '@salesforce/schema/Account.Name';
import ACCOUNT_WEBSITE from '@salesforce/schema/Account.Website';


export default class CreateAccount extends LightningElement {

    objectName = ACCOUNT_OBJECT;
    nameField = ACCOUNT_NAME;
    webSiteField = ACCOUNT_WEBSITE;
    accountId = '';
    name;
    website;

    handleSuccess(event){
        this.accountId = event.detail.id;
        this.name = '';
        this.website = '';
    }
}