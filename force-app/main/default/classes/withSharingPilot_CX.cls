public with sharing class withSharingPilot_CX {
     public List<Pilot__c> pilotList{get;set;}
     public List<Transaction__c> transList{get;set;} 
     public Integer Count{get;set;} 
     public String UserName {get;set;} 
     public String profileName{get;set;}
     public boolean firstFlag {get; set;}
     public boolean previousFlag {get; set;}
     public boolean nextFlag {get; set;}
     public boolean lastFlag {get; set;}
     public Integer limitSize=5;
     public Integer offsetSize=0;
    
     public Integer totalPages {get; set;}
     public Integer currentPage {get;set;}
    
     public Integer totalRecords {get; set;}

 

    public withSharingPilot_CX(ApexPages.StandardController controller) {
        pilotList = [select id,First_Name__c,Last_Name__c,Age_Calculated__c,Gender__c,Experience_Level__c,PAN_Card__c from Pilot__c LIMIT:5];
        transList = [select Name,Transaction_Amount__c,Transaction__c,Bank_Account__c,Transaction_Time__c from Transaction__c];
        getRecords();
       firstFlag =true;
        previousFlag = true;
        currentPage =1;

    }
    public void getRecords(){
        try{ 
                 pilotList = getPilot.fetchPilot();
                 count = pilotList.size();
                 UserName = UserInfo.getFirstName()+' '+UserInfo.getLastName(); 
                 Id profileId= userinfo.getProfileId();
                 profileName=[Select Id,Name from Profile where Id=:profileId].Name;
           } 
           catch(Exception ex){ 
                 System.debug('Error:'+ex.getMessage()); 
           }
    }
    public void firstMethod(){
            OffsetSize=0;
            getPilot.fetchPilot();
    
            firstFlag =true;
            previousFlag = true;
      
            lastFlag = false;
            nextFlag=false;
            currentPage = 1;

    
    }
    public void previousMethod(){
            if(OffsetSize >=0 ){
                 OffsetSize = OffsetSize - limitSize;
                 getPilot.fetchPilot();
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
                getPilot.fetchPilot();
            
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
            OffsetSize = totalRecords - 5;
            getPilot.fetchPilot();
    
            lastFlag = true;
            nextFlag=true;
            firstFlag =false;
            previousFlag = false;
    }
    
}