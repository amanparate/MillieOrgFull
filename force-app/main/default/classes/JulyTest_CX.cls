public class JulyTest_CX {
    public List<Account> accList {get; set;}
    

    public JulyTest_CX(ApexPages.StandardController controller) {
        accList = [select id, Name, Type, SLA__c,CreatedDate from Account where CreatedDate > LAST_MONTH ];
    }
    public void UpdateRecord(){
    
    }

}