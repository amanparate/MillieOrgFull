import { LightningElement } from 'lwc';
// import getAccountData from '@salesforce/apex/pravinaCompoClassToGetContacts.getAccountData'

export default class PravinaCompo extends LightningElement {

    data = 'Aman';


    handleClick(event){
        alert('dataId is '+event.target.value);
    }
}