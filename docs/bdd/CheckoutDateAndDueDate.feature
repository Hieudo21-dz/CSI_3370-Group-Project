User Story 14:
As an administrator, 
I want every checkout to record the current date and determine the due date of the equipment, 
so that users are aware of when equipment needs to be returned.

Scenario: Checkout records checkout date and calculates due date by role
Given today is 10/28/2026
And equipment 100 is AVAILABLE
And the following loan periods exist for each user:
  | User    | Loan Period | Due Date   |
  | STUDENT | 7 days      | 11/04/2026 |
  | FACULTY | 14 days     | 11/11/2026 |
When the administrator checks out equipment 100 to <User>
Then the system records the checkout date as 10/28/2026
And the system calculates the due date as <Due Date>.

Scenario: Due dates is calculated from configuration
Given the configuration sets STUDENT loan period as 7 days
And today is 10/29/2026
And equipment 101 is available
When the administrator checks out equipment 101 to the student
Then the system calculates the due date as 11/05/2026.

Scenario: System displays due date to user
Given the student has an ACTIVE checkout for equipment 102
And equipment 102's due date is 11/04/2026
When the student views their active reservations and checkouts
Then the system displays equipment 102's due date as 11/04/2026.
