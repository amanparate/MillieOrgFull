trigger prefixAccountandDuplication on Account (before insert, before update, after undelete) {
    if(trigger.isBefore && trigger.isInsert){
        for(Account objAccount : trigger.new){
            if((objAccount.Type == 'Prospect' || objAccount.Type == 'Other') && (objAccount.SLA__c == 'Gold' || objAccount.SLA__c == 'Platinum')){
                if(!objAccount.Name.startsWith('Mr.'))
                objAccount.Name = 'Mr.'+ objAccount.Name;
            }
        }
    }
    if((trigger.isBefore && trigger.isInsert) || (trigger.isBefore && trigger.isUpdate) || (trigger.isAfter && trigger.isUndelete)){
        Set<String> accNameSet = new Set<String>();
            for(Account objAccount : trigger.new){
                if(!String.isBlank(objAccount.Name))
                accNameSet.add(objAccount.Name);
            }
        Map<String,Account> accMap = new Map<String,Account>();
            if(!accNameSet.isEmpty()){  
                for(Account objAccount : [select id, Name from Account where Name IN : accNameSet]){
                    accMap.put(objAccount.Name, objAccount);
                }
        }
        if(!accMap.isEmpty()){
            for(Account objAccount : trigger.new){
                if(accMap.containsKey(objAccount.Name))
                objAccount.addError(objAccount.Name +' Duplicate Name is found in our Database. Kindly change it.');
            }
        }

    }
}