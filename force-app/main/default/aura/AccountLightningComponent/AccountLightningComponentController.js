({
	selectedAccTypeHandler : function(component, event, helper) {
		
        component.set('v.accTablecolumns', [
            {label: 'Account Name', fieldName: 'Name', type: 'text'},
            {label: 'Type', fieldName: 'Type', type: 'text'},
            {label: 'SLA', fieldName: 'SLA__c', type: 'text'},
            {label: 'Annual Revenue', fieldName: 'AnnualRevenue', type: 'Decimal'},
            {label: 'Industry', fieldName: 'Industry', type: 'text'}
        ]);
        
        component.set('v.contactTablecolumns', [
            {label: 'First Name', fieldName: 'FirstName', type: 'text'},
            {label: 'LastName', fieldName: 'LastName', type: 'text'},
            {label: 'Email Address', fieldName: 'Email', type: 'text'}            
        ]);

        
        
        console.log('Selected = '+component.find('accType').get('v.value'));
        helper.selectedAccTypeHelper(component, event, helper);
	},
    
    selectedAccountRows  : function(component, event, helper) {
        console.log('IN selectedAccountRows JS');
        var selectedAccountRows =  event.getParam('selectedRows');// Array
        var selectedAccountID = selectedAccountRows[0].Id;
        console.log('Selected Account Record ID = '+selectedAccountID);
        component.set('v.selectedAccID', selectedAccountID);
        helper.getContactRecordsHelper(component, event, helper);
    }
})