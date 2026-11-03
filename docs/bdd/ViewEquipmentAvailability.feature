User Story 8:
As a user, 
I want to see whether equipment is available, 
so that I know whether I can reserve the equipment.

Scenario: View current status of equipment
Given equipment 100 has AVAILABLE status
And equipment 101 has RESERVED status
And equipment 102 has CHECKED_OUT status
And equipment 103 has MAINTENCE status
When the user views the equipment list
Then the system displays equipment 101's status AVAILABLE
And the system displays equipment 102's status RESERVED
And the system displays equipment 103's status CHECKED_OUT
And the system displays equipment 104's status MAINTENANCE.