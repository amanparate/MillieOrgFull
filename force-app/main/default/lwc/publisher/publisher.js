import { LightningElement, wire } from 'lwc';
import { fireEvent } from 'c/pubsub';
import {CurrentPageReference} from 'lightning/navigation';
export default class Publisher extends LightningElement {

    message = 'default message';

    @wire(CurrentPageReference) pageRef;

    handleChange(event){
        this.message = event.target.value;
    }
    
    handleClick(){
            fireEvent(this.pageRef,'pubsubevent',this.message);
    }

}