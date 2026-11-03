User Story 12:
As a user, 
I want to cancel a reservation, 
so that other people can reserve and check out the equipment.

Scenario: Owner cancels their active reservation
Given the student has an active reservation for equipment 100
When the student cancels the reservation
Then the system updates the reservation status to CANCELLED
And the system updates the equipment status to AVAILABLE.

Scenario: User cannot cancel another user's reservation
Given the faculty member has an active reservation for equipment 101
When the student cancels the reservation
Then the system denies the cancellation
And the systems keeps the reservation ACTIVE
And the system keep equipment 101's status as RESERVED.

Scenario: Cancelled reservations cannot be cancelled
Given the student has a CANCELLED reservation
When the student cancels the reservation
Then the system denies the cancellation
And the system keeps the reservation CANCELLED.

Scenario: Fulfilled reservations cannot be cancelled
Given the student has a FULFILLED reservation
When the student cancels the reservation
Then the system denies the cancellation
And the system keeps the reservation FULFILLED.

Scenario: Reservation that do not exist cannot be cancelled
Given the student has no reservation
When the student cancells the reservation
Then the system denies the cancellation.