({ 
     saveCaseEscationReason : function(component, event, helper) { 
         console.log('in saveCaseEscationReason Handler'); 
         helper.saveEscalationReason(component, event, helper); 
     }, 
     closeModel : function(component, event, helper) { 
         console.log('in closeModel Handler'); 
         var sendFlag = component.getEvent('myCaseEvent'); 
         sendFlag.setParams({"popUpBoxValue": false});
         sendFlag.fire(); 
     } 
})