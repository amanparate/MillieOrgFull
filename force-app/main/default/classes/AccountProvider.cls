public class AccountProvider {
    
    @auraEnabled
    public static void createAccount(Account objAccount){
        Database.insert(objAccount,false);
    }
    
    @auraEnabled
    public static Account getAccountDetails(Account objAcc){
        return [select Id,Name,Type,SLA__c, Rating, Description,AnnualRevenue,Industry from Account where Name=:objAcc.Name and Type=:objAcc.Type LIMIT 1];
    }
    
   /* @auraEnabled
     public static Account getRecords(Id accId){
        if(String.isNotBlank(accId)){
            return ([select ID, Name, Type, SLA__c,AnnualRevenue,Industry from Account where Id=:accId LIMIT 1]);
        }
        ELSE{
            return null;
        }
        
    }*/
    
     @auraEnabled
    public static void updateAccount(Account objAccount){
        Database.update(objAccount,false);
    }
    
    
    
    @auraEnabled
    public static List<Account> getAccountRecords(String accountType){
        return  ([select Name, Type, SLA__c,AnnualRevenue,Industry from Account where Type=:accountType]);
    }
    
    
    @auraEnabled
    public static List<Contact> getContacts(ID parentID){
        return ([select FirstName, LastName, Email from Contact where AccountId=:parentID]);
    } 
    
    @auraEnabled
 	public static list<account> getRecords(string accType,Integer limitValue)
 	{
     system.debug('## Account Type := '+accType+ ' Limit '+limitValue);
     list<Account> accList = new List<Account>() ;
     if(!string.isBlank(accType))
 	 {
         accList = [select id , name, Type,SLA__c from Account where type=:acctype limit: limitValue];
         system.debug('ACC List Size '+accList.size());
         return (accList);
 	 }
 	 return Null;
 }

     
    
}