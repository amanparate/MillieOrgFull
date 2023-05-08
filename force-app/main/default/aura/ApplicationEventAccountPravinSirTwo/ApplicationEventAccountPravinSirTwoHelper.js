({
	Component_B_Handler : function(component, event, helper)
 	{
        console.log('In JS Helper Comp B');
         var action = component.get('c.getRecords');
         action.setParams({"accType":event.getParam("acctypeEvent"),"limitValue":event.getParam("sliderValueAtEvent")});
         action.setCallback(this,function(response)
         {
         var state = response.getState();
         if(state==='SUCCESS')
         {
        console.log('Return Value'+JSON.stringify(response.getReturnValue())); 
         component.set('v.accList',response.getReturnValue());
         }
         else
         {
         console.log('something went Wrong! ');
         }
         });
         $A.enqueueAction(action);
	}
})