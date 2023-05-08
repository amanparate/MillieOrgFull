import { LightningElement, api, wire } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import ACCOUNT_NAME from '@salesforce/schema/Account.Name';
import OWNER_NAME_FIELD from '@salesforce/schema/Account.Owner.Name';
import OWNER_EMAIL_FIELD from '@salesforce/schema/Account.Owner.Email';

import { getRecord, getFieldValue } from 'lightning/uiRecordApi';

export default class ViewAccountParent extends LightningElement {

    @api recordId;

    nameField = ACCOUNT_NAME;
    objectName = ACCOUNT_OBJECT;
    // ownerNameField = OWNER_NAME_FIELD;
    // ownerEmailField = OWNER_EMAIL_FIELD;

    @wire(getRecord, {recordId:"$recordId",fields:[OWNER_NAME_FIELD,OWNER_EMAIL_FIELD]}) record;

    get ownerEmailField(){

        return getFieldValue(this.record.data,OWNER_NAME_FIELD);
    }

    get ownerNameField(){

        return getFieldValue(this.record.data,OWNER_EMAIL_FIELD);
    }

}