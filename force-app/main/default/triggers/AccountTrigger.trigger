trigger AccountTrigger on Account(after insert, after update){
    
    /*Map<Id, Account> accMap = new Map<Id,Account>();
    for(Account objAccount : trigger.new){
        accMap.put(objAccount.Id,objAccount);
    }
    
    List<Contact> conList = new List<Contact>();
    for(Contact objCon : [select id,Description, AccountId from Contact where AccountId IN : accMap.keyset()]){
        conList.add(objCon);
    }
    
    for(Contact objCon : conList){
        if(accMap.containskey(objCon.AccountId)){
            if(accMap.get(objCon.AccountId).Type == 'Prospect'){
                objCon.Description = 'Allowed';
            }
            else{
                objCon.Description = 'Not Allowed';
            }            
        }
        conList.add(objCon);
    }
    Database.update(conList, false); */
    List<Account_Setting__mdt> getCustmetadata = Account_Setting__mdt.getAll().values();
        for(Account objAccount : trigger.new){
            //objAccount.Rating != trigger.OldMap.get(objAccount.Id).Rating
            if(getCustmetadata[0].Label != null){                
                    Field_Update_on_Account__e events = new Field_Update_on_Account__e(
                    Account_Industry_Platform_Event__c = objAccount.Industry,
                    Account_Name_Platform_Event__c = objAccount.Name,
                    Account_Number_Platform_Event__c = objAccount.AccountNumber,
                    Account_Phone_Platform_Event__c = objAccount.Phone,
                    Account_Type_Platform_Event__c = objAccount.Type
                ); 
                System.debug('Event  : ' + events);
                EventBus.publish(events);       
            }
        }
}