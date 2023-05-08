public class contactRecordProvider {

    @auraEnabled
    public static void createContact(String contactName,String contactDept, String contactEmail , String contactAssist,
                              String contactTitle, String contactMailSt , String  contactMailCity  ){
        if(String.isNotBlank(contactName)){	
            Contact objCon = new Contact(Department=contactDept, 
                                         Email=contactEmail,AssistantName=contactAssist,Title=contactTitle,
                                         MailingStreet=contactMailSt,MailingCity=contactMailCity);
            insert objCon;
        }
   }

}