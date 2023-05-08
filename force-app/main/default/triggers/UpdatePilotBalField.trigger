trigger UpdatePilotBalField on Transaction__c (after insert, after update) {
    
    Set<Id> PilotIdSet = new Set<Id>();
    
    for(Transaction__c objTran : trigger.new){
        PilotIdSet.add(objTran.Transaction__c);
    }
    
    Map<Id, Pilot__c> pilotMap = new Map<Id, Pilot__c>();
    

}