({
	compoOneHandler : function(component, event, helper) {
		console.log('I m in JS ' + component.find('accType').get('v.value'));
        var typeselected = component.find('accType').get('v.value');
	}
})