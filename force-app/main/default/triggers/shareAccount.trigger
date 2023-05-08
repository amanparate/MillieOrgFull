trigger shareAccount on Account (after insert,after update) {
    List<Accountshare> shareListAcc = new List<Accountshare>();
    for(Account objAcc : trigger.new){
        AccountShare accShare  = new AccountShare();                
        accShare.AccountId = objAcc.Id;                           
        accShare.UserOrGroupId = objAcc.User__c;               
        accShare.AccountAccessLevel = objAcc.User_Access_for__c;                       
        accShare.RowCause = Schema.AccountShare.RowCause.Manual; 
        accShare.OpportunityAccessLevel = objAcc.User_Access_for__c;
        shareListAcc.add(accShare);
     }  
    Database.insert(shareListAcc,false);
}