global class BatchAddresstoPilot implements Database.Batchable<sObject> {
	
    global Database.QueryLocator start(Database.BatchableContext BC){
        
        return Database.getQueryLocator('select id, City__c , Pilotz__r.Passport_Type__c , Address_Verified__c from Addresss__c where City__c = \'Nagpur\'  and CreatedDate > LAST_MONTH ');
    }
    
    global void execute(Database.BatchableContext BC, List<Addresss__c> addrList){
        Set<Id> pilotIdSet = new Set<Id>();
        if(!addrList.isEmpty()){
            for(Addresss__c objAddr : addrList){
                pilotIdSet.add(objAddr.Pilotz__c);
            }
        }
        
        Map<Id, Pilot__c> pilotMap = new Map<Id, Pilot__c>();
        for(Pilot__c objPilot : [select id, Passport_Type__c from Pilot__c where Passport_Type__c = 'Major' and CreatedDate > LAST_MONTH ]){
            pilotMap.put(objPilot.Id, objPilot);
        }
        
        List<Pilot__c > pilotUpdateList = new List<Pilot__c>();
        for(Addresss__c objAddr : addrList){
            if(pilotMap.containskey(objAddr.Pilotz__c)){
                objAddr.Address_Verified__c = true ;
            }
        }
        pilotUpdateList.addAll(pilotMap.values());
        Database.update(pilotUpdateList, false);
    }
    
    global void finish(Database.BatchableContext BC){
        
    }
}