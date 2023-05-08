trigger ContactTrigger on Contact(after insert, after update, after delete, after undelete){

    Set<Id> accIdSet = new Set<Id>();
    if(trigger.isAfter && trigger.isInsert || trigger.isAfter && trigger.isUpdate || trigger.isAfter && trigger.isUnDelete ){
        for(Contact objContact : trigger.new){          
            accIdSet.add(objContact.AccountId);
        }
    }
    
    Map<Id, Account> accIdMap = new Map<Id, Account>();
    if(trigger.isAfter && trigger.isInsert || trigger.isAfter && trigger.isUpdate || trigger.isAfter && trigger.isUnDelete ){
        for(Account objAccount : [select id, Amount_1__c, Amount_2__c from Account where Id IN : accIdSet ]){
            accIdMap.put(objAccount.id , objAccount);
        }
    }
    List<Account> accUpdateList = new List<Account>(); 
    for(Contact objContact : trigger.new){
        if(trigger.isAfter && trigger.isInsert || trigger.isAfter && trigger.isUpdate || trigger.isAfter && trigger.isUnDelete ){
            if(accIdMap.containsKey(objContact.AccountId)){
                 accIdMap.get(objContact.AccountId).Amount_1__c = objContact.Amount_1__c ;
                 accIdMap.get(objContact.AccountId).Amount_2__c = objContact.Amount_2__c ;                
            }
        }   
    }
    if(trigger.isBefore && trigger.isDelete){
            Set<Id> accIdSet = new Set<Id>();
                for(Contact objContact : trigger.new){          
                accIdSet.add(objContact.AccountId);
            }
        
        
        Map<Id, Account> accIdMap = new Map<Id, Account>();    
            for(Account objAccount : [select id, Amount_1__c, Amount_2__c from Account where Id IN : accIdSet ]){
                accIdMap.put(objAccount.id , objAccount);
            } 
        
         List<Account> accUpdateList = new List<Account>(); 
        for(Contact objContact : trigger.new){
            accIdMap.get(objContact.AccountId).Amount_1__c = objContact.Amount_1__c - accIdMap.get(objContact.AccountId).Amount_1__c;
            accIdMap.get(objContact.AccountId).Amount_2__c = objContact.Amount_2__c - accIdMap.get(objContact.AccountId).Amount_2__c;
        }
        	
    }
    accUpdateList.addAll(accIdMap.values());    
    Database.update(accupdateList, false);
}