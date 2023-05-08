/*
@ Author        :  Aman Parate
@ Created Date  :  02 June 2021
@ Purpose       :  Parent to Child Traverse (Account to Contact) 
@ Test Class    :  accountContactTableCustom_CXTest 

*/
public class accountContactTableCustom_CX {
    
    public List<Account> accList {get; set;}
    public Account objAcc;

    public accountContactTableCustom_CX(ApexPages.StandardController controller) {
                objAcc = (Account) controller.getRecord();               

    }
    
    public void updateRecord(){
                insert accList;
                getRecords(objAcc.Type);    
     
    }
    public void getRecords(String type){
            
                accList = [select id, Name,Type, (select FirstName, LastName,LeadSource from Contacts) from Account where Type =:type];
                                     if(accList.isEmpty()){
                     ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO, 'No new Rocord found'));
                     }
             }
             public void showRecords(){
                     if(!String.isBlank(objAcc.Type)) { 
                            getRecords(objAcc.Type); 
                     }
                     else{
                     ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO, 'Select the Lead "Source and Stage" You like'));
                     }
               }
}