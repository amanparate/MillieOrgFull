public with sharing class LightningController {
  
    //This method will be called using @wire adapter
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts(){
        return [Select Id,FirstName,LastName,Email,Phone from Contact LIMIT 10];
    }
    //Apex Imperative method to be called on a button click
    @AuraEnabled
    public static void updateContacts(Object data){
      
        List<Contact> contactList = (List<Contact>) JSON.deserialize(JSON.serialize(data),List<Contact>.class);
        if(contactList.size()>0){
            update contactList;
        }
    }
}