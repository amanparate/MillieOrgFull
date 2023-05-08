trigger UpdateConToAcc on Contact (after insert, after update) {
    
    
    Set<Id> accIdSet = new Set<Id>();
    for( Contact objContact : trigger.new){
        accIdSet.add(objContact.AccountId);
    }
    
    Map<Id, Account> accMap = new Map<Id, Account>();
    
    for(Account objAccount : [select Id, Type,Description from Account where Id IN : accIdSet]){
        accMap.put(objAccount.Id, objAccount);
    }
    
    List<Account> accUpdateList = new List<Account>();  
    for( Contact objContact : trigger.new){
        if(accMap.containsKey(objContact.AccountId)){
            if(trigger.isAfter && trigger.isInsert){            
                if(objContact.LeadSource == 'Other'){
                    accMap.get(objContact.AccountId).Type = 'Customer - Direct';                    
                }
            }
            if(trigger.isAfter && trigger.IsUpdate){
                if(objContact.LeadSource == 'Phone Inquiry'){
                    accMap.get(objContact.AccountId).Description = 'Work in Progress';                    
                }
            }
        }
    }
    accUpdateList.addAll(accMap.values());
    if(!accUpdateList.isEmpty())
    Database.update(accUpdateList,false);
}