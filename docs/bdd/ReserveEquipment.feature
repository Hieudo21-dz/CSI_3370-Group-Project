User Story 9:
As a user, 
I want to reserve available equipment, 
so that I can use it for my classes.

Scenario: Reserve available equipment
Given equipment 100 is available
And the student is below their active reservation limit
When the student reserves equipment 100
Then the system creates a reservation with an ACTIVE status between the student and equipment 100
And the system updates equipment 100's status to RESERVED.

Scenario: Second user cannot reserve same equipment
Given the faculty member has an ACTIVE reservation for equipment 101
And the student is below their active reservation limit
When the student reserves equipment 101
Then the system rejects the reservation
And the system keeps the faculty member's reservation ACTIVE.
