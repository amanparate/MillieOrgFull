({
	compoTwoHandler : function(component, event, helper) {
        var recievedAccData =  event.getParam('compoOneEventAttribute');  
        console.log('Recieved in Compo 2 = '+ recievedAccData);        
        
        component.set('v.accTablecolumns', [
            {label: 'Id', fieldName: 'Id', type: 'text'},
            {label: 'Account Name', fieldName: 'Name', type: 'text'},
            {label: 'Type', fieldName: 'Type', type: 'text'},
            {label: 'SLA', fieldName: 'SLA__c', type: 'text'}
        ]);
        
        component.set('v.accList',recievedAccData);
        helper.helperMethod(component, event, helper);
		 
	}
})