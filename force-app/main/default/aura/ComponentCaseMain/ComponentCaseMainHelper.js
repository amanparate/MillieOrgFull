({ 
     getCaseRecordHelper : function(component, event, helper) { 
     console.log('in getCaseRecord Helper'); 
     
     var action = component.get('c.fetchRecord'); 
     action.setParams({"objCase":component.get('v.objCase')}); 
     action.setCallback(this,function(response){ 
     var state= response.getState(); 
     if(state==="SUCCESS"){ 
     console.log('Sucess'); 
     console.log(JSON.stringify(response.getReturnValue())); 
     component.set('v.objCase',response.getReturnValue()); 
     component.set('v.ShowSpinner',false);
     var caseStatus = component.get('v.objCase.Status'); 
     console.log('recied data'+caseStatus);
     if(caseStatus==='New' || caseStatus=='Working'){ 
     component.set('v.buttonVarient', 'success'); 
     component.set('v.buttonLabel', 'Escalate'); 
     }
     else { 
         if(caseStatus==='Escalated'){ 
             component.set('v.buttonVarient', 'destructive'); 
         	 component.set('v.buttonLabel', 'Re-Open'); 
      } 
     	 } 
     } 
     else { 
     console.log('Error Hai'); 
     } 
     }); 
     $A.enqueueAction(action); 
 }, 
 reopenStatus: function(component, event, helper) { 
 console.log('in reopenStatus Helper'); 
 
 var action = component.get('c.reopenCase');
 action.setParams({"objCase":component.get('v.objCase')}); 
 action.setCallback(this,function(response){ 
 var state= response.getState(); 
 if(state==="SUCCESS"){ 
 console.log('Sucess'); 
 console.log(JSON.stringify(response.getReturnValue())); 
 component.set('v.objCase',response.getReturnValue()); 
 component.set('v.ShowSpinner',false);
 
 var toastEvent = $A.get("e.force:showToast"); 
 toastEvent.setParams({ 
 title : 'Success', 
 message: 'Case Re-Open Sucessfully....!', 
 duration:' 3000', 
 key: 'info_alt', 
 type: 'success', 
 mode: 'pester' 
 }); 
 toastEvent.fire(); 
 
 var caseStatus = component.get('v.objCase.Status'); 
 if(caseStatus==='New' || caseStatus=='Working'){ 
 component.set('v.buttonVarient', 'success'); 
 component.set('v.buttonLabel', 'Escalate'); 
 } else { 
 if(caseStatus==='Escalated'){ 
 component.set('v.buttonVarient', 'destructive'); 
 component.set('v.buttonLabel', 'Re-Open'); 
 } 
 } 
 } else { 
 console.log('Error Hai'); 
 } 
 }); 
 $A.enqueueAction(action); 
 } 
})