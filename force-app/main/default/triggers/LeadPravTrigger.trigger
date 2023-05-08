trigger LeadPravTrigger on Lead (before insert, before update) {
    
    Set<String> LeadSet = new Set<String>();
    for(Lead objLead : trigger.new){
        if(trigger.isInsert){       
            LeadSet.add(objLead.Id);
        }
        if(trigger.isUpdate){ 
            if( objLead.Name != trigger.oldMap.get(objLead.Id).Name || objLead.Email != trigger.oldMap.get(objLead.Id).Email ){
            LeadSet.add(objLead.Id);            
            }
        }
    }
        

    Map<Id, Lead> LeadMap = new Map<Id,Lead>();
 
    for(Lead objLead : [Select Id, Name, Email from Lead where ID IN : LeadSet]){
        LeadMap.put(objLead.Id, objLead);
    }
    for(Lead objLead : trigger.new){
        if(LeadMap.Containskey(objLead.Name)){
            objLead.addError(objLead.Name +'Duplicate Name');
            }
        if(LeadMap.Containskey(objLead.Email)){ 
            objLead.Email.addError(objLead.Email +'Duplicate Email');
            }
        }
}