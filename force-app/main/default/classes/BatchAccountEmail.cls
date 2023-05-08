global class BatchAccountEmail implements Database.Batchable<sObject>{
    
    global Database.QueryLocator start(Database.BatchableContext BC){
        
        return Database.getQueryLocator('select id,Description, AccountId , Account.Description from Contact');
    }
    global void execute(Database.BatchableContext BC, List<Account> accList){        
        Map<Id,Account> accMap = new Map<Id,Account>();
        for(Account objAccount : accList){
       		accMap.put(objAccount.Id, objAccount);     
        }
        
    }
    global void finish(Database.BatchableContext BC){
        
    }

}