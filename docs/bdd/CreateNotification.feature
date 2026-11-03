User Story 16:
As a user, 
I want to receive a notification when a reservation or checkout is successfully completed, 
so that I have a confirmation.

Scenario: Reservation notification
Given equipment 101 is AVAILABLE
And the student is below their active items limit
When the student reserves equipment 101
Then the system displays a successful reservation notification.

Scenario: Checkout notification
Given equipment 102 is AVAILABLE
And the student is below their active items limit
When the administrator checks out equipment 102 to the student
Then the system displays a successful checkout notification.

Scenario: Failed reservation displays no notification
Given the student has 3 active items
And a student has a limit of 3 active items
And equipment 100 is AVAILABLE
When the student reserves equipment 100
Then the system does not display a successful reservation notification.

Scenario: Failed checkout displays no notification
Given the student has 3 active items
And a student has a limit of 3 active items
And equipment 103 is AVAILABLE
When the administrator checks out equipment 103 to the student
Then the system does not display a successful checkout notification.

