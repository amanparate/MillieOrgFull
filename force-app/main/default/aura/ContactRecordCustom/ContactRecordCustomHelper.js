({
	myHelper : function(component, event, helper) {
        /*var conFName= component.get('v.contactFName');
		var conLName= component.get('v.contactLName');
         var conDepartment = component.get('v.contactDept');
         var conEmail = component.get('v.contactEmail');       
        var conAssistant = component.get('v.contactAssist');
        var conTitle = component.get('v.contactTitle');  
        var conMailingStreet = component.get('v.contactMailSt');
        var conMailingCity = component.get('v.contactMailCity');*/
		alert('I am in helper '+component.get('v.contactName'));
		        
       var action = component.get('c.createContact')  //1
       alert('Step 1' );
        action.setParams({"contactName" : component.get('v.contactName'), "contactDept" : component.get('v.contactDept'),
                          "contactEmail" : component.get('v.contactEmail'), "contactAssist" : component.get('v.contactAssist'), "contactTitle" : component.get('v.contactTitle'),
                          "contactMailSt" : component.get('v.contactMailSt'),"contactMailCity" :  component.get('v.contactMailCity')}); //2
       alert('Step 2' );
        action.setCallback(this, function(response){ //4
            alert('step 4');
            var state = response.getState();
            if(state==='SUCCESS') {  
                alert('New Contact Created successfully...!!!');
                }
            else{
                alert('Error, there is some issue...!!!!');
            }
        });
        
        $A.enqueueAction(action);//3
		alert('Step 3');

        
	}
})