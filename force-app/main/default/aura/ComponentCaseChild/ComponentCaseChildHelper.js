({ 
     saveEscalationReason : function(component, event, helper) { 
         console.log('in saveEscalationReason Helper'); 
         
         var action= component.get('c.EscalateCase'); 
         action.setParams({"objCase":component.get('v.objCase')}); 
         action.setCallback(this, function(response){ 
         var state=response.getState(); 
             if(state==="SUCCESS"){ 
                 console.log('sucess'); 
                 console.log(JSON.stringify(response.getReturnValue())); 
                 var sendFlag = component.getEvent('myCaseEvent'); 
                 var toastEvent = $A.get("e.force:showToast"); 
                toastEvent.setParams({ 
                 title : 'Success', 
                 message: 'Case Escalated Sucessfully....!', 
                 duration:' 3000', 
                 key: 'info_alt', 
                 type: 'success', 
                 mode: 'pester' 
             }); 
             toastEvent.fire(); 
             sendFlag.setParams({"popUpBoxValue": false}); 
             sendFlag.fire(); 
             }
             else { 
                    console.log('failure'); 
             } 
 		}); 
 	$A.enqueueAction(action); 
 	} 
})