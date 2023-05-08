//Write a trigger on update of Account Date field all the child Contact date field should get updated
trigger AccountToContactDateTrigger on Account (after update) {
    Map<Id, Account> accMap = new Map<Id, Account>();
    for(Account objAccount : trigger.new){
        accMap.put(objAccount.Id, objAccount);
    }
    
    List<Contact> conList = new List<Contact>();
    for(Contact objContact : [select id, Date__c, AccountId from Contact where AccountId IN : accMap.keySet()]){
        conList.add(objContact);
    }
    
    for(Contact objContact : conList){
        if(accMap.containsKey(objContact.AccountId)){
            objContact.Date__c = accMap.get(objContact.AccountId).SLAExpirationDate__c ;
        }
    }
    Database.update(conList);
}