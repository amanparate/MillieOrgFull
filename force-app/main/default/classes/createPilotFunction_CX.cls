public class createPilotFunction_CX {
    public Pilot__c objPilot;

    public createPilotFunction_CX(ApexPages.StandardController controller) {
    objPilot = (Pilot__c)controller.getRecord();

    }
    public void Save(){
    Database.insert(objPilot,false);
      
    }

}