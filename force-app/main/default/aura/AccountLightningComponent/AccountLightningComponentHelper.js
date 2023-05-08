({
	selectedAccTypeHelper : function(component, event, helper) {
	var action = component.get('c.getAccountRecords');
        action.setParams({"accountType" : component.find('accType').get('v.value')});
        action.setCallback(this, function(response){
            if(response.getState() ==='SUCCESS'){
                console.log(JSON.stringify(response.getReturnValue()));
                component.set('v.accList',  response.getReturnValue());
            }
            else{
                
            }
        });
        $A.enqueueAction(action);
	},
    
    getContactRecordsHelper : function(component, event, helper) {
        var action = component.get('c.getContacts');
        action.setParams({"parentID" : component.get('v.selectedAccID')});
        action.setCallback(this, function(response){
            if(response.getState() ==='SUCCESS'){
                console.log(JSON.stringify(response.getReturnValue()));
                component.set('v.contactList', response.getReturnValue());
            }
            else{
                
            }
        });
        $A.enqueueAction(action);
	
    }
})