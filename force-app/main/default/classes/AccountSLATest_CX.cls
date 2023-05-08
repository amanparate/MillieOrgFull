public class AccountSLATest_CX {
    
    public List<Account> accList {get; set;}

    public AccountSLATest_CX(ApexPages.StandardController controller) {
    
        accList = [select id, Name, Type from Account];

    }

}