trigger TypeIsCurrent on Bank_Account__c (before insert) {
    for(Bank_Account__c bn : trigger.new){
        if(bn.E_mail_Id__c.endsWith('@gmail.com')){
            bn.Type__c = 'Saving Minor';
        }
    }

}