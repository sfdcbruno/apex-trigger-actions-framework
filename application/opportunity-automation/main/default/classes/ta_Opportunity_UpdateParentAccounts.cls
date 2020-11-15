public class ta_Opportunity_UpdateParentAccounts implements TriggerAction.AfterUpdate {
    
    public void afterUpdate(List<Opportunity> newList, List<Opportunity> oldList) {
        Map<Id,Opportunity> newMap = new Map<Id,Opportunity>(newList);
        Map<Id,Opportunity> oldMap = new Map<Id,Opportunity>(oldList);
        Set<Id> newAccountIds = new Set<Id>();
        for (Opportunity opp : newList) {
            if (oldMap.get(opp.Id).AccountId != opp.AccountId) {
                newAccountIds.add(opp.AccountId);
            }
        }
        MetadataTriggerHandler.bypass('ta_Opportunity_UpdateParentAccounts');
        TriggerBase.bypass('Account');
        AccountHelper.doSomeStuff(newAccountIds);
    }
}
