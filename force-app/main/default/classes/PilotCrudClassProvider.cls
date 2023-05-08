public class PilotCrudClassProvider {
    
    @auraEnabled 
 	public static void createRecord(Pilot__c objPilot){
        if(String.isNotBlank(objPilot.First_Name__c))
 			Database.insert(objPilot); 
 	} 
 	@auraEnabled 
 	public static Pilot__c searchRecord(Pilot__c objPilot){ 
 		return [select id,Name,First_Name__c,Last_Name__c,Gender__c,Experience__c,DOB__c,Hobbies__c,PAN_Card__c,Verified_Pilot__c,Status__c from Pilot__c where Name=:objPilot.Name LIMIT 1]; 
	} 
 	@auraEnabled 
 	public static void updateRecord(Pilot__c objPilot){ 
 		Database.update(objPilot,false); 
 	} 
 	@auraEnabled 
    public static void deleteRecord(Pilot__c objPilot){ 
		Database.delete(objPilot, false);
    }
}