trigger Populate on Account (before insert) {

    for(Account a : trigger.new){
        if(a.Type == 'Prospect' && a.Rating == 'Warm' && a.Sla__c == 'Gold'){
            a.Industry = 'Finance';
        }
        else{
            if(a.Type == 'Technology Partner' && a.Rating == 'Cold' && a.Sla__c == 'Platinum'){
                a.Industry = 'Engineering';
            }
        }
        if(a.Sla__c=='Silver' && a.Active__c == 'No'){
            a.adderror('if Account SLA is “Silver” and Account is inactive , This Combination is not allowed');
        }
    }
}