public class ContactOutputAssignment_CX {

    public List<Contact> conList {get; set;}

    public ContactOutputAssignment_CX(ApexPages.StandardController controller) {
    
        conList = [select id, Name,Email,Level__c,LeadSource,FirstName from Contact where Level__c = 'Primary' and Email Like '%gmail%' and (LeadSource ='Web' or LeadSource ='Phone Inquiry') and FirstName LIKE 'ra%' LIMIT 5 ];

    }

}