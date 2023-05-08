public with sharing class customSearchAccountController {
    @AuraEnabled(cacheable=true)
    public static list<Account> getAccounts(string searchKey) {         
        return [select Id, Name, Phone, Email_ID__c from Account where Name LIKE : '%'+ searchKey +'%'];
    }
}