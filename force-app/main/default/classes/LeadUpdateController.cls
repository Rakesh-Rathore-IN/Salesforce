public class LeadUpdateController {
    public static void updateLeads() {
        // Query Lead records that meet your criteria
        List<Lead> leadsToUpdate = [SELECT Id, FirstName, LastName, Company, Status FROM Lead WHERE Status = 'Open' LIMIT 10];

        if (!leadsToUpdate.isEmpty()) {
            // Modify the Lead records
            for (Lead lead : leadsToUpdate) {
                lead.Status = 'Contacted';
                lead.Company = 'Updated Company Name';
            }

            // Update the Lead records
            update leadsToUpdate;
        }
    }
}