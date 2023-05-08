trigger PrefixPilot on Pilot__c (before insert, before update) {
    for(Pilot__c p : trigger.new){
        if(!p.First_Name__c.startsWith('Mr.') && !p.First_Name__c.startsWith('Ms.')){
            if(p.Gender__c =='Male'){
                p.First_Name__c = 'Mr.'+ p.First_Name__c;
            }
            if(p.Gender__c =='Female'){
                    p.First_Name__c = 'Ms.' + p.First_Name__c;
                }
            
            if(p.Gender__c == 'Unknown'){
                p.addError('Unknown Gender is not ALLOWED.');
            }
        }
    }

}