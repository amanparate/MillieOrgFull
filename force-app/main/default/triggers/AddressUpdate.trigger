trigger AddressUpdate on Contact (before insert, before update) {
    for(Contact c : trigger.new){
        if(c.MailingCountry == null){
            c.addError('Address is must');
        }
        else{
            if(c.MailingCountry == 'India'){
                c.Languages__c = 'Hindi'+' '+ 'English'+ ' ' + 'Marathi';
                c.Description = 'Indians are most Welcome';
            }
            else{
                if(c.MailingCountry =='Pakistan'){
                    c.Description = 'Get out Jackass';
                }
            }
            if(c.MailingCountry != 'India' && !c.MailingCountry.contains('Pakistan')){
                c.Languages__c = 'English'+' '+ 'Spanish';
            }
        }
    }
}