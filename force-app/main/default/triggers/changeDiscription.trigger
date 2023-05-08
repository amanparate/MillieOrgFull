trigger changeDiscription on Opportunity (before insert, before update) {
    for(Opportunity opp : trigger.new){
        if(opp.Type =='New Customer' && opp.LeadSource == 'Partner Referral' && opp.StageName == 'Perception Analysis'){
            opp.Description = 'You are Certified Gareeb. Kindly increase your WEALTH.';
        }
        if(opp.Type == 'Existing Customer - Upgrade' && opp.LeadSource == 'Phone Inquiry' && opp.StageName == 'Negotiation/Review'){
            opp.Description = 'Peheli fursat me Nikal';
            opp.DeliveryInstallationStatus__c = 'Yet to begin';
            opp.IsPrivate = true;
            //opp.NOTE__c = 'Customer is trying to Rob the company. Arrest him.';
            opp.MainCompetitors__c = 'Big BULL';
        }
    }

}