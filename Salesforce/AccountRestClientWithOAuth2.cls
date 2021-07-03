public class AccountRestClientWithOAuth2 {
    private static string BASE_URL = 'callout:Covid_org/';
    
    
    public void getAccounts(Set<Id> accIds){
      
        String ids = '';
        for(Id i : accIds){
            ids += ','+i;
        }
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setHeader('Content-Type','application/json');
        req.setEndpoint(BASE_URL+ids.substring(1));

        Http http = new Http();
        HTTPResponse res = http.send(req);
        if(res.getStatusCode() == 200){
        	List<Account> accounts = parseAccountResponse(res.getBody());
            if(accounts.size() > 0){
                upsert accounts Migrated_Account_Id__c;
            }
        }else{
            System.debug('Body ' + res.getBody());
            System.debug('Status ' + res.getStatus());
            System.debug('Status code ' + res.getStatusCode());
        }
    }
    
    public void refreshOrg(){
     
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setHeader('Content-Type','application/json');
        req.setEndpoint(BASE_URL+'ALL');

        Http http = new Http();
        HTTPResponse res = http.send(req);
        if(res.getStatusCode() == 200){
        	List<Account> accounts = parseAccountResponse(res.getBody());
            if(accounts.size() > 0){
                upsert accounts Migrated_Account_Id__c;
                system.debug('accounts '+accounts.size());
            }
        }else{
            System.debug('Body ' + res.getBody());
            System.debug('Status ' + res.getStatus());
            System.debug('Status code ' + res.getStatusCode());
        }
    }
    
    public void updateAccounts(List<Account> accountsToBeUpdated){
       
        HttpRequest req = new HttpRequest();
        req.setMethod('PUT');
        req.setHeader('Content-Type','application/json');
        req.setEndpoint(BASE_URL);
        
        JSONGenerator gen = JSON.createGenerator(true);
        
        list<map<string,string>> listAcc=new list<map<string,string>> ();
        for(Account ac : accountsToBeUpdated){
             Map<string,string> singleAcc=new map<string,string>();
           
            singleAcc.put('Name',ac.Name+' Updated From Integration Org');
            singleAcc.put('Id',ac.migrated_Account_id__c);
            listAcc.add(singleAcc);
        }
        gen.writeObject(listAcc);
        req.setBody(gen.getAsString());
        
        Http http = new Http();
        HTTPResponse res = http.send(req);
        if(res.getStatusCode() == 200){
        	System.debug('Successfully updated');
        }else{
            System.debug('Body ' + res.getBody());
            System.debug('Status ' + res.getStatus());
            System.debug('Status code ' + res.getStatusCode());
        }
    }
    
     //wrapper for Account
    public class AccountWrapper{
        public String name;
        public String id;
        //add more fields here and in wrapper class
    }
    
    private List<Account> parseAccountResponse(String response){
        JSONParser parser = JSON.createParser(response);
        List<Account> accounts = new List<Account>();
            while(parser.nextToken() != null){
                if(parser.getCurrentToken() == JSONToken.START_OBJECT){
                   AccountWrapper aw = (AccountWrapper)parser.readValueAs(AccountWrapper.class);
                    Account acc = new Account();
                    if(aw.Name != null){
                        acc.Name = aw.Name;
                    }
                    if(aw.Id != null){
                        acc.migrated_Account_id__c = aw.Id;
                    }
                    acc.Is_Migrated__c = true;
                    accounts.add(acc);
                    parser.skipChildren();
                }
            }
        return accounts;
   
  
    }
}