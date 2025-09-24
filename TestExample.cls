public without sharing class TestExample {

    // ⚠️ Unused method
    public static void unusedMethod() {
        System.debug('This method is never called');
    }

    // ⚠️ Hardcoded password
    public static Boolean loginUser(String username) {
        String password = 'MySecret123';
        if(username == 'admin' && password == 'MySecret123') {
            return true;
        }
        return false;
    }

    // ⚠️ DML inside loop
    public static void createContacts(List<Account> accounts) {
        for(Account a : accounts) {
            Contact c = new Contact(LastName = 'Test', AccountId = a.Id);
            insert c; // bad practice: DML inside loop
        }
    }
}
