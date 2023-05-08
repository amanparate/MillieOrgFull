trigger EmailAccount on Account (before insert, before update) {
    List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
        for(Account objAcc : trigger.new){
            if(String.isNotBlank(objAcc.Name)){
                String[] email = objAcc.To_Email_Address__c.split(';');
                for(Integer i = 0; i < email.size(); i++){
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.setToAddresses(new String[] {email[i]});
                    mail.setSenderDisplayName('Flight Management System');
                    mail.setSubject('Happy Birthday ');
                    mail.setPlainTextBody('Happy Birthday To You....!!!');
                    mailList.add(mail);
                }
            }
            if(!mailList.isEmpty()) { 
                    Messaging.SendEmailResult[] results = Messaging.sendEmail(mailList); 
                    for (Messaging.SendEmailResult mr : results) { 
                            if (mr.isSuccess()){ 
                                System.debug('The Mail send Sucessfully.'); 
                            } 
                            else {  
                                for(Messaging.SendEmailError err : mr.getErrors()) { 
                                        System.debug('The following error has occurred.'); 
                                        System.debug(err.getStatusCode() + ': ' + err.getMessage()); 
                                        System.debug('fields that affected this error: ' + err.getFields()); 
                            } 
                    } 
            }
        }
   }
}