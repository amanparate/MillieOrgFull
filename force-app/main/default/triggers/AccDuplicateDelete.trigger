trigger AccDuplicateDelete on Account (after update) {

    Set<String> accNameSet = new Set<String>();
    for(Account objAccount : trigger.new){
        accNameSet.add(objAccount.Name);
    }
    
    List<Account> accList = new List<Account>();
    for(Account objAccount : [select id, Name, (select id from Contacts) from Account where Name IN :accNameSet]){
        accList.add(objAccount);
    }
    Database.delete(accList, False);
}