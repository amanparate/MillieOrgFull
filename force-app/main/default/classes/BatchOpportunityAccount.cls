global class BatchOpportunityAccount implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        
        return Database.getQueryLocator('select id, Name, AccountId from Opportunity');
    }
    
    global void execute(Database.BatchableContext BC, List<Opportunity> oppList){
        Set<Id> accIdSet = new Set<Id>();
        for(Opportunity objOpp : oppList){
            accIdSet.add(objOpp.AccountId);
        }
        
        List<Account> accList = [select id, Name from Account where id IN : accIdSet];
        
        List<Opportunity> oppNewList = [select id, Name, AccountID from Opportunity where AccountId IN : accIdSet];
        
        for(Account objAccount : accList){
            
        }
    }
    
    global void finish(Database.BatchableContext BC){
        
    }

}