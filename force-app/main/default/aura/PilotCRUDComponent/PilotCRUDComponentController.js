({ 
     creatNewRecordHandler : function(component, event, helper) { 
     console.log('creatNewRecordHandler'); 
     component.set('v.recordFlag',true); 
     component.set('v.SearchInputFlag',false); 
     component.set('v.previewRecordFlag',false); 
 }, 
     saveButtonHandler : function(component, event, helper) { 
     console.log('saveButtonHandler'); 
     component.set('v.recordFlag',true); 
     helper.saveHelper(component, event, helper);
 }, 
     SearchMethod1Handler : function(component, event, helper) { 
     console.log('SearchMethod1Handler'); 
     component.set('v.recordFlag',true); 
     helper.SearchMethodHelper(component, event, helper); 
 }, 
     SearchMethod2Handler : function(component, event, helper) { 
     console.log('SearchMethod2Handler'); 
     helper.SearchMethodHelper(component, event, helper); 
     component.set('v.previewRecordFlag',true); 
 }, 
     updateHandler : function(component, event, helper) { 
     console.log('updatehandler'); 
     helper.UpdateHelper(component, event, helper); 
 }, 
     updateMethodHandler : function(component, event, helper) { 
     console.log('updateMethodHandler'); 
     component.set('v.previewRecordFlag',false); 
     component.set('v.recordFlag',true); 
     helper.SearchMethodHelper(component, event, helper); 
 }, 
     deleteHandler : function(component, event, helper) {  console.log('delete handler'); 
     confirm('Are you sure want to delete record of Pilot ID : '+component.get('v.objPilot.Name')); 
     helper.deleteHelper(component, event, helper); 
 } 
})