trigger sharePilot on Pilot__c (after insert, after update) {
    List<Pilot__Share> shareList = new List<Pilot__Share>();
    for( Pilot__c objPilot : trigger.new){
        Pilot__Share pilotshare = new Pilot__Share();
        pilotshare.ParentId = objPilot.Id;
        pilotshare.UserOrGroupId = objPilot.User__c;               
        pilotshare.AccessLevel = objPilot.Level_Access__c;                       
        pilotshare.RowCause = Schema.Pilot__Share.RowCause.Manual; 
        shareList.add(pilotshare);
    }
    Database.SaveResult [] Result = Database.insert(shareList,false);
    for (Database.SaveResult mr : result) {
                    if (mr.isSuccess()) {
                        System.debug('Record is shared Successfully');
                    }  
                     else {
                    // Operation failed, so get all errors                
                    for(Database.Error err : mr.getErrors()) {
                        System.debug('The following error has occurred.');                    
                        System.debug(err.getStatusCode() + ': ' + err.getMessage());
                        System.debug('fields that affected this error: ' + err.getFields());
                    }
        
                     }
                
                
            }
}