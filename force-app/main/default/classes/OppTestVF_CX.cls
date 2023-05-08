public class OppTestVF_CX {

    public List<Opportunity> oppList {get; set;}

    public OppTestVF_CX(ApexPages.StandardController controller) {
        
        oppList = [select id, Name, Amount, CreatedDate, Account.Name,Account.Type from Opportunity where Account.Type = 'Prospect' order by CreatedDate desc LIMIT 20];

    }

}