public class PilotAddressVF1_CX {

    public List<Pilot__c> pilotList {get; set;}

    public PilotAddressVF1_CX(ApexPages.StandardController controller) {
    
           getRecords(); 

    }
    
    public void getRecords(){
    
           pilotList = [select id, First_Name__c, Last_Name__c,Gender__c,(select Address_Line_1__c,Address_Line_2__c,Pin_Code__c,City__c from Addresses__r) from Pilot__c where Gender__c ='Male'];
    }

}