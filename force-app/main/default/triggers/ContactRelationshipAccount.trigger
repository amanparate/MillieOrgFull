trigger ContactRelationshipAccount on Contact (after insert, after update, after undelete) {
    
    if(trigger.isAfter){
        if(trigger.isInsert || trigger.isUpdate || trigger.isUndelete){
            
            Set<Id> accountIdSet = new Set<Id>();
            for(Contact objCon : trigger.new){
                //if(objCon.LeadSource != trigger.OldMap(objCon.LeadSource))
                accountIdSet.add(objCon.AccountId);                
            }
            
            Map<Id, Account> accMap = new Map<Id, Account>();
            for(Account objAccount : [select Id,Account_Type__c from Account where Id IN : accountIdSet]){
                accMap.put(objAccount.Id, objAccount);
            }
            
            if(trigger.isAfter){
                if(trigger.isInsert || trigger.isUpdate){
            List<Account> accList = new List<Account>();
            List<Contact> conList = new List<Contact>();
            for(Contact objCon : trigger.new){
                if(accMap.containskey(objCon.AccountId)){
                    if(objCon.LeadSource == 'Web'){
                        objCon.AssistantName = 'Raju Ram';
                        accMap.get(objCon.AccountId).Account_Type__c = 'Saving General';                        
                    }
                    /*else{
                        if(objCon.LeadSource == 'Phone Inquiry'){
                            objCon.AssistantName = 'Arya Chimurkar';
                            objCon.AssistantPhone = '7412589632';
                            accMap.get(objCon.AccountId).Account_Type__c = 'Saving Minor';
                        }
                        else{
                            if(objCon.LeadSource == 'Partner Referral'){
                                objCon.AssistantName = 'Aman Parate';
                                objCon.AssistantPhone = '7841258634';
                                accMap.get(objCon.AccountId).Account_Type__c = 'Saving Senior';
                                accMap.get(objCon.AccountId).Description = 'Aman you are going to become a Legend';
                                objCon.Description = 'Aman you have to become a Legend';
                            }
                        }
                    }*/
                }
                accList.addAll(accMap.values());
                Database.update(accList, False);
            }
                }
            }
            if(trigger.isAfter && trigger.isUndelete){
            
                List<Account> accList = new List<Account>();
           		for(Contact objCon : trigger.new){
                    if(accMap.containskey(objCon.AccountId)){
                        if(objCon.LeadSource == 'Web')
                        accMap.get(objCon.AccountId).Account_Type__c = null ;
                    }
                }
                if(!accList.isEmpty())
                Database.update(accList, False);
            }            
            
        }
    }
}