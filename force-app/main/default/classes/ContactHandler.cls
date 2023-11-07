public with sharing class ContactHandler {
    /**
     * Creates a new Contact record.
     * 
     * @param firstName The first name of the contact.
     * @param lastName The last name of the contact.
     * @param email The email address of the contact.
     * @return The newly created Contact record.
     */
    public static Contact createContact(String firstName, String lastName, String email) {
        Contact newContact = new Contact();
        newContact.FirstName = firstName;
        newContact.LastName = lastName;
        newContact.Email = email;
    
        try {
            if (Schema.sObjectType.Contact.isCreateable()) {
                insert newContact;
            }
            return newContact;
        } catch (DmlException e) {
            // Handle the DML exception as needed (e.g., logging)
            System.debug('DML Exception: ' + e.getMessage());
            return null; // Or take other error-handling actions
        }
    }
    
}
