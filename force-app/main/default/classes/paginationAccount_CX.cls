public class paginationAccount_CX {

    public List<Account> accList {get; set;}
    
    public boolean firstFlag {get; set;}
    public boolean previousFlag {get; set;}
    public boolean nextFlag {get; set;}
    public boolean lastFlag {get; set;}
    
    public Integer limitSize=10;
    public Integer offsetSize=0;
    
    public Integer totalPages {get; set;}
    public Integer currentPage {get;set;}
    
    public Integer totalRecords {get; set;}
    
    public paginationAccount_CX(ApexPages.StandardController controller) {
      showAccounts();
      firstFlag =true;
      previousFlag = true;
      currentPage =1;
      
    }
    
    public void showAccounts(){
        accList = [select Name, Type from Account LIMIT: limitSize OFFSET: offsetSize];
        
        List<Account> totalAccountList = [select id from Account];
        totalRecords = totalAccountList.size();
        
        totalPages = totalRecords / limitSize;
    }
    
    public void firstMethod(){
    OffsetSize=0;
    showAccounts();
    
    firstFlag =true;
      previousFlag = true;
      
      lastFlag = false;
    nextFlag=false;
    currentPage = 1;
      
      
    }
    
    public void previousMethod(){
    if(OffsetSize >=0 ){
     OffsetSize = OffsetSize - limitSize;
     showAccounts();
     currentPage --;
     }
     if(OffsetSize==0){
             previousFlag=true;
             firstFlag =true;
     }
    }
    
    public void nextMethod(){
     if(OffsetSize <= totalRecords){ 
            OffsetSize = OffsetSize + limitSize;
            showAccounts();
            
            firstFlag =false;
      previousFlag = false;
      currentPage++;
       }
       else{
       nextFlag =true;
       
       }
    }
    
    public void lastMethod(){
    
    currentPage = totalPages ;
    OffsetSize = totalRecords - 10;
    showAccounts();
    
    lastFlag = true;
    nextFlag=true;
    firstFlag =false;
      previousFlag = false;
    }

}