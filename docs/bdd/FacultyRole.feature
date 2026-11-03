User Story 2:
As a faculty member, 
I want the system to distinguish my role, 
so that I can search and reserve equipment, cancel reservations, and view personal reservations and checkouts with different limitations from a student.

Scenario: Faculty member is permitted faculty operations
Given the faculty member has the role FACULTY
And the following faculty operations exist:
  | Operations                           |
  | Search equipment                     |
  | View equipment availbility           |
  | Reserve available equipment          |
  | Cancel reservation                   |
  | View personal reservations/checkouts |
When the faculty member attempts to do a faculty operation
Then the system permits the operation.

Scenario: System applies faculty limit and loan period
Given the faculty mmeber has the role FACULTY
And FACULTY is allowed 5 active reservations
And FACULTY is allowed 5 active checkouts
And FACULTY is allowed 14 day loan period
When the system determines the faculty's limit and loan period
Then the system provides a maximum of 5 active reservations
And the system provides a maximum of 5 active checkouts
And the system provides a maximum loan peiod of 14 days.

Scenario: Faculty is denined administartor operations
Given the faculty member has the role FACULTY
And the following administrator operations exist:
  | Operations          |
  | Add equipment       |
  | Update equipment    |
  | Check out equipment |
  | Return equipment    |
When the faculty member attempts to do an administrator operation
Then the system denies the operation.