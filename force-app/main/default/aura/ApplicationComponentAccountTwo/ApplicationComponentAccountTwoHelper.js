({
	helperMethod : function(component, event, helper) {
		var action = component.get('c.getAccountRecords');
        action.setParams({"accountType" : event.getParam('compoOneEventAttribute')});
        action.setCallback(this,function(response){
          var state = response.getState();
            if(state ==='SUCCESS'){
                component.set('v.accList',response.getReturnValue());
             	console.log('Success');
            }
            else{
                console.log('Error');
            }
        });
        $A.enqueueAction(action);
	}
})