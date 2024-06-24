public class PropertyHandler_LWC {

    @AuraEnabled(cacheable=true)
    public static List<Property__c> getProperty(String type, String verified) {
        // Ensure the verified parameter is "true" or "false"
        if (verified != 'true' && verified != 'false') {
            throw new IllegalArgumentException('The verified parameter must be "true" or "false".');
        }

        return [SELECT Id, Location__c, Property_Name__c, Type__c, Verified__c 
                FROM Property__c 
                WHERE Type__c = :type AND Verified__c = :verified];
    }
}
