import { LightningElement } from 'lwc';

export default class PocForLWCToggle extends LightningElement {

    variable = 'true';

    handleClick(){
        this.variable = 'false';
    }
}