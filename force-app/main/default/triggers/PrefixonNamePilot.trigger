trigger PrefixonNamePilot on Pilot__c (before insert) {

    List<String> pilotNameList = new List<String>();
    for(Pilot__c objPilot : trigger.new){
        if(String.isNotBlank(objPilot.First_Name__c) && !objPilot.First_Name__c.startsWith('Mr'))
            objPilot.First_Name__c = 'Mr.' + objPilot.First_Name__c;
            pilotNameList.add(objPilot.First_Name__c);
    }    
}