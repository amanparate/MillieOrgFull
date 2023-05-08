global class BatchContact implements Database.Batchable<sObject> {

    global Database.queryLocator start(Database.BatchableContext BC){
        String query = 'select id, Name,Birthdate,LeadSource, Account.SLA__c from Contact';        
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Contact> conList){
        if(!conList.isEmpty()){
            for(Contact objContact : conList){
                if(objContact.Birthdate >= date.parse('01/01/2000') && objContact.Account.SLA__c == 'Gold' ){
                    objContact.LeadSource = 'Web';
                }
                if(objContact.Birthdate <= date.parse('01/01/2000') && objContact.Birthdate >= date.parse('01/01/1990') && 
                   objContact.Account.SLA__c == 'Silver'){
                    objContact.LeadSource = 'Phone Inquiry';
                }
                if(objContact.Birthdate >= date.parse('01/01/1857') && objContact.Account.SLA__c == 'Bronze'){
                    objContact.LeadSource = 'Other';                    
                }
            }
            Database.update(conList, False);
        }
    }
    
    global void finish(Database.BatchableContext BC){
        
    }
}