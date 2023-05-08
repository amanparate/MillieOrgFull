trigger ContactRelationship on Contact (after insert, after update) {

    Map<Id,Contact> conMap = new Map<Id, Contact>();
    for(Contact objContact : trigger.new){
        if(objContact.Contact_Relationship__c){
            if(objContact.Contact_Relationship__c != trigger.oldMap.get(objContact.Id).Contact_Relationship__c)
            conMap.put(objContact.Id, objContact);
        }
        System.debug(':: 1st For');
    }
    
    List<Contact_Relationship__c> conRelationList = new List<Contact_Relationship__c>();
    if(!conMap.isEmpty()){
        for(Contact_Relationship__c objConRelation : [select id,Contact_Name__c,Contact_Relationship__c from Contact_Relationship__c
                                                        where Contact_Relationship__c IN : conMap.keySet() LIMIT 1]){
            conRelationList.add(objConRelation);                                                  
        }
        System.debug(':: 2nd Step');
    }
    
    if(!conRelationList.isEmpty()){
        for(Contact_Relationship__c objConRelation : conRelationList ){
            if(conMap.containsKey(objConRelation.Id)){            
                    objConRelation.Contact_Name__c = conMap.get(objConRelation.Id).LastName;
                    conRelationList.add(objConRelation);            
            }
        }
        System.debug(':: 3rd Step');
    }
    insert(conRelationList);
}