({
	SearchMethodHandler : function(component, event, helper) {
		console.log('search Method handler');
        component.set('v.ShowFlag',true);
        helper.SearchMethodHelper(component, event, helper);
        component.set('v.ShowRecordFlag',true);        
	},
})