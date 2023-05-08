trigger AccountHistory on Account (after update, before update) {
    List<Account_History__c> AccountHistoryList = new List<Account_History__c>();
        for (Account objAccount : trigger.old){
            if(trigger.isAfter && trigger.isUpdate){
                Account_History__c objAccountHistory = new Account_History__c();
                objAccountHistory.Old_Account_Name__c = objAccount.Name;
                objAccountHistory.Type__c = objAccount.Type;
                objAccountHistory.Priority__c = objAccount.Priority__c;            
                AccountHistoryList.add(objAccountHistory);
            }
        }
    if(!AccountHistoryList.isEmpty())
    Database.insert(AccountHistoryList);
}