trigger preventDuplicatePANPilot on Pilot__c (before insert, before update, after undelete) {
   Set<String> pilotPANSet = new Set<String>();
        for(Pilot__c objPilot : trigger.new){
            if(!String.isBlank(objPilot.PAN_Card__c))
            pilotPANSet.add(objPilot.PAN_Card__c);
        }
    Map<String,Pilot__c> accMap = new Map<String,Pilot__c>();
        if(!pilotPANSet.isEmpty()){ 
            for(Pilot__c objPilot : [select id, PAN_Card__c from Pilot__c where PAN_Card__c IN : pilotPANSet]){
                accMap.put(objPilot.PAN_Card__c, objPilot);
            }
        }
    if(!accMap.isEmpty()){
        for(Pilot__c objPilot : trigger.new){
            objPilot.PAN_Card__c.addError(objPilot.PAN_Card__c +' PAN Card details is already found in our Database.');
        }
    }
}