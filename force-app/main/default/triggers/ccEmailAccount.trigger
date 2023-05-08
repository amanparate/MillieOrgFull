trigger ccEmailAccount on Account (before insert) {
    List <Messaging.SingleEmailMessage> mailList = new List <Messaging.SingleEmailMessage>();
        for(Account objAccount : trigger.new){
            if(!String.isEmpty(objAccount.CC_Email_Address__c)){
                String[] ccmail = objAccount.CC_Email_Address__c.split(';'); 
                for(Integer i = 0;i < ccmail.size();i++){
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.setccAddresses(new String[] {ccmail[i]});
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