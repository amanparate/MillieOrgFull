({
	helperMethod : function(component, event, helper) {
        
        var action = component.get('c.createPilot'); 
        action.setParams({"objPilot":component.get('v.objPilot')}); 
        action.setCallback(this, function(response){ 
            var state = response.getState();
            if(state==='SUCCESS') {  
                alert('New Pilot Record Created successfully...!!!');
                }
            else{
                alert('Error, there is some issue...!!!!');
            }
        });
        
        $A.enqueueAction(action);         	
	}
})