User Story 10:
As a user, 
I want to receive a clear message when I cannot reserve equipment, 
so that I know why that is the case.

Scenario: Reserved equipment cannot be reserved 
Given equipment 100 has status RESERVED 
When the student reserves equipment 100
Then the system rejects reserving equipment 100
And the system displays equipment with status RESERVED cannot be reserved
And the system does not create the reservation
And the system keeps equipment 100's status RESERVED.

Scenario: Checked out equipment cannot be reserved
Given equipment 101 has status CHECKED_OUT
When the student reserves equipment 101
Then the system rejects reserving equipment 101
And the system displays equipment with status CHECKED_OUT cannot be reserved
And the system does not create the reservation
And the system keeps equipment 101's status CHECKED_OUT 

Scenario: Equipment under maintenance cannot be reserved
Given equipment 102 has status MAINTENANCE
When the student reserves equipment 102
Then the system rejects reserving equipment 102
And the system displays equipment with status MAINTENANCE cannot be reserved
And the system does not create the reservation
And the system keeps equipment 101's status MAINTENANCE.