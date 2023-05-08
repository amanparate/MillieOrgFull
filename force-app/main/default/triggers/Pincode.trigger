trigger Pincode on Addresss__c (before insert) {
    for(Addresss__c add : trigger.new){
        if(add.Pin_Code__c =='440027'){
            add.Country__c = 'India';
            add.State__c = 'Maharashtra';
            add.City__c = 'Nagpur';
            add.Status__c = 'Pending';
        }
        else{
            if(add.Pin_Code__c == '111111'){
                add.Country__c = 'USA';
           	    add.State__c = 'Texas';
                add.City__c = 'Austin';
                add.Status__c = 'Completed';
            }
        }
    }

}