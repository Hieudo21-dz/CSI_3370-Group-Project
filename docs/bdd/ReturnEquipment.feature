User Story 15:
As an administrator, 
I want to process equipment returns, 
so that equipment becomes available for other users to reserve and checkout.

Scenario: Equipment is returned
Given the student has an active checkout for equipment 100
And today is 10/30/2026
When the administrator processes the return for equipment 100
Then the system records the return date for the checkout as 10/30/2026
And the system updates the equipment status to AVAILABLE
And the system updates the checkout status to RETURNED.

Scenario: Returned equipment is rejected if checkout is not active
Given the student has a RETURNED checkout for equipment 101
When the administrator processes the return for equipment 101
Then the system reject the equipment return
And the system keeps the equipment status unchanged
And the system keeps the checkout status as RETURNED.