trigger AccountRecordDuplication on Account (before insert, before update, after undelete) {
       
    Set<String> accNameSet = new Set<String>();
    for(Account objAccount : trigger.new){
        accNameSet.add(objAccount.Name);
    }
    
    List<Account> accNameList = [select id, Name from Account where Name IN : accNameSet ];
    
    Map<String, Account> accMap = new Map<String, Account>();
    for(Account objAccount : accNameList){
        accMap.put(objAccount.Name, objAccount);
    }
    
    for(Account objAccount : trigger.new){
        if(accMap.containsKey(objAccount.Name)){
            objAccount.Name.addError(objAccount.Name + ' Duplicate Account is found.');
        }
    }
}