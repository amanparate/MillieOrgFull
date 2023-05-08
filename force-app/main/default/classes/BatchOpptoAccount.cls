//Write a batch class on Opportunity if the lead source is web and stage is closed Won then associated account  
//type is installation partner and industry is energy.

global class BatchOpptoAccount implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        
        return Database.getQueryLocator('select id,LeadSource, StageName, AccountId from Opportunity where LeadSource = \'Web\' and StageName = \'Closed Won\'');
    }
    global void execute(Database.BatchableContext BC, List<Opportunity> oppList){
        Set<Id> accountIdSet = new Set<Id>();
        for(Opportunity objOpp : oppList){
            accountIdSet.add(objOpp.AccountId);
        }
        
        Map<Id, Account> accMap = new Map<Id, Account>();
        for(Account objAccount : [select Id,Type,Industry from Account where Id IN : accountIdSet]){
            accMap.put(objAccount.Id, objAccount);
        }
        List<Account> accUpdateList = new List<Account>();
        for(Opportunity objOpp : oppList){
            if(accMap.containskey(objOpp.AccountId)){
                accMap.get(objOpp.AccountId).Type = 'Installation Partner';
                accMap.get(objOpp.AccountId).Industry = 'Energy';                
            }
            accUpdateList.addAll(accMap.values());
        }
        if(!accUpdateList.isEmpty()){
            Database.update(accUpdateList, false);
        }
    }
    global void finish(Database.BatchableContext BC){
        
    }

}