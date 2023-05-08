trigger AccountDuplicatePrevent on Account(before insert, before update, after undelete){
    
    Set<String> accSet = new Set<String>();
    for(Account objAccount : trigger.new){
        accSet.add(objAccount.Name);
    }

    Map<String, Account> accMap = new Map<String, Account>();
    for(Account objAccount : [select id, Name from Account where Name IN :accSet ]){
        accMap.put(objAccount.Name , objAccount);
    
    }

    for(Account objAccount : trigger.new){
        if(accMap.containskey(objAccount.Name)){
            objAccount.Name.addError(objAccount.Name + ' Duplicate name is found in our Database.Kindly change Name.');
        } 
    }
}