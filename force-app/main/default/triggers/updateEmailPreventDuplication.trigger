trigger updateEmailPreventDuplication on Contact (before insert, before update) {
    
    Set<Id> AccIdSet = new Set<Id>();
    for(Contact objContact : trigger.new){
        AccIdSet.add(objContact.AccountId);
    }
    
    Map<Id, Account> accMap = new Map<Id, Account>();
    
    for(Account objAccount : [select id, Email_ID__c from Account where Id IN : AccIdSet]){
        accMap.put(objAccount.Id, objAccount);
    }
    
    for(Contact objContact : trigger.new){
        if(accMap.containsKey(objContact.AccountId)){
            if(objContact.Email == accMap.get(objContact.AccountId).Email_ID__c){
                objContact.Email.addError(objContact.Email +' Duplication of Email is detected.');
            }
        } 
    }

}