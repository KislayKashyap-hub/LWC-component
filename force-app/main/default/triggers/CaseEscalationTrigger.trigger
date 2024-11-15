trigger CaseEscalationTrigger on Case (before insert, before update) {
    if (Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)) {
        CaseEscalationHandler.handleCaseEscalation(Trigger.new);
    }
}