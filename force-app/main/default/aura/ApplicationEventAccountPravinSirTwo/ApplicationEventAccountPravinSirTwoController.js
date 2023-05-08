({
	Component_B_Handler : function(component, event, helper) 
 	{
            console.log('In JS Controller Comp B');
             //Receive Data From Event & Store it in variable
             var receivedAccType = event.getParam("acctypeEvent");
             var receivedSliderValue = event.getParam("sliderValueAtEvent");
             
            console.log('Received Acc Type '+receivedAccType);
             console.log('Received Slider Value From Event :- '+receivedSliderValue);
             
            //Set Columns of Data Table
             component.set('v.tableColumns', [
             {label: 'Name', fieldName: 'Name', type: 'text'},
             {label: 'Type', fieldName: 'Type', type: 'text'},
             {label: 'SLA', fieldName: 'SLA__c', type: 'text'}
             ]);
             component.set('v.receivedSliderValue',receivedSliderValue); //Call Helper Method
             helper.Component_B_Handler(component, event, helper);
    }
})