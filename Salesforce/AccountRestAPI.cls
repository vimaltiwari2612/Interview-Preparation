@RestResource(urlMapping='/account/*')
/*
https://trailhead.salesforce.com/en/content/learn/modules/apex_integration_services/apex_integration_rest_callouts
*/
global class AccountRestAPI {
    //////////////// Query String based methods -> GET and Delete
    @HttpGet
    global static List<Account> getAccount(){
        return getAccounts(RestContext.request);
    }
    
    @HttpDelete
    global static String deleteAccount(){
        delete getAccounts(RestContext.request);
        return 'Deleted successfully ';
    }
    //////////////// Query String and Body based methods -> PATCH , PUT, POST
    @HttpPatch
    global static List<Account> updateAccount(){
        String requestBody = RestContext.request.requestBody.toString();
        List<Account> results =  getDeserilizedAccountDetails(requestBody);
        System.debug(results);
        update results;
        return results;
    }
    
    @HttpPost
    global static String addAccount(){
        String requestBody = RestContext.request.requestBody.toString();
        List<Account> accounts = getDeserilizedAccountDetails(requestBody);
        insert accounts;
        return 'created successfully';
    }
    
    @HttpPut
    global static String addOrUpdateAccount(){
        String requestBody = RestContext.request.requestBody.toString();
        List<Account> accounts = getDeserilizedAccountDetails(requestBody);
        upsert accounts;
        return 'Updates happend successful';
    }

	///////////////////////////////////////////HELPER CLASSES AND METHODS
    //wrapper for Account
    public class AccountWrapper{
        public String name;
        public String rating;
        public String recordId;
        //add more fields here and in wrapper class
    }
    
    private static String getFields(){
            return 'Id, Name, Rating'; //add more fields here and in wrapper class
    }
    
    private static List<Account> getDeserilizedAccountDetails(String requestBody){
        JSONParser parser = JSON.createParser(requestBody);
        List<Account> accounts = new List<Account>();
        while(parser.nextToken() != null){
            if(parser.getCurrentToken() == JSONToken.START_OBJECT){
                AccountWrapper aw = (AccountWrapper)parser.readValueAs(AccountWrapper.class);
                Account acc = new Account();
                if(aw.Name != null){
                	acc.Name = aw.Name;
                }
                if(aw.Rating != null){
                	acc.Rating = aw.rating;
                }
                if(aw.recordId != null){
                    acc.Id = aw.recordId;
                }
                accounts.add(acc);
                parser.skipChildren();
            }
        }
        return accounts;
    }
    
    private static List<Account> getAccounts(RestRequest request){
        String accName = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        List<String> idsOrNamesList = accName.split(',');
        List<Account> results = (List<Account>)Database.query('SELECT '+getFields()+' FROM Account WHERE Name IN :idsOrNamesList OR ID in :idsOrNamesList');
        return results;
    }
    
}