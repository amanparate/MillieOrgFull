global class BatchClass1 implements Database.Batchable<sObject> {

    global Database.QueryLocator start(Database.BatchableContext BC){
        String query = 'select id,Name,Type,Ownership, Rating,createdDate  from Account where Type =\'Prospect\' and Rating = \'Hot\' and createdDate >2021-02-01T00:00:00+05:00';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Account> accList){
        if(!accList.isEmpty()){
            for(Account objAccount : accList){
                objAccount.Type = 'Technology Partner';
                objAccount.Ownership = 'Private';
            }
            Database.update(accList,False);
        }
    }
    global void finish(Database.BatchableContext BC){
        
    }
}