trigger AccountDeleteBackup on Account (after insert, after update) {
    List<Account_Backup__c> AccBackupList = new List<Account_Backup__c>();  
        for(Account objAccount : trigger.old){
            Account_Backup__c objAccountBackup = new Account_Backup__c();
            if(objAccount.Type == 'Prospect'){
                objAccountBackup.Type__c = objAccount.Type ;
                objAccountBackup.Old_Account_Name__c = objAccount.Name;
                AccBackupList.add(objAccountBackup);
            }
         }
    if(!AccBackupList.isEmpty())
    Database.insert(AccBackupList);

}