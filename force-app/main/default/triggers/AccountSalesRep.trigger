trigger AccountSalesRep on Account (before insert, before update) {

    for(Account objAccount : trigger.new){     
        if(String.isNotBlank(objAccount.Name)){
            objAccount.Sales_Rep__c = 1+ ' ' +  objAccount.owner;  
        }        
    }
}