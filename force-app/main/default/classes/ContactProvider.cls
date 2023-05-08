public with sharing class ContactProvider {
    public ContactProvider() {

    }
    @AuraEnabled
    public static void createContact(String conFName, String conLName){
        try {
            if(String.isNotBlank(conFName) && String.isNotBlank(conLName)){
                Contact objCon = new Contact(FirstName = conFName, LastName = conLName);
                Database.insert(objCon);
            }
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}