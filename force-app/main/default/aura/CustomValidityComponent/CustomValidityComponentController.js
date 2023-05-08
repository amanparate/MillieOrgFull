({
	checkAccountNameHandler : function(component, event, helper) {		
        var accNamefield = component.find('accNameId');
        var accName = accNamefield.get('v.value');
        if(accName.length < 3 || accName.length > 10){
            accNamefield.setCustomValidity("Account Name must be atleast 3 Characters and not more than 10 Characters");            
        }
        else{
            accNamefield.setCustomValidity("");
        }
        accNamefield.reportValidity();
	}
})