public with sharing class LeadUpdateController {
    public static void updateLeads() {
        // Query Lead records that meet your criteria
        List<Lead> leadsToUpdate = [SELECT Id, FirstName, LastName, Company, Status FROM Lead WHERE Status = 'Open' WITH SECURITY_ENFORCED LIMIT 10];

        if (!leadsToUpdate.isEmpty()) {
            // Modify the Lead records
            for (Lead lead : leadsToUpdate) {
                if (Schema.sObjectType.Lead.fields.Status.isUpdateable()) {
                    lead.Status = 'Contacted';
                }
                if (Schema.sObjectType.Lead.fields.Company.isUpdateable()) {
                    lead.Company = 'Updated Company Name';
                }
            }
            // Update the Lead records
            update leadsToUpdate;
        }
    }
}