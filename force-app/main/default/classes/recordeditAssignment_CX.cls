public class recordeditAssignment_CX {
    
    public List<Pilot__c>pilotList{get;set;}

    public recordeditAssignment_CX(ApexPages.StandardController controller) {
    
        pilotList = [select id, First_Name__c,Last_Name__c,Gender__c from Pilot__c];
        
    }
    
    public void UpdateRecord(){
    
        Database.update(pilotList, false);
    
    }
    
    
}