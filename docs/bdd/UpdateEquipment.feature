User Story 6:
As an administrator, 
I want to update the equipment information, 
so that students and faculty can know when the equipment is available, reserved, checked out, or under maintenance.

Scenario: Administrator puts available equipment under maintenance
Given equipment 100 has AVAILABLE status
When the administrator updates the status of equipment 101 to MAINTENANCE
Then the system modifies equipment 101's status to MAINTENANCE.

Scenario: Administrator updates equipment from MAINTENANCE to AVAILABLE
Given equipment 101 has MAINTENANCE status
When the administrator updates the status of equipment 103 to AVAILABLE
Then the system modifies equipment 103's status to AVAILABLE.

Scenario: Administrator updates equipment name and Type
Given equipment 102 exists
When the administrator updates equipment 102's name to "IPAD Pro"
And the administrator updates equipment 102's type to "IPAD"
Then the system modifies equipment 102's name to "IPAD Pro"
And the system modifies equipment 102's type to "IPAD".

Scenario: Equipment reserved or checked out cannot be put under maintenance
Given equipment 103 has RESERVED status
And equipment 104 has CHECKED_OUT status
When the administrator updates equipment 103's status to MAINTENANCE
And the administrator updates equipment 104's status to MAINTENANCE
Then the system rejects the update status for equipment 103
And the the system rejects the update status for equipment 104
And the system keeps equipment 103's status as RESERVED
And the system keeps equipment 104's status as CHECKED_OUT.

Scenario: Non-administrators cannot update equipment
Given the student has the role STUDENT
And equipment 105 exists
When the student changes the name of equipment 105
Then the system rejects the update
And the system keeps equipment 105's name unchanged.

