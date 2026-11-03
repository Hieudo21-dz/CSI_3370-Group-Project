User Story 3:
As an administrator, 
I want the system to distinguish my role, 
so that I can manage equipment records and process equipment checkout and return operations.

Scenario: Administrator is permitted administrator operations
Given the administrator has the role ADMINISTRATOR
And the following administrator operations exist:
  | Operations          |
  | Add equipment       |
  | Update equipment    |
  | Check out equipment |
  | Return equipment    |
When the administrator attempts to do an administrator operation
Then the system permits the operation.

Scenario: Administrator cannot create reservation
Given the administrator has the role ADMINISTRATOR
And equipment 100 is available
And the following administrator operations exist:
  | Operations          |
  | Add equipment       |
  | Update equipment    |
  | Check out equipment |
  | Return equipment    |
When the administrator attempts to reserve equipment 100
Then the system denies the reservation
And the system does not create a reservation.