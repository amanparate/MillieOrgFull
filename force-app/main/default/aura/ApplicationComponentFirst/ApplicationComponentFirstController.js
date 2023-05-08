({
	FirstCompoHandler : function(component, event, helper) {
		console.log('In JS Handler');
        var myEventComponent1 = $A.get('e.c:ApplicationComponentEvent');
        myEventComponent1.setParams({"sliderEventValue" : component.get('v.Slider')});
        console.log(component.get('v.Slider'));
        myEventComponent1.fire();

	}
})