public class AccountContactRelationshipVF_CX {

    public List<Account> accList {get; set;}
    
    public AccountContactRelationshipVF_CX(ApexPages.StandardController controller) {
            
            accList = [select Name, Type, Industry, SLA__c,(select LeadSource from Contacts) from Account];
            
    }
    
    public void updateRecord(){
    
    
    }
   
}