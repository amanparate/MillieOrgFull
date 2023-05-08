/* Author - Aman Parate
   Date - Tuesday,29 June 2021  Time - 6:15 AM
   Object - Pilot
   Event - After
   Operation - Update 
*/

trigger PilotPassportTraverse on Pilot__c (after update) {
    
    Map<Id , Pilot__c> pilotMap = new Map<Id , Pilot__c>();
    for(Pilot__c objPilot : trigger.new){
        if(objPilot.Passport_Type__c == 'Minor' && objPilot.Verified_Pilot__c){
            if(objPilot.Status__c != trigger.oldMap.get(objPilot.Id).Status__c && 
               objPilot.Verified_Pilot__c != trigger.oldMap.get(objPilot.Id).Verified_Pilot__c)
            pilotMap.put(objPilot.Id, objPilot);
        }
    }
    
    List<Passport__c> passportList = new List<Passport__c>();
    if(!pilotMap.isEmpty()){
        for(Passport__c objPassport : [select id,Pilot__c,Status__c,Issue_Date__c,CreatedDate from Passport__c 
                                       where CreatedDate >= Last_Week and Pilot__c IN : pilotMap.keySet()]){
            passportList.add(objPassport);
        }
    }
    if(!passportList.isEmpty()){
        for(Passport__c objPassport : passportList){
            if(pilotMap.containsKey(objPassport.Pilot__c) && objPassport.Status__c == 'New' ){
                objPassport.Status__c = 'In Progress';
                objPassport.Issue_Date__c = objPassport.Issue_Date__c.addMonths(2);
            }
        }    
        Database.SaveResult [] Result = Database.update(passportList,false);
            for (Database.SaveResult mr : result) {
                            if (mr.isSuccess()) {
                                System.debug('Record changes are made');
                            }  
                            else {                                   
                                for(Database.Error err : mr.getErrors()) {
                                    System.debug('The following error has occurred.');                    
                                    System.debug(err.getStatusCode() + ': ' + err.getMessage());
                                    System.debug('fields that affected this error: ' + err.getFields());
                                }        
                            }
                        
                        
            }
    }
}