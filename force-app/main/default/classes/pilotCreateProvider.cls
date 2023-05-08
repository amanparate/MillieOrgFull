public class pilotCreateProvider {
    
    @auraEnabled
    public static void createPilot(Pilot__c objPilot){
            insert objPilot;
    }

}