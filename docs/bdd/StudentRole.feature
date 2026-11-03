User Story 1:
As a student, 
I want the system to distinguish my role, 
so that I can search and reserve equipment, cancel reservations, and view personal reservations and checkouts.

Scenario: Student is permitted student operations
Given the student has the role STUDENT
And the following student operations exist:
  | Operations                           |
  | Search equipment                     |
  | View equipment availbility           |
  | Reserve available equipment          |
  | Cancel reservation                   |
  | View personal reservations/checkouts |
When the student attempts to do a student operation
Then the system permits the operation.

Scenario: System applies student limit and loan period
Given the student has the role STUDENT
And STUDENT is allowed 3 active reservations
And STUDENT is allowed 3 active checkouts
And STUDENT is allowed 7 day loan period
When the system determines the student's limit and loan period
Then the system provides a maximum of 3 active reservations
And the system provides a maximum of 3 active checkouts
And the system provides a maximum loan peiod of 7 days.

Scenario: Student is denined administartor operations
Given the student has the role STUDENT
And the following administrator operations exist:
  | Operations          |
  | Add equipment       |
  | Update equipment    |
  | Check out equipment |
  | Return equipment    |
When the student attempts to do an administrator operation
Then the system denies the operation.