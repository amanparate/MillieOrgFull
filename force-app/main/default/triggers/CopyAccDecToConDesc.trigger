trigger CopyAccDecToConDesc on Contact (before insert) {

    Set<ID> accIDSet = new Set<ID>();
    for(Contact objCon : trigger.new){
        if(objCon.AccountId!=null){
                accIDSet.add(objCon.AccountId);
        }
    }
    
    Map<ID,Account> accMap = new Map<ID,Account>();
    if(!accIDSet.isEmpty()){
            for(Account objAcc : [select id,Description from Account where Id IN : accIDSet]){
                accMap.put(objAcc.Id, objAcc);
            }
    }
    
    if(!accMap.isEmpty()){
            for(Contact objCon : trigger.new){
                if(accMap.containsKey(objCon.AccountId)){
                    if(!String.isBlank(accMap.get(objCon.AccountId).Description)){
                        objCon.Description = accMap.get(objCon.AccountId).Description;
                    }
                }
            }
    }
    
}