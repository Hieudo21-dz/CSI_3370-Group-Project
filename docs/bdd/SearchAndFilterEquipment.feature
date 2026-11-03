User Story 7:
As a user, 
I want to search and filter equipment by type, 
so that I can find what I need.

Scenario: No search or filter criteria applied
Given the following equipment information
  | Identifier | Name            | Type    | Status      |
  | 100        | HP Laptop       | Laptop  | AVILABLE    |
  | 101        | IPAD Pro        | IPAD    | CHECKED_OUT |
  | 102        | Dell Laptop     | Laptop  | AVAILABLE   |
  | 103        | Brother Printer | Printer | MAINTENANCE |
When the user searches with no search or filter criteria
Then the system displays equipment 100
And the system displays equipment 101
And the system displays equipment 102
And the system displays equipment 103.

Scenario: Filter equipment by type
Given the following equipment information
  | Identifier | Name            | Type    | Status      |
  | 100        | HP Laptop       | Laptop  | AVILABLE    |
  | 101        | IPAD Pro        | IPAD    | CHECKED_OUT |
  | 102        | Dell Laptop     | Laptop  | AVAILABLE   |
  | 103        | Brother Printer | Printer | MAINTENANCE |
When the user filters by type Laptop
Then the system displays equipment 100
And the system displays equipment 102
And the system does not display equipment 101
And the system does not display equipment 103.

Scenario: Search equipment by name
Given the following equipment information
  | Identifier | Name            | Type    | Status      |
  | 100        | HP Laptop       | Laptop  | AVILABLE    |
  | 101        | IPAD Pro        | IPAD    | CHECKED_OUT |
  | 102        | Dell Laptop     | Laptop  | AVAILABLE   |
  | 103        | Brother Printer | Printer | MAINTENANCE |
When the user searches for the name "IPAD Pro"
Then the system displays equipment 101
And the system does not display equipment 100
And the system does not display equipment 102
And the system does not display equipment 103.

Scenario: Apply more than one filter 
Given the following equipment information
  | Identifier | Name            | Type    | Status      |
  | 100        | HP Laptop       | Laptop  | AVILABLE    |
  | 101        | IPAD Pro        | IPAD    | CHECKED_OUT |
  | 102        | Dell Laptop     | Laptop  | AVAILABLE   |
  | 103        | Brother Printer | Printer | MAINTENANCE |
When the user filters by type Laptop
And the user filters by name "HP Laptop"
And the user filters by status AVAILABLE
Then the system displays equipment 100
And the system does not display equipment 101
And the system does not display equipment 102
And the system does not display equipment 103.

Scenario: No results match filter or search criteria
Given the following equipment information
  | Identifier | Name            | Type    | Status      |
  | 100        | HP Laptop       | Laptop  | AVILABLE    |
  | 101        | IPAD Pro        | IPAD    | CHECKED_OUT |
  | 102        | Dell Laptop     | Laptop  | AVAILABLE   |
  | 103        | Brother Printer | Printer | MAINTENANCE |
When the user filters by type Projector
Then the system displays an empty equipment list.