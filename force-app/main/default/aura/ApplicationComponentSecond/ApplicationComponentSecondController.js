({
	recievedSecondHandler : function(component, event, helper) {
        var recievedData = event.getParam('sliderEventValue');
        console.log('Recieved : '+recievedData);
        component.set('v.Recieve',recievedData);
	}
})