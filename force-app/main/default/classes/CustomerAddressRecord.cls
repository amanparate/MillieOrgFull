public class CustomerAddressRecord {

    public List<Account> accList {get; set;}

    public CustomerAddressRecord(ApexPages.StandardController controller) {
        
            getRecords();
    }
    public void getRecords(){
        
            accList = [select Name,Type,(select Name,LeadSource from Opportunities) from Account where Type='Prospect'];
    
    }

}