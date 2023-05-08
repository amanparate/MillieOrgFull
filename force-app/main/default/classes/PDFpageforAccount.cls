public class PDFpageforAccount {

        public Account objAcc {get; set;}

    public PDFpageforAccount(ApexPages.StandardController controller){
        
            String AccountID = ApexPages.currentPage().getParameters().get('Id');
            if(String.isNotBlank(AccountID)){
            objAcc = [select Name,AccountNumber,Type,Industry from Account where id =:AccountID LIMIT 1];
            }
    }

}