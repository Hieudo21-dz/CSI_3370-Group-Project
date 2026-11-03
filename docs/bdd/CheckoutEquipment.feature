User story 13:
As an administrator, 
I want to check out equipment to a user, 
so they can borrow the equipment for their benefit.

Scenario: Owner of the reservation checks out reserved equipment
Given the student has an ACTIVE reservation for equipment 100
When the administrator checks out equipment 100 to the student 
Then the system creates a checkout for the student and equipment 100
And the system updates the reservation status to FULFILLED
And the system updates the checkout status to ACTIVE
And the system updates the equipment status to CHECKED_OUT.

Scenario: Reserved equipment cannot be checked out by other users
Given the faculty member has an ACTIVE reservation for equipment 101
When the administrator checks out equipment 101 to the student
Then the system denies creating a checkout between the student and equipment 101
And the system does not create a checkout
And the system keeps equipment 101's status as RESERVED.

Scenario: Available equipment can be checked out to any student or faculty member
Given equipment 102 is AVAILABLE
And equipment 103 is AVAILABLE
And the faculty member is below their active limit
And the student is below their active limit
When the administrator checks out equipment 102 to the faculty member
And the administrator checks out equipment 103 to the student
Then the system creates an ACTIVE checkout between the faculty member and equipment 102
And the system updates equipment 102's status to CHECKED_OUT
And the system creates an ACTIVE checkout between the student and equipment 103
And the system updates equipment 103's status to CHECKED_OUT.

Scenario: Unavailable equipment cannot be checked out
Given equipment 100's status is CHECKED_OUT
And equipment 101's status is MAINTENANCE
When the administrator checks out equipment 100 to the student
And the administrator checks out equipment 101 to the student
Then the system denies creating a checkout between the student and equipment 100
And the system does not create a checkout
And the system keeps equipment 100's status as CHECKED_OUT
And the system denies creating a checkout between the student and equipment 101
And the system does not create a checkout
And the system keeps equipment 101's status as MAINTENANCE.

Scenario: Users at their active limit is denied a checkout
Given the student has 3 active items
And a student has a limit of 3 active items
And equipment 102 is AVAILABLE
When the administrator checks out equipment 102 to the student
Then the system denies creating a checkout between the student and equipment 102
And the system does not create a checkout
And the system keeps equipment 102's status as AVAILABLE.


