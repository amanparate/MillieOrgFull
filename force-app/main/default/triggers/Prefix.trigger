trigger Prefix on Account (before insert, before update) {
    for(Account a : trigger.new){
        if(!a.Name.startsWith('Mr.') || !a.Name.startsWith('Ms.')){
            a.Name = 'Mr.'+ a.Name;
        }
    }

}