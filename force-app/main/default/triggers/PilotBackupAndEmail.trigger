trigger PilotBackupAndEmail on Pilot__c (before update, before delete) {
    List<Test__c> PilotTestList = new List<Test__c>();
    List<Messaging.SingleEmailMessage> mailList = new List<Messaging.SingleEmailMessage>();
    for(Pilot__c objPilot : trigger.old){
        if(trigger.isBefore && trigger.isUpdate){
            Test__c objTest = new Test__c();
            objTest.Name__c = objPilot.First_Name__c;
            objTest.Email_ID__c = objPilot.Email_ID__c;
            PilotTestList.add(objTest);
        }
        if(!PilotTestList.isEmpty())
        Database.insert(PilotTestList);
        
        if(String.isNotBlank(objPilot.Email_ID__c)){   
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
            mail.setToAddresses(new String[] {objPilot.Email_ID__c});
            mail.setSenderDisplayName('Flight Management System');
            mail.setSubject('Record Updation ');
            mail.setPlainTextBody('Your Data is Updated');
            mailList.add(mail);
        }
    }

}