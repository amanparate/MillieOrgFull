public class newCustomerPage_CX {

        public List<Pilot__c> pilotList{get; set;}

    public newCustomerPage_CX(ApexPages.StandardController controller) {
    
        pilotList = [select id, First_Name__c,Last_Name__c, DOB__c, Gender__c, CreatedDate from Pilot__c order by CreatedDate desc LIMIT 10 ];

    }

}