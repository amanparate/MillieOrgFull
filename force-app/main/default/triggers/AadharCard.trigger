trigger AadharCard on Pilot__c (before insert) {
    for(Pilot__c p : trigger.new){
        p.Aadhar_Card_Number__c = 'XXXX-XXXX-'+ p.Aadhar_Card_Number__c.right(4);
            
        }
    }