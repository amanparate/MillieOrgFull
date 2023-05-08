public class newPilotVF_CX {
    
    public Pilot__c objPilot;

    public newPilotVF_CX(ApexPages.StandardController controller) {
    
     objPilot = (Pilot__c) controller.getRecord();

    }
    
     public void Save(){
         //String regExp = '^[a-z  A-Z]*$';
         //Pattern RegexPattern = Pattern.compile(regExp);
        // Matcher pilotMatcher = RegexPattern.matcher(objPilot.First_Name__c);
  
       // if(pilotMatcher.matches()==false){
          //   ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, 'Number or special symbol not allowed in First Name and Last Name'));
        //}
       //if(objPilot.First_Name__c == objPilot.Last_Name__c){
          //  ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, 'First Name and Last Name should not be same.'));
      // }
        //if(objPilot.DOB__c.month()==8){
         //   ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, 'Date of Birth of month should NOT be August.'));
       // }
        //String regExp1 = '^[a-z  A-Z]*$';
        //Pattern RegexPattern1 = Pattern.compile(regExp1);
       // Matcher pilotMatcher1 = RegexPattern1.matcher(objPilot.Email_ID__c);
  
        //if(pilotMatcher1.matches()==false){
           //  ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, 'Special Characters should be avoilded in Email ID'));
       // }
        
        if(objPilot.Gender__c == 'Male' && objPilot.DOB__c.Year()==2000){
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR, 'Your Gender is Male so Date of Birth Year - 2000 is NOT allowed'));
         }
         insert objPilot;
     }
     
     public PageReference SaveAndNew(){
         
         insert objPilot;
         PageReference pg = new PageReference('https://amillinium-dev-ed--c.visualforce.com/apex/newPilotVF');
         return pg;
     
     }
     public PageReference Google(){
     
         
         insert objPilot;
         PageReference pg = new PageReference('https://www.google.com/');
         return pg;
     
     }
     
}