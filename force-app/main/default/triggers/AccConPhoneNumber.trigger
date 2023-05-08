trigger AccConPhoneNumber on Contact (after update) {

    Set<Id> accIdSet = new Set<Id>();
        for(Contact objContact : trigger.new){
            if(objContact.Id != null && objContact.Phone != trigger.oldMap.get(objContact.Id).Phone){
                accIdSet.add(objContact.Id);
            }
        }    
    Map<Id, Account> accMap = new Map<Id, Account>();
        if(!accIdSet.isEmpty()){
            for(Account objAccount : [select Id, Phone from Account where Id IN : accIdSet ]){
                accMap.put(objAccount.Id, objAccount);
            } 
        }
    List<Account> accUpdateList = new List<Account>();
        for(Contact objContact : trigger.new){
           if(accMap.containsKey(objContact.AccountId)){         
                accMap.get(ObjContact.AccountId).Phone = objContact.Phone;
           }              
            accUpdateList.addAll(accMap.values());
        }    
    Database.update(accUpdateList,false);
}