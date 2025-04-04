 public with sharing class LwcPaginationWithRowValueController {
    public LwcPaginationWithRowValueController() {

    }

    // Fetch contacts for pagination
    @AuraEnabled(cacheable=true)
    public static ContactWrapper getContacts(Integer pageNumber, Integer pageSize) {
        Integer offset = (pageNumber - 1) * pageSize;
        Integer totalRecords = [SELECT COUNT() FROM Contact];
        List<Contact> contacts = [SELECT Id, FirstName, LastName, Email FROM Contact WITH SECURITY_ENFORCED LIMIT :pageSize OFFSET :offset];

        ContactWrapper wrapper = new ContactWrapper();
        wrapper.records = contacts;
        wrapper.totalRecords = totalRecords;

        return wrapper;
    }

    // Wrapper class for contacts and total records count
    public class ContactWrapper {
        @AuraEnabled
        public List<Contact> records;
        @AuraEnabled
        public Integer totalRecords;
    }
    
}