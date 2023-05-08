trigger AccountRegNoDuplicationPrevent on Account (before insert, before update) {

    Set<String> accSet = new Set<String>();
    for(Account objAcc : trigger.new){
        if(String.isNotBlank(objAcc.Registration_Number__c)){
            accSet.add(objAcc.Registration_Number__c);
        }
    }
    
    Map<String, Account> accMap = new Map<String, Account>();    
    for(Account objAcc : [select id, Name, Registration_Number__c from Account where Registration_Number__c IN : accSet ]){
        accMap.put(objAcc.Registration_Number__c, objAcc);
    }
    
    for(Account objAcc : trigger.new){
        if(accMap.containsKey(objAcc.Registration_Number__c)){
            objAcc.Registration_Number__c.addError(objAcc.Registration_Number__c+' Duplication is found.');
        }
    }
}