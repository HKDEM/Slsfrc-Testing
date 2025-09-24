public with sharing class BadExample {
    public static void insecureMethod(String soqlInput) {
        // ⚠️ SOQL injection risk
        String query = 'SELECT Id, Name FROM Account WHERE Name = \'' + soqlInput + '\'';
        List<Account> accs = Database.query(query);

        // ⚠️ Hard-coded credentials
        String apiKey = '12345-SECRET-KEY';
        System.debug(apiKey);

        // ⚠️ Inefficient loop inside query
        for (Account a : accs) {
            List<Contact> cons = [SELECT Id FROM Contact WHERE AccountId = :a.Id];
            System.debug(cons);
        }
    }
}
