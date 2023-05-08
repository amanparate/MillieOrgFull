public with sharing class getOpportunityRecords {
    public getOpportunityRecords() {

    }

    @AuraEnabled(cacheable = true)
    public static List<Opprotunity> fetchOpp(){
        try {   
            List<Opportunity> oppList = new List<Opportunity>([select Id, Name, Amount, Email_ID__c, Description  from Opportunity ]);
            return oppList;
            
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}