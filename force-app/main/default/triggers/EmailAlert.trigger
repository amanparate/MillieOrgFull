trigger EmailAlert on Pilot__c (before insert, before update) {
        List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
    
    for(Pilot__c objPilot : trigger.new){
        if(String.isNotBlank(objPilot.Email_ID__c)){   
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(new String[] {objPilot.Email_ID__c});
            mail.setSenderDisplayName('Flight Management System');
            mail.setSubject('Happy Birthday ');
            mail.setPlainTextBody('Happy Birthday To You....!!!');
            mailList.add(mail);
        }  
    }
    
    if(!mailList.isEmpty()) {
        
        Messaging.SendEmailResult[] results = Messaging.sendEmail(mailList);

              for (Messaging.SendEmailResult mr : results) {
                    if (mr.isSuccess()) {
                        //Do something for success
                    }  
                     else {
                    // Operation failed, so get all errors                
                    for(Messaging.SendEmailError err : mr.getErrors()) {
                        System.debug('The following error has occurred.');                    
                        System.debug(err.getStatusCode() + ': ' + err.getMessage());
                        System.debug('fields that affected this error: ' + err.getFields());
                    }
        
                     }
                
                
            }
    }   

}