public class AccountRestClient {

  	
    private AuthResponse auth_data = null;
    private static string BASE_URL = 'https://coviddatacom-dev-ed.my.salesforce.com/services/apexrest/account/';
    
    public AccountRestClient(){
        this.setAccessToken();
    }
    
    private void setAccessToken(){
        Map<String, String> request = new Map<String, String>();
        request.put('client_id','3MVG9fe4g9fhX0E61lMPpSttvhNgHVUAb3FjVr4_ijxyLWsMzzT7CJd2TTx2kSSWxtVXdCGZ2UQysYLtZNMBL');
        request.put('client_secret','0B79296852CD08F900EE3CF705D4900B7A41A23F09954303E3B0094D6D53BA39');
        request.put('username','');
        request.put('password','');
        request.put('grant_type','password');
        
        String mapString = String.valueOf(request).replace(',','&')
            .replace(' ','').replace('{','').replace('}','');
        System.debug('Request String '+mapString);
        
        HttpRequest req = new HttpRequest();
        req.setMethod('POST');
        req.setHeader('Content-Type','application/x-www-form-urlencoded');
        req.setEndpoint('callout:Covid_org');
        req.setBody(mapString);
        
        Http http = new Http();
        HTTPResponse res = http.send(req);
       
        if(res.getStatusCode() == 200){
        	auth_data = new AuthResponse(res.getBody());
        }else{
            System.debug('Body ' + res.getBody());
            System.debug('Status ' + res.getStatus());
            System.debug('Status code ' + res.getStatusCode());
        }
       	
    }
    
    public void getAccounts(Set<Id> accIds){
        System.debug(this.auth_data.auth_token);
        String ids = '';
        for(Id i : accIds){
            ids += ','+i;
        }
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setHeader('Content-Type','application/json');
        req.setHeader('Authorization','Bearer '+this.auth_data.auth_token);
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
        System.debug(this.auth_data.auth_token);
       
        HttpRequest req = new HttpRequest();
        req.setMethod('GET');
        req.setHeader('Content-Type','application/json');
        req.setHeader('Authorization','Bearer '+this.auth_data.auth_token);
        req.setEndpoint(BASE_URL+'ALL');

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
    
    public void updateAccounts(List<Account> accountsToBeUpdated){
        System.debug(this.auth_data.auth_token);
       
        HttpRequest req = new HttpRequest();
        req.setMethod('PUT');
        req.setHeader('Content-Type','application/json');
        req.setHeader('Authorization','Bearer '+this.auth_data.auth_token);
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
    
    public class AuthResponse{
        public String auth_token; 
        public String instance_url;
        public String orgId;
        public String issue_Time_stamp;
        public String token_type;
        public String signature;
        
        public AuthResponse(String response){
            JSONParser parser = JSON.createParser(response);
            while(parser.nextToken() != null){
                if(parser.getCurrentToken() == JSONToken.START_OBJECT){
                    parser.nextToken();
                    if(parser.getText() == 'access_token'){
                        parser.nextToken();
                        this.auth_token = parser.getText();
                    }
                    parser.skipChildren();
                }
            } 
        }
        
    }
}
