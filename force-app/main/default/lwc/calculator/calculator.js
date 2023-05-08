import { LightningElement, api } from 'lwc';
import EnglishTitle from '@salesforce/label/c.EnglishTitle';
import HindiTitle from '@salesforce/label/c.HindiTitle';
import SpanishTitle from '@salesforce/label/c.SpanishTitle';
import Num1English from '@salesforce/label/c.Num1English';
import Num1Hindi from '@salesforce/label/c.Num1Hindi';
import Num1Spanish from '@salesforce/label/c.Num1Spanish';
import Num2English from '@salesforce/label/c.Num2English';
import Num2Hindi from '@salesforce/label/c.Num2Hindi';
import Num2Spanish from '@salesforce/label/c.Num2Spanish';
import ResultEnglish from '@salesforce/label/c.ResultEnglish';
import ResultHindi from '@salesforce/label/c.ResultHindi';
import ResultSpanish from '@salesforce/label/c.ResultSpanish';

export default class Calculator extends LightningElement {
Num1;
Num2;
result;
title = EnglishTitle;
num1label = Num1English;
num2label = Num2English;
resultlabel = ResultEnglish;
@api companyName = "Company";
firstName = 'firstName';
lastName = 'lastName';
value;

@api handleUpdateName(firstName, lastName){
    this.firstName = firstName;
    this.lastName = lastName;
}
handleComboChange(evt){
    console.log('evt.target.value'+evt.target.value);
    this.value = evt.target.value;
    switch(this.value){
        case 'English':
            this.title = EnglishTitle;
            this.num1label = Num1English;
            this.num2label = Num2English;
            this.resultlabel = ResultEnglish;
            break;
        case 'Hindi':
            this.title = HindiTitle;
            this.num1label = Num1Hindi;
            this.num2label = Num2Hindi;
            this.resultlabel = ResultHindi;
            break;
        case 'Spanish':
            this.title = SpanishTitle;
            this.num1label = Num1Spanish;
            this.num2label = Num2Spanish;
            this.resultlabel = ResultSpanish;
            break;
    }
}

get options(){
    return [
        {label:'English',value:'English'},
        {label:'Hindi',value:'Hindi'},
        {label:'Spanish',value:'Spanish'},
    ];
}

handleChange(event){
    console.log('event'+event.target.value);
    if(event.target.name=='Num1'){
        this.num1 = parseInt(event.target.value);
    }else{
        this.num2 = parseInt(event.target.value);
    }
}

handleClick(evt){
    switch(evt.target.name){
        case '+':
            this.result = this.num1+this.num2;
            break;
        case '-':
            this.result = this.num1 - this.num2;
            break;
        case '*':
            this.result = this.num1 * this.num2;
            break;
        case '/':
            this.result = this.num1 / this.num2;
            break;
    }
}

handleChange(event){
    if(event.target.name == "firstName"){
        this.firstName = event.target.value;
    }else{
        this.lastName = event.target.value;
    }
}

handleNotifyParent(event){
    let eventDetail = {fname:this.firstName, lname:this.lastName};
    let evt = new CustomEvent('sampleevent',{detail:eventDetail});
    this.dispatchEvent(evt);
}

    
}