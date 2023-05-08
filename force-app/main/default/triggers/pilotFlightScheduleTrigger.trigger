trigger pilotFlightScheduleTrigger on Pilot_Flight_Schedule__c (after insert) {
	Set<Id> pilotIdSet = new Set<Id>();
    for(Pilot_Flight_Schedule__c objPilFlight : trigger.new){
        pilotIdSet.add(objPilFlight.Pilot__c);
    }
    
    Map<Id, Pilot__c> pilotMap = new Map<Id, Pilot__c>();
    for(Pilot__c objPilot : [select id, First_Name__c from Pilot__c where id IN : pilotIdSet ]){
        pilotMap.put(objPilot.Id, objPilot);
    }
    
    List<Pilot_Flight_Schedule__c> pilFlightList = new List<Pilot_Flight_Schedule__c>();
    for(Pilot_Flight_Schedule__c objPilFlight : trigger.new){
        if(pilotMap.containsKey(objPilFlight.Id)){
            if(pilotMap.get(objPilFlight.Id).First_Name__c != null){
                objPilFlight.Pilot_Name__c = pilotMap.get(objPilFlight.Id).First_Name__c;
                pilFlightList.add(objPilFlight);
            }
        }
    }
	Database.update(pilFlightList);    
}