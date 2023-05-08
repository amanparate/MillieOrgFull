trigger AccToConAmountTraverse on Contact (after insert, after update) {
    Set<Id> accIdSet = new Set<Id>();
    
    for(Contact objCon : trigger.new){
        accIdSet.add(objCon.AccountId);
    }
    
    Map<Id, Account> accMap = new Map<Id, Account>();
    
    for(Account objAccount : [select id, Amount_1__c, Amount_2__c from Account where id IN : accIdSet]){
        accMap.put(objAccount.Id, objAccount);
    }
    
    List<Account> accUpdateList = new List<Account>();
    
    for(Contact objCon : trigger.new){
        if(accMap.containsKey(objCon.AccountId)){
            accMap.get(objCon.AccountId).Amount_1__c = objCon.Amount_1__c;
            accMap.get(objCon.AccountId).Amount_2__c = objCon.Amount_2__c;
        }
    }
    accUpdateList.addAll(accMap.values());
    Database.update(accUpdateList);
    
}