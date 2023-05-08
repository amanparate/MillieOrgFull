trigger FieldUpdateOnPlatformEventAccount on Field_Update_on_Account__e (after insert) {
    // List to hold all custList to be created.
    List<Customer__c> custList = new List<Customer__c>();
       
    // Iterate through each notification.
    for (Field_Update_on_Account__e event : Trigger.New) {
        System.debug('Event Account_Industry_Platform_Event__c : ' + event.Account_Industry_Platform_Event__c);
        System.debug('Event Account_Name_Platform_Event__c : ' + event.Account_Name_Platform_Event__c);
        System.debug('Event Account_Number_Platform_Event__c : ' + event.Account_Number_Platform_Event__c);
        System.debug('Event Account_Phone_Platform_Event__c : ' + event.Account_Phone_Platform_Event__c);
        System.debug('Event Account_Type_Platform_Event__c : ' + event.Account_Type_Platform_Event__c);
        
        Customer__c objCust = new Customer__c();
        objCust.First_Name__c = event.Account_Name_Platform_Event__c;
        objCust.Last_Name__c = event.Account_Number_Platform_Event__c;
        objCust.Contact_Number__c = event.Account_Phone_Platform_Event__c;
        objCust.Special_Mark_on_Body__c = event.Account_Type_Platform_Event__c+' '+event.Account_Industry_Platform_Event__c;
            
        custList.add(objCust);
        }
        // Insert all custList in the list.
        if(custList.size() > 0){
            insert custList;
        }
    }