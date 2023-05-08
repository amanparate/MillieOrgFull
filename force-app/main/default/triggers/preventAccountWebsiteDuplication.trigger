trigger preventAccountWebsiteDuplication on Account (before insert, before update, after undelete) {
    Set<String> accWebsiteSet = new Set<String>();
        for(Account objAccount : trigger.new){
            if(!String.isBlank(objAccount.Website))
            accWebsiteSet.add(objAccount.Website);
        }
        Map<String,Account> accMap = new Map<String,Account>();
        if(!accWebsiteSet.isEmpty()){   
            for(Account objAccount : [select id, Website from Account where Website IN : accWebsiteSet]){
                accMap.put(objAccount.Website, objAccount);
            }
        }
    if(!accMap.isEmpty()){
        for(Account objAccount : trigger.new){
            objAccount.Website.addError(objAccount.Website +' Account Website is already Exists in our Database. Kindly provide another.');
        }
    }

}