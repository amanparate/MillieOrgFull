trigger PilotIncomeTax on Pilot__c (before insert, before update) {

    List<Decimal> pilotSalaryList = new List<Decimal>();
    for(Pilot__c objPilot : trigger.new){
        if(objPilot.Salary__c != null){
            objPilot.Income_Tax__c = objPilot.Salary__c * 5 / 100;
            pilotSalaryList.add(objPilot.Income_Tax__c);
        }
    }    
}