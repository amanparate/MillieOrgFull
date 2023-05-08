({ 
     getCaseRecord : function(component, event, helper) { 
     console.log('in getCaseRecord Handler'); 
     helper.getCaseRecordHelper(component, event, helper); 
     component.set('v.ShowSpinner',true); 
 }, 
     EscalateCaseRecord: function(component, event, helper) { 
     console.log('in EscalateCaseRecord Handler');
     var button =event.getSource('').get('v.label'); 
     console.log('button value:'+button); 
     if(button==='Escalate'){ 
     	component.set('v.ShowPopupBox',true); 
     } 
     else { 
         if(button==='Re-Open'){ 
         component.set('v.ShowSpinner',true); 
         helper.reopenStatus(component, event, helper); 
         } 
     } 
 }, 
     closePopBox: function(component, event, helper) { 
     console.log('in closePopBox Handler'); 
     helper.getCaseRecordHelper(component, event, helper); 
     component.set('v.ShowPopupBox',event.getParam('popUpBoxValue')); 
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
 
})