public class PilotAddressPDF {
        public Pilot__c objPilot {get; set;}

    public PilotAddressPDF(ApexPages.StandardController controller) {
        
        String PilotID = ApexPages.currentPage().getParameters().get('Id');
            if(String.isNotBlank(PilotID)){
            objPilot = [select id, First_Name__c,Last_Name__c,Contact_Number__c,DOB__c,Email_ID__c,Status__c from Pilot__c where id =:PilotID LIMIT 1];
            }

    }

}