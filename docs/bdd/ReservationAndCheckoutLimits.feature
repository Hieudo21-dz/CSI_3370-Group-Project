User Story 11:
As a system administrator, 
I want to set a maximum limit of active reservations and checkouts for each user role, 
so that equipment is shared fairly.

Scenario: Configuration sets student limit
Given the configuration sets the STUDENT limit to 3
And the student has 2 active items
And equipment 100 is AVAILABLE
When the student reserves equipment 100
Then the system creates a reservation between the student and equipment 100.

Scenario: Configuration sets faculty limit
Given the configuration sets the FACULTY limit to 5
And the faculty member has 5 active items
And equipment 100 is AVAILABLE
When the faculty member reserves equipment 100
Then the system rejects creating a reservation between the faculty member and equipment 100.

Scenario: System denies user with maximum limit
Given the student has 3 active items
And a student is allowed a maximum limit of 3 active items
And equipment 103 is AVAILABLE
When the student reserves equipment 103
Then the system rejects creating the reservation
And the system displays that the limit has been reached
And the system keeps equipment 103's status as AVAILABLE.

Scenario: User is below maximum limit
Given the student has 2 active items
And a student is allowed a maximum limit of 3 active items
And equipment 104 is AVAILABLE
When the student reserves equipment 104
Then the system creates a reservation between the student and equipment 104.

Scenario: Faculty members have higher limits than students
Given the professor has 3 active items
And the student has 3 active items
And a faculty member is allowed a maximum limit of 5 active items
And a student is allowed a maximum limit of 3 active items
And equipment 100 is AVAILABLE
And equipment 101 is AVAILABLE
When the faculty member reserves equipment 100
And the student reserved equipment 101
Then the system creates a reservation for the faculty member and equipment 100
And the system rejects creating a reservation for the student and equipment 101.

Scenario: Active reservations and active checkouts both count toward the active limit
Given the student has 1 ACTIVE reservation
And the student has 2 ACTIVE checkouts
And a student is allowed a maximum limit of 3 active items
And equipment 102 is AVAILABLE
When the student reserves equipment 102
Then the system rejects creating a reservation for the student and equipment 102.

Scenario: Cancelling a reservation frees capacity
Given the student has 3 active items
And one of those active items is a reservation
And a student is allowed a maximum limit of 3 active items
When the student cancels the reservation
Then the system updates the student's active items count to 2.

Scenario: Returning a checkout frees capacity
Given the student has 3 active items
And one of those active items is a checkout
And a student is allowed a maximum limit of 3 active items
When the student returns an equipment
Then the system updates the student's active items count to 2.

Scenario: Fulfilling a reservation turns it into a checkout
Given the student has 3 active items
And one of those actice items is a reservations for equipment 101
When the administrator checks out equipment 101 to the student
Then the system updates the reservation status to FULFILLED
And the system updates the checkout status to ACTIVE
And the system keep the student's active item count to 3.