global class BatchAccountToOpportunity implements Database.Batchable<sObject> {
    
    global Database.QueryLocator start(Database.BatchableContext BC){
      
        return Database.getQueryLocator('select id, Min_Opportunity_Name__c,Description from Account');
	}
    global void execute (Database.BatchableContext BC, List<Account> accList){
	
        Map<Id, Account> accMap = new Map<Id, Account>();
        if(!accList.isEmpty()){
            for(Account objAccount : accList){
                accMap.put(objAccount.Id , objAccount);
            } 
        }
        
        List<Opportunity> oppList = new List<Opportunity>();
        for(Opportunity objOpp : [select id, Amount,AccountId from Opportunity where AccountId IN : accMap.keySet()]){
            if(accMap.containsKey(objOpp.AccountId)){
                accMap.get(objOpp.AccountId).Min_Opportunity_Name__c = String.valueOf(objOpp.Amount) + ' Done' ;
                oppList.add(objOpp);
            }
        }
        if(!oppList.isEmpty())
        	Database.update(oppList);
    }
    global void finish(Database.BatchableContext BC){
        
    }

}