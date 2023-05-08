trigger PilotToAddressTest on Pilot__c (after insert, after update) {

    Map<Id, Pilot__c> pilotMap = new Map<Id,Pilot__c>();
    for(Pilot__c objPilot : trigger.new){
        pilotMap.put(objPilot.Id, objPilot);
    }
    
    List<Addresss__c> addressList = new List<Addresss__c>();
    for(Addresss__c objAddress : [select id, Pilotz__c,Pilot_Full_Name__c from Addresss__c where Pilotz__r.Id IN : pilotMap.keySet()]){
        addressList.add(objAddress);
    }
    //List<Addresss__c> addressUpdateList = new List<Addresss__c>();
    for(Addresss__c objAddress : addressList){
        if(pilotMap.containsKey(objAddress.Pilotz__c)){
             pilotMap.get(objAddress.Pilotz__c).Status__c = objAddress.Status__c;
        }        
    }
    Database.update(addressList, false);
}