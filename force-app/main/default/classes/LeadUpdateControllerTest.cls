/**
 * Test class for the LeadUpdateController class.
 * This class contains test methods to validate the behavior of the LeadUpdateController.
 * 
 * Disclaimer: This is a test class and is not intended for production use.
 */

@isTest
public class LeadUpdateControllerTest {


    @isTest
    static void testUpdateLeads() {
        // Create a test Lead record with 'Open' status
        Lead testLead = new Lead(
            FirstName = 'Test2',
            LastName = 'Lead',
            Company = 'Test Company',
            Status = 'Open'
        );
        insert testLead;

        // Call the updateLeads method from the controller
        Test.startTest();
        LeadUpdateController.updateLeads();
        Test.stopTest();

        // Verify that the Lead record was updated
        Lead updatedLead = [SELECT Id, Status, Company FROM Lead WHERE Id = :testLead.Id WITH SECURITY_ENFORCED LIMIT 1];

        System.assertEquals('Contacted', updatedLead.Status, 'Contacted Done');
        System.assertEquals('Updated Company Name', updatedLead.Company, 'Updated Company Name');
    }
}