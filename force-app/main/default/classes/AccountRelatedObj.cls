public with sharing class AccountRelatedObj{

    @auraEnabled(cacheable=true)
    public static List<Account> fetchAccount(){
        
        List<Account> accList=[SELECT Id,Name FROM Account LIMIT 10000];
        return accList;
    }

    @auraEnabled(cacheable=true)
    public static List<Contact> getContacts(String accountId){

        List<Contact> conList=[SELECT Id,LastName,AccountId FROM Contact WHERE AccountId=:accountId LIMIT 10000];
        return conList;
    }

    @auraEnabled(cacheable=true)
    public static List<Opportunity> fetchOpportunity(String accountId){

        List<Opportunity> oppList=[SELECT Id,Name,AccountId FROM Opportunity WHERE AccountId=:accountId LIMIT 10000];
        return oppList;
    }
}