trigger preventOppDuplication on Opportunity (before insert, before update, after undelete){
    Set<Decimal> oppSet = new Set<Decimal>();       
        for(Opportunity objOpp : trigger.new){
                if(objOpp.Amount != null)
               oppSet.add(objOpp.Amount);            
        }       
    Map<Decimal, Opportunity> oppMap = new Map<Decimal, Opportunity>();
        if(!oppSet.isEmpty()){
            for(Opportunity objOpp : [select id, Amount, StageName from Opportunity where Amount IN : oppSet]){
                    oppMap.put(objOpp.Amount, objOpp);
            }
        }
        if(!oppMap.isEmpty()){
            for(Opportunity objOpp : trigger.new){
                if(oppMap.containsKey(objOpp.Amount) && objOpp.StageName=='Closed Lost'){
                    objOpp.Amount.addError(objOpp.Amount + ' ₹ Amount is already Exists and Stage is Closed Lost');
                }
            }
        }
}