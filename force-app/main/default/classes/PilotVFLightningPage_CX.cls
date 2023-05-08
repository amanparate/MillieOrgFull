public with sharing class PilotVFLightningPage_CX {

    public Pilot__c objPilot {get; set;}

    public PilotVFLightningPage_CX(ApexPages.StandardController controller) {
        
        String pilId= System.currentPageReference().getParameters().get('ID');
        
        objPilot = [select id, First_Name__c, Last_Name__c from Pilot__c where Id=:pilId];

    
    }

}