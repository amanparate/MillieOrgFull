({
	myHandler : function(component, event, helper) {
        var conName = component.get('v.contactName');
         var conDepartment = component.get('v.contactDept');
         var conEmail = component.get('v.contactEmail');       
        var conAssistant = component.get('v.contactAssist');
        var conTitle = component.get('v.contactTitle');
        var conMailingStreet = component.get('v.contactMailSt');
        var conMailingCity = component.get('v.contactMailCity');
       alert('I am in Controller '+conName);
        
        helper.myHelper(component, event, helper);

	}
})