public class OppVFtest_CX {
    
    public List<Opportunity> oppList {get; set;} 

    public OppVFtest_CX(ApexPages.StandardController controller) {
    
        oppList = [select id,Name from Opportunity];
       
    }
    public void getRecords(){
    
        
    
    }

}