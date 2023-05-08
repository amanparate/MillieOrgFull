({
	compoOneHandler : function(component, event, helper) {
        console.log('I m in JS ' + component.find('accType').get('v.value'));
        var myEventComponent1 = $A.get('e.c:ApplicationComponentAccountEvent ');
        myEventComponent1.setParams({"compoOneEventAttribute" : component.find('accType').get('v.value')});
        myEventComponent1.fire();
    }
})