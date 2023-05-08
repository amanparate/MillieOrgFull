import { LightningElement, api } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import ACCOUNT_NAME from '@salesforce/schema/Account.Name';
import ACCOUNT_WEBSITE from '@salesforce/schema/Account.Website';
import ACCOUNT_PHONE from '@salesforce/schema/Account.Phone';


export default class ViewAccount extends LightningElement {

    @api recordId;

    nameField = ACCOUNT_NAME;
    phoneField = ACCOUNT_PHONE;
    websiteField = ACCOUNT_WEBSITE;
    objectName = ACCOUNT_OBJECT;
}