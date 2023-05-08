public class OppRelativeVF_CX {
    
    public List<Opportunity> oppList{get;set;}
    public Opportunity objopp;

    public OppRelativeVF_CX(ApexPages.StandardController controller) {
    
        objopp = (Opportunity) controller.getRecord();
    }
    public void updateRecord(){
          
        if(!oppList.isEmpty())
        Database.update(oppList,false); 
    
       getRecords(objopp.LeadSource); 
    }
    
    public void getRecords(String LeadSource){
        
        oppList = [ select Name, Type,LeadSource,StageName,Account.Name from Opportunity where LeadSource =: LeadSource ];
        if(oppList.isEmpty()){
                 ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO, 'No records found for the given criteria'));
        }

    }
    
    public void showRecords(){
        
        if(!String.isBlank(objopp.LeadSource))  {  
                    getRecords(objopp.LeadSource);    
            }
            else{
                     ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO, 'Imposed'));
            }
        }    
}