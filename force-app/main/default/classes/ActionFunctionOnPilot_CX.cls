public class ActionFunctionOnPilot_CX {
    
    public Pilot__c objPilot;

    public ActionFunctionOnPilot_CX(ApexPages.StandardController controller) {
    
    objPilot = (Pilot__c)Controller.getRecord(); 
    }
    public void Save(){ 
         Database.Insert(objPilot,false); 
    } 

}