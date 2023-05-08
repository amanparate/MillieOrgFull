global class BatchClassAccount implements Database.Batchable<sObject>{

	global Database.QueryLocator start(Database.BatchableContext BC){
	
		String query = 'select id, SLA__c, Rating, Type, CreatedDate from Account where CreatedDate > 2021-07-15T00:00:00Z ';
		return Database.getQueryLocator(query);
	}
	
	global void execute(Database.BatchableContext BC , List<Account> accList){
	
		for(Account objAccount : accList){
			objAccount.Type = 'Other';
            objAccount.SLA__c = 'Gold';
            objAccount.Rating = 'Hot';
		}
	}
	
	global void finish(Database.BatchableContext BC){
	
	}
}