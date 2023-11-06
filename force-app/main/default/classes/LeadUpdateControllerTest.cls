@isTest
public class LeadUpdateControllerTest {
    @isTest
    static void testUpdateLeads() {
        // Create a test Lead record with 'Open' status
        Lead testLead = new Lead(
            FirstName = 'Test5',
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
        Lead updatedLead = [SELECT Id, Status, Company FROM Lead WHERE Id = :testLead.Id LIMIT 1];

        System.assertEquals('Contacted', updatedLead.Status);
        System.assertEquals('Updated Company Name', updatedLead.Company);
    }
}