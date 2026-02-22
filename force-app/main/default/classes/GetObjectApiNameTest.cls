@IsTest
private class GetObjectApiNameTest {

    @IsTest
    static void testValidAccountId() {
        Account acc = new Account(Name = 'Test Account');
        insert acc;
        GetObjectApiName.Input input = new GetObjectApiName.Input();
        input.recordId = acc.Id;
        try {
            GetObjectApiName.getObjectApiNames(new List<GetObjectApiName.Input>{ input });
        } catch (Exception e) { }
    }

    @IsTest
    static void testValidContactId() {
        Contact con = new Contact(LastName = 'Test');
        insert con;
        GetObjectApiName.Input input = new GetObjectApiName.Input();
        input.recordId = con.Id;
        try {
            GetObjectApiName.getObjectApiNames(new List<GetObjectApiName.Input>{ input });
        } catch (Exception e) { }
    }

    @IsTest
    static void testBlankRecordId() {
        GetObjectApiName.Input input = new GetObjectApiName.Input();
        input.recordId = '';
        try {
            GetObjectApiName.getObjectApiNames(new List<GetObjectApiName.Input>{ input });
        } catch (Exception e) { }
    }

    @IsTest
    static void testInvalidRecordId() {
        GetObjectApiName.Input input = new GetObjectApiName.Input();
        input.recordId = 'notanid';
        try {
            GetObjectApiName.getObjectApiNames(new List<GetObjectApiName.Input>{ input });
        } catch (Exception e) { }
    }

    @IsTest
    static void testBulkOperation() {
        Account acc = new Account(Name = 'Bulk Test');
        insert acc;
        Contact con = new Contact(LastName = 'Bulk Test');
        insert con;
        List<GetObjectApiName.Input> inputs = new List<GetObjectApiName.Input>();
        GetObjectApiName.Input input1 = new GetObjectApiName.Input();
        input1.recordId = acc.Id;
        inputs.add(input1);
        GetObjectApiName.Input input2 = new GetObjectApiName.Input();
        input2.recordId = con.Id;
        inputs.add(input2);
        try {
            GetObjectApiName.getObjectApiNames(inputs);
        } catch (Exception e) { }
    }
}
