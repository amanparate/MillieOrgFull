global with sharing class pocWebCall {
    
    @AuraEnabled
    global static Object getResult(){
        try {
            Http http = new Http();
            HttpRequest req = new HttpRequest();
            //req.setEndpoint('https://6437aa2c894c9029e8c2b2ad.mockapi.io');
            req.setEndpoint('https://api.openbrewerydb.org/v1/breweries');
            req.setMethod('GET');
            HttpResponse resp = http.send(req);
            if(resp.getStatusCode() == 200){
                System.debug('@@@Resp: ' + JSON.deserializeUntyped(resp.getBody()));
                return JSON.deserializeUntyped(resp.getBody());
            }
            else {
                return null;
            }
            

        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    } 
    
}