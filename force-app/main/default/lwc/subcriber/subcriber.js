import { LightningElement, wire } from 'lwc';
import {CurrentPageReference} from 'lightning/navigation';
import { registerListener,unregisterAllListener } from 'c/pubsub';

export default class Subcriber extends LightningElement {

    receivedMessage = 'No message to show';

    @wire(CurrentPageReference) pageRef;

    connectedCallback(){
        registerListener('pubsubevent',this.handleEvent,this);
    }

    handleEvent(payload){
        this.receivedMessage = payload;
    }
    
    disconnectedCallback(){
        unregisterAllListener(this);
    }
}