trigger TotalCountAccount11 on Contact (after insert) {

    Set<Id> accIdSet = new Set<Id>();
    for(Contact objContact : trigger.new){
        accIdSet.add(objContact.AccountId);
    }
    
    List<Account> accList = [select id, Total_Contact__c from Account where Id IN : accIdSet ];
    
    List<Contact> conList = [select id, AccountId from Contact where AccountId IN : accIdSet ];

    for(Account objAccount : accList){
        objAccount.Total_Contact__c = conList.size();

    }
    
    Database.update(accList,false); 
}