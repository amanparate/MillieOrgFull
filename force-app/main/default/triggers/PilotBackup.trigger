trigger PilotBackup on Pilot__c (before delete) {
    List<Pilot_Backup__c> pilotBackupList = new List<Pilot_Backup__c>();
        for(Pilot__c objPilot : trigger.old){
            if(trigger.isBefore && trigger.isDelete){
                Pilot_Backup__c objPilotBackup = new Pilot_Backup__c();
                objPilotBackup.Pilot_First_Name__c = objPilot.First_Name__c;
                objPilotBackup.Pilot_Last_Name__c = objPilot.Last_Name__c;
                objPilotBackup.Gender__c = objPilot.Gender__c;
                objPilotBackup.Email_ID__c = objPilot.Email_ID__c;
                pilotBackupList.add(objPilotBackup);  
            }
        }
    if(!pilotBackupList.isEmpty())
    Database.insert(pilotBackupList);
}