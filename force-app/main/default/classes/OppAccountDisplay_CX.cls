public class OppAccountDisplay_CX{
             public List<Opportunity> oppList {get; set;}
             public Opportunity objOpp;
 
 
    public OppAccountDisplay_CX(ApexPages.StandardController controller) {
             objOpp= (Opportunity) controller.getRecord();
     }
    public void updateRecord(){
             
             insert oppList;  
             getRecords(objOpp.LeadSource, objOpp.StageName );
     }
             public void getRecords(String Lead, String Stage){
                     oppList = [select Name, AccountId, Type, LeadSource, StageName, Account.Name from Opportunity where LeadSource=: Lead and StageName=: Stage];
                     if(oppList.isEmpty()){
                     ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO, 'No new Rocord found'));
                     }
             }
             public void showRecords(){
                     if(!String.isBlank(objOpp.LeadSource) || !String.isBlank(objOpp.StageName)) { 
                            getRecords(objOpp.LeadSource, objOpp.StageName); 
                     }
                     else{
                     ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO, 'Select the Lead "Source and Stage" You like'));
                     }
             }

}