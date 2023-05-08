// Develop a Trigger to Prevent duplicate Lead Record based on FirstName, LastName, & Email

trigger Leadtrigger on Lead (before insert, before update) {

    Set<String> leadFirstNameSet = new Set<String>();
    Set<String> leadLastNameSet = new Set<String>();
    Set<String> leadEmailSet = new Set<String>();
    
    for(Lead objLead : trigger.new){
        if(trigger.isBefore){
            if(trigger.isInsert ){
                if(String.isNotBlank(objLead.FirstName)){
                    leadFirstNameSet.add(objLead.FirstName);
                }
                if(String.isNotBlank(objLead.LastName)){
                    leadLastNameSet.add(objLead.LastName);
                }
                if(String.isNotBlank(objLead.Email)){
                    leadEmailSet.add(objLead.Email);
                }
            }
            if(trigger.isUpdate){
                if(objLead.Name != trigger.oldMap.get(objLead.Id).FirstName || objLead.Name != trigger.oldMap.get(objLead.Id).LastName || objLead.Email != trigger.oldMap.get(objLead.Id).Email){
                    if(String.isNotBlank(objLead.FirstName)){
                        leadFirstNameSet.add(objLead.FirstName);
                    }
                    if(String.isNotBlank(objLead.LastName)){
                        leadLastNameSet.add(objLead.LastName);
                    }
                    if(String.isNotBlank(objLead.Email)){
                        leadEmailSet.add(objLead.Email);
                    }                    
                }
            }
        }
    }
    
    Map<String, Lead> leadFirstNameMap = new Map<String, Lead>();
    Map<String, Lead> leadLastNameMap = new Map<String, Lead>();
    Map<String, Lead> leadEmailMap = new Map<String, Lead>();
    
    for(Lead objLead : [select id,FirstName, LastName,Email from Lead where FirstName IN : leadFirstNameSet or LastName IN : leadLastNameSet or Email IN : leadEmailSet]){
        leadFirstNameMap.put(objLead.FirstName, objLead);
        leadLastNameMap.put(objLead.LastName, objLead);
        leadEmailMap.put(objLead.Email, objLead);
    }
    
    if(!leadFirstNameMap.isEmpty() || !leadLastNameMap.isEmpty() || !leadEmailMap.isEmpty() ){
        for(Lead objLead : trigger.new){
            if(leadFirstNameMap.containsKey(objLead.FirstName)){      
                objLead.FirstName.addError(objLead.FirstName + ' Duplicate First Name is Found in Database.');                
            }
            if(leadLastNameMap.containsKey(objLead.LastName)){
                objLead.LastName.addError(objLead.LastName + ' Duplicate Last Name is Found in Database.');
            }
            if(leadEmailMap.containsKey(objLead.Email)){
                objLead.Email.addError(objLead.Email + ' Duplicate Email ID found in Database.' );
            }
        }
    }    
 }