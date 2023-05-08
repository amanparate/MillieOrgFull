trigger AccountContactTraverse on Account (before update) {

    Map<Id,Account> accMap = new Map<Id,Account>();
    for(Account objAcc : trigger.new){
       if(objAcc.Type != trigger.oldMap.get(objAcc.Id).Type)
            accMap.put(objAcc.Id, objAcc);
    }
    
    List<Contact> conList = new List<Contact>();
    if(!conList.isEmpty()){
        for(Contact objCon : [select id, Level__c,AccountId,FirstName,LastName,CreatedDate from Contact where Level__c!='Tertiary' 
                              and AccountId IN : accMap.keySet() order by CreatedDate desc]){
            conList.add(objCon);
            System.debug('Contac Created = '+objCon.FirstName+' Date = '+objCon.CreatedDate);                      
        }
    }
    
    for(Contact objCon : conList){
        if(accMap.containsKey(objCon.AccountId)){
            if(objCon.Level__c=='Primary' && accMap.get(objCon.AccountId).Type=='Prospect'){
                accMap.get(objCon.AccountId).Description = objCon.FirstName+' '+objCon.LastName;
            }
            
            if(objCon.Level__c=='Secondary' && accMap.get(objCon.AccountId).Type=='Other'){
                accMap.get(objCon.AccountId).Description = objCon.FirstName+' '+objCon.LastName;
            }
        }
    }

}