public class AccountProviderLightning {

    @auraEnabled
    public static Account getAccountDetails(Account objAcc){
        return [select Id,Name,Type,SLA__c,Rating,Description from Account where Type=:objAcc.Type LIMIT 1];
    }

}