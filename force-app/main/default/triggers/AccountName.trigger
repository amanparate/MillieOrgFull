trigger AccountName on Account (before insert, before update) {
    
    for(Account objAccount : trigger.new){
        if(String.isNotBlank(objAccount.Phone)){
            objAccount.Name = objAccount.Name+ ' ' + objAccount.Phone;
        }
    }

}