public with sharing class Pilot_CC {

     public String PilotLastName { get; set; }

     public String PilotFirstName { get; set; }

     public PageReference SaveRecord() {
        
        if(String.isNotBlank(PilotFirstName)){
                Pilot__c objPilot = new Pilot__c(First_Name__c = PilotFirstName);
                insert objPilot;
        }
        else{
                ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO, 'Kindly enter the First Name'));
        }
        
        return null;
    }


   
}