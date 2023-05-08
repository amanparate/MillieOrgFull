public class newAccountVF_CX{

    public Account objAccount;

    public newAccountVF_CX(ApexPages.StandardController controller) {
               objAccount =  (Account) controller.getRecord();
    }
    public void Save(){
               if( String.isBlank(objAccount.Type)){
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, 'Account Type must not ve vaccant.'));
               }
               if(objAccount.Type=='Prospect'){
                    objAccount.SLA__c = 'Gold';
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'New Customer Record has been created successfully...!!!'));
               }
               if(objAccount.Type=='Other'){
                    objAccount.SLA__c = 'Silver';
                    ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'New Customer Record has been created successfully...!!!'));
               }
               if(objAccount.Type=='Installation Partner' && objAccount.Rating=='Hot'){
                   ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, 'This combination is not allowed.'));
               }
               if(objAccount.Priority__c=='High' && objAccount.Active__c=='Yes'){
                   objAccount.Description=' Yahoo Customer';
               }
               if(objAccount.Name.length()<=3 || objAccount.Name.length()>=15){
                   ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Name must have atleast 3 Characters.'));
               }
               insert objAccount;
    }
}