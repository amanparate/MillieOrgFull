trigger ContactAccountTraverse on Contact (after insert) {
    
    Set<ID> accIDSet = new Set<ID>();
    
    for(Contact objCon : trigger.new){
        if(objCon.AccountId != null){
                accIDSet.add(objCon.AccountId);
        }
    }
    
    Map<ID,Account> accMap = new Map<Id,Account>();
    
    if(!accIDSet.isEmpty()){
            for(Account objAcc : [select id, Description from Account where ID IN :accIDSet]){
                accMap.put(objAcc.Id,objAcc);
            }
    }
    
    List<Account> accListUpdate = new List<Account>();
    
    if(!accMap.isEmpty()){
            for(Contact objCon : trigger.new){
                        if(accMap.containsKey(objCon.AccountId)){
                            accMap.get(objCon.AccountId).Description = objCon.FirstName +' '+objCon.LastName;
                        }
            }
        
        accListUpdate.addAll(accMap.values());
    }
    
    if(!accListUpdate.isEmpty()){
     Database.update(accListUpdate,false);
    }
    
    
}