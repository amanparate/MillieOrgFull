public class AccountOutputAssignment_CX {
        
            public List<Account> accList{get; set;}

    public AccountOutputAssignment_CX(ApexPages.StandardController controller) {
    
            accList = [select id, Name,Type,SLA__c,CreatedDate from Account where Name LIKE '%ae%' order by CreatedDate desc LIMIT 15 ];

    }

}