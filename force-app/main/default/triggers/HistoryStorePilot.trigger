trigger HistoryStorePilot on Pilot__c (after update ) {
    List<Pilot_History__c> pilotList = new List<Pilot_History__c>();
        for(Pilot__c objPilot : trigger.old){
            Pilot_History__c objPilotHistory = new Pilot_History__c();
            objPilotHistory.Pilot_Name_Old__c = objPilot.First_Name__c;
            objPilotHistory.Gender__c = objPilot.Gender__c;
            objPilotHistory.Experience__c = objPilot.Experience_Level__c;
            pilotList.add(objPilotHistory);
        }
    Database.insert(pilotList);

}