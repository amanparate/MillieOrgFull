({ 
 	saveHelper : function(component, event, helper) { 
 	console.log('savehelper'); 
 
     var action= component.get('c.createRecord'); 
     action.setParams({"objPilot":component.get('v.objPilot')}); 
     action.setCallback(this,function(response){ 
     var state=response.getState(); 
     if(state==='SUCCESS'){ 
     		console.log('Record Created Sucessfully ...!');
         	alert(component.get('v.objPilot.First_Name__c')+' record created Successfully. ');
     }
     else { 
     	console.log('Error Ocuur While Creating Record....');
        alert(component.get('v.objPilot.First_Name__c')+' There is some issue while Creating this Record. ');
     } 
     }); 
     	$A.enqueueAction(action); 
     }, 
     SearchMethodHelper : function(component, event, helper) { 
     	console.log('search helper'); 
     
     	var action= component.get('c.searchRecord');
     	action.setParams({"objPilot":component.get('v.objPilot')}); 
     	action.setCallback(this, function(response){ 
     	var state = response.getState(); 
     
     	if(state==='SUCCESS'){ 
     		console.log('Yes'+JSON.stringify(response.getReturnValue())); 
     
     		component.set('v.objPilot', response.getReturnValue()); 
     	} 
     	else{ 
     		console.log('Zool...!!!');
            alert("Invalid Pilot ID is Provided. Kindly Enter Valid Pilot ID. ");
     	} 	
     	}); 
     		$A.enqueueAction(action); 
     	}, 
     		UpdateHelper : function(component, event, helper) { 
     			console.log('Update helper'); 
     
     		var action= component.get('c.updateRecord'); 
     		action.setParams({"objPilot":component.get('v.objPilot')}); 
     		action.setCallback(this,function(response){ 
     		var state=response.getState(); 
     		if(state==='SUCCESS'){ 
     			console.log('Record Updated Sucessfully ...!'); 
    		 }
             else { 
     			console.log('Error Ocuur While Updating Record....'); 
     		}
            }); 
     			$A.enqueueAction(action); 
     		}, 
     		deleteHelper : function(component, event, helper) { 
     		console.log('Delete helper'); 
     
     		var action= component.get('c.deleteRecord'); 
            console.log('Delete helper 2');
     		action.setParams({"objPilot":component.get('v.objPilot.Name')});
                console.log('Delete helper 3');
     		action.setCallback(this,function(response){ 
     		var state=response.getState(); 
     		if(state==='SUCCESS'){ 
     			console.log('Record Deleted Sucessfully ...!'); 
     			alert('Record Deleted Sucessfully...!') 
     		}
            else { 
     			console.log('Error Ocuur While deleting Record....');
                alert('There is some issue while deleting record ');
     
     		} 
     		});
            console.log('Delete helper 4');
     		$A.enqueueAction(action); 
            console.log('Delete helper 5');
     		} 
 
})