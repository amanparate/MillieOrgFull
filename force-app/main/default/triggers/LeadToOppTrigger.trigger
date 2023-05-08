trigger LeadToOppTrigger on Lead (after insert, after update) {

    Map<Id, Lead> leadIdmap = new Map<Id, Lead>();
    for(Lead objLead : trigger.new){
        leadIdmap.put(objLead.Id, objLead);
    }
    
    List<Opportunity> oppList = new List<Opportunity>();
    for(Opportunity objOpp : [select id from Opportunity where Id IN : leadIdmap.keySet()]){
        oppList.add(objOpp);
    }
    
}