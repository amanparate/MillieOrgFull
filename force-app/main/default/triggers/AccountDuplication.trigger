trigger AccountDuplication on Account (before insert, before update, after undelete) {
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
            objAccount.addError(objAccount.Name +' Account is Already Exists.');
        }
    }
}