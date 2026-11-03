User Story 4:
As a user, 
I want to view my current reservations and active checkouts, 
so that I know what is currently on hold and when equipment is due.

Scenario: Systen displays onle active reservations and active checkouts
Given the student has an ACTIVE reservation for equipment 100
And the student has a CANCELLED reservation for equipment 101
And the student has an ACTICE checkout for equipment 102
And the student has a RETURNED checkout for equipment 103
When the student views their reservations and checkouts
Then the system displays the reservation list containing only the reservation for equipment 100
And the system displays the checkout list containing only the checkout for equipment 103.

Scenario: System displays only the user's records
Given the student has an ACTIVE reservation for equipment 103
And the student has an ACTIVE checkout for equipment 102
And the faculty member has an ACTIVE reservation for equipment 101
And the faculty member has an ACTIVE checkout for equipment 100
When the student views their reservations and checkouts
Then the system displays the reservation list containing the reservation for equipment 103
And the system displays the checkout list containing only the checkout for equipment 102
And the system does not display the reservation for equipment 101
And the system does not diplay the checkout for equipment 100.

Scenario: System displays checkout date and return date for active checkouts.
Given the faculty member has an ACTIVE checkout for equipment 100
When the faculty member views their reservations and checkouts
Then the system displays the checkout date for equipment 100
And the system displays the return date for equipment 100.

Scenario: No active reservations
Given the faculty member has no ACTIVE reservations
When the faculty member views their reservations and checkouts
Then the system displays the reservation list as empty

Scenario: No active checkouts
Given the faculty member has no ACTIVE checkouts
When the faculty member views their reservations and checkouts
Then the system displays the checkout list as empty


