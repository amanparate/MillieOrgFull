trigger ContactTotalAmt on Contact(after insert, after update, after delete, after undelete){
	
	Set<Id> accIdSet = new Set<Id>();
	for(Contact objContact : trigger.new){
        if(objContact.AccountId != null){
            if(trigger.isAfter && trigger.isInsert || trigger.isUndelete){
                accIdSet.add(objContact.AccountId);
            }        
            if(trigger.isAfter && trigger.isUpdate || trigger.isDelete){
                if( trigger.oldMap.get(objContact.AccountId).Amount_1__c != objContact.Amount_1__c){
                    accIdSet.add(objContact.AccountId);
                }
            }
        }
	}
	Map<Id, Account> accMap = new Map<Id, Account>();
	if(trigger.isAfter){
		if(trigger.isInsert || trigger.isUpdate || trigger.isDelete || trigger.isUndelete){
            if(!accIdSet.isEmpty()){
                for(Account objAccount : [select id, Amount_1__c from Account where Id IN : accIdSet]){
                    accMap.put(objAccount.Id, objAccount);
                }
            }
		}
    	List<Account> accList = new List<Account>();
		if(trigger.isInsert || trigger.isUpdate || trigger.isUndelete){				
			for(Contact objContact : trigger.new){
                if(!accMap.isEmpty()){
                    if(accMap.containsKey(objContact.AccountId)){                    
                        if(objContact.Amount_1__c != null){
                            accMap.get(objContact.AccountId).Amount_1__c = objContact.Amount_1__c;
                        }
                    }
                }
			}            
		}        
		if(trigger.isDelete){			
			for(Contact objContact : trigger.new){
				if(accMap.containsKey(objContact.AccountId)){
                    if(objContact.Amount_1__c != null)
					accMap.get(objContact.AccountId).Amount_1__c = accMap.get(objContact.AccountId).Amount_1__c - objContact.Amount_1__c;
				}
			}
			accList.addAll(accMap.values());
			Database.Update(accList, false);
		}
	}
}