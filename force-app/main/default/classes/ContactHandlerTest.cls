@isTest
private class ContactHandlerTest {
    @isTest
    static void testCreateContact() {
        Contact newContact = ContactHandler.createContact('John', 'Doe1', 'john.doe@example.com');
        System.assertNotEquals(null, newContact.Id, 'Contact was not created');
        System.assertEquals('John', newContact.FirstName, 'First name is incorrect');
        System.assertEquals('Doe', newContact.LastName, 'Last name is incorrect');
        System.assertEquals('john.doe@example.com', newContact.Email, 'Email is incorrect');
    }
}
