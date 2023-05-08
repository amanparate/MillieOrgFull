public class AccConVFPageTest_CX {
    
    public Account objAcc;
    public List<Account> accList {get; set;}
    public Boolean showFlag {get; set;}


    public AccConVFPageTest_CX(ApexPages.StandardController controller) {
        objAcc = (Account) controller.getRecord();
    }
    public void displayData(){
        if(String.isNotBlank(objAcc.Type))
            accList =  [select Name, Type,SLA__c,(select FirstName, LastName from Contacts) from Account order by CreatedDate desc LIMIT 10];
        
        if(accList.isEmpty()){
             showFlag = false;
             ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO, 'No Records found'));
        }
        else{
            showFlag =true;
        }        
    }
}