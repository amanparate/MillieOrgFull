//Write a trigger on update of Account Date field all the child Contact date field should get updated

trigger AccountDateFieldUpdate on Account (after update) {
    
    Map<Id, Account> accMap = new Map<Id,Account>();
    for(Account objAcc : trigger.new){
        accMap.put(objAcc.Id, objAcc);
    }
    
    List<Contact> conList = new List<Contact>();
    for(Contact objCon : [ select id, Date__c, AccountId from Contact where AccountId IN : accMap.keySet() ] ){
        conList.add(objCon);
    }
    
    List<Contact> conUpdateList = new List<Contact>();
    for(Contact objCon : conList){
        if(accMap.containsKey(objCon.AccountId)){
                objCon.Date__c = accMap.get(objCon.AccountId).SLAExpirationDate__c ;
            
            conUpdateList.add(objCon);
        }        
    }
    Database.update(conUpdateList, false);    
}