public class CaseProvider {

    @AuraEnabled
    public static Case getCaseRecords(Case objCase){
        return ([select id,CaseNumber,Status,Reason from Case where CaseNumber=:objCase.CaseNumber LIMIT 1]);
    }
    
    @AuraEnabled
    public static void updateCaseRecords(Case objCase){
        
        if(objCase!=null){
            objCase.Status = 'Escalated';
            Database.update(objCase, false);
        }
    }
    
     @AuraEnabled
    public static Case fetchRecord(Case objCase){
       
        if(objCase!=null){
            objCase.Status = 'New';
            objCase.Description ='';
            Database.update(objCase, false);
        }
        return ([select id,CaseNumber,Status,Reason from Case where CaseNumber=:objCase.CaseNumber LIMIT 1]);
    }
    
    
}