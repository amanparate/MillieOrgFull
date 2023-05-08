public class ContactAccountDisplayVF {

    public List<Contact> conList{get; set;}

    public ContactAccountDisplayVF(ApexPages.StandardController controller) {
        
        conlist = [select Name,AccountId,Department,Phone,Email,Birthdate from Contact];
    }

}