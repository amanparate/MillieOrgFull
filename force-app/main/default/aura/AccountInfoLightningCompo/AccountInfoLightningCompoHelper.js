({
	helperMethod : function(component, event, helper) {
		var action = component.get('c.getAccountDetails');
        action.setParams({"objAccount": component.get('v.objAccount')});
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                	component.set('v.objAccount',response.getReturnValue());
            }
            else{
                console.log('Something went Wrong');
            }
        });
        $A.enqueueAction(action);
	}
})