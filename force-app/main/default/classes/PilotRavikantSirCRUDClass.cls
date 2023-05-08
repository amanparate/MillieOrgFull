public class PilotRavikantSirCRUDClass {

    @auraEnabled
    public static Pilot__c searchRecord(string PilotId){
        return [select id,Name,First_Name__c,Last_Name__c,Gender__c,Experience__c,
		DOB__c,Hobbies__c,PAN_Card__c,Verified_Pilot__c,Status__c from Pilot__c where Name=:PilotId LIMIT 1];
    }
}