// Add Opp Amount in the Annual Revenue of its Related Account.
trigger OppToAccUpdate on Opportunity (after insert, after update){

    Set<Id> accIdSet = new Set<Id>();
    for(Opportunity objOpp : trigger.new){
        if(trigger.isAfter){ 
            if(trigger.isInsert){           
                    accIdSet.add(objOpp.AccountId);            
            }
            if(trigger.isUpdate){
                if(trigger.OldMap.get(objOpp.Id).Amount != ObjOpp.Amount){                
                        accIdSet.add(objOpp.AccountId);
                    
                }
            }
        }
    }
    
    Map<Id, Account> accMap = new Map<Id, Account>();
    for(Account objAccount : [select Id, AnnualRevenue from Account where Id IN : accIdSet]){
        accMap.put(objAccount.Id, objAccount);
    }
    
    List<Account> accUpdList = new List<Account>();
    for(Opportunity objOpp : trigger.new){
        if(accMap.containsKey(objOpp.AccountId)){
            accMap.get(objOpp.AccountId).AnnualRevenue = accMap.get(objOpp.AccountId).AnnualRevenue + objOpp.Amount;
        }
        accUpdList.add(accMap.values());
    }
    Database.update(accUpdList, False);    
}