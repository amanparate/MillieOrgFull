({
	checkPilotNameHandler : function(component, event, helper) {
		
	},
    doInit : function(component, event, helper) {
    	component.set('v.pilotId', component.get('v.recordId'));
    }
})