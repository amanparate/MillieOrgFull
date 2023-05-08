({
	SearchMethodHelper : function(component, event, helper) {
		console.log('search helper');
                
        var action= component.get('c.searchRecord');
        action.setParams({"PilotId":component.get('v.objPilot.Name')});
        action.setCallback(this,function(response){
            var state=response.getState();
            if(state==='SUCCESS'){
                console.log('Record Created Sucessfully ...!'+JSON.stringify(response.getReturnValue()));
                component.set('v.objPilot',response.getReturnValue());
            } else {
                console.log('Error Ocuur While Record Creation...');
            }
        });
        $A.enqueueAction(action);
	},
})