trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    // List to hold the tasks that will be created
    List<Task> tasksToCreate = new List<Task>();

    // Loop through the opportunities being processed
    for (Opportunity opp : Trigger.new) {
        // Check if the stage is 'Closed Won'
        if (opp.StageName == 'Closed Won') {
            // Create a new task and set its properties
            Task followUpTask = new Task(
                Subject = 'Follow Up Test Task',
                WhatId = opp.Id,  // Associate the task with the opportunity
                Status = 'Not Started',  // Default status
                Priority = 'Normal',  // Default priority
                OwnerId = opp.OwnerId  // Assign the task to the opportunity owner
            );
            // Add the task to the list
            tasksToCreate.add(followUpTask);
        }
    }

    // Insert all tasks at once to avoid hitting governor limits
    if (!tasksToCreate.isEmpty()) {
        insert tasksToCreate;
    }
}