public class getPilot {

    public getPilot(ApexPages.StandardController controller) {

    }

    public static List<Pilot__c> fetchPilot(){ 
 	List<Pilot__c>pilotList = [select First_Name__c, Last_Name__c, Age_Calculated__c,Gender__c,Experience_Level__c,PAN_Card__c from Pilot__c]; 
 	return pilotList; 
 	}
}