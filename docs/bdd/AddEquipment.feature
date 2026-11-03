User Story 5:
As an administrator, 
I want to add equipment, 
so that the equipment can be reserved and checked out.

Scenario: Administrator adds complete equipment info
Given the administrator has the role ADMINISTRATOR
And the following equipment information exists:
  | Identifier | Name      | Type   | Status    |
  | 100        | HP Laptop | Laptop | AVAILABLE |
When the administrator adds the equipment information into the system
Then the system saves the equipment
And the system adds the equipment to its equipment catalog.

Scenario: Administrator adds equipment info with missing field(s)
Given the administrator has the role ADMINISTRATOR
And the following equipment information exists:
  | Identifier | Name      | Type   | Status    |
  |            | HP Laptop | Laptop | AVAILABLE |
  | 101        |           | Laptop | AVAILABLE |
  | 102        | HP Laptop | Laptop | AVAILABLE |
  | 103        | HP Laptop | Laptop | AVAILABLE |
When the administrator adds the equipment information into the system
Then the system rejects the added equipment
And the system does not save the equipment.

Scenario: System accepts specific statuses
Given the administrator has the role ADMINISTRATOR
And the following equipment information exists:
  | Identifier | Name      | Type   | Status      |
  | 100        | HP Laptop | Laptop | AVAILABLE   |
  | 101        | HP Laptop | Laptop | RESERVED    |
  | 102        | HP Laptop | Laptop | CHECKED_OUT |
  | 103        | HP Laptop | Laptop | MAINTENANCE |
  | 104        | HP Laptop | Laptop | BROKEN      |
When the administrator adds the equipment information into the system
Then the systems aceepts equipment 100
And the system accepts equipment 101
And the system accepts equipment 102
And the system accepts equipment 103
And the system rejects equipment 104.

Scenario: Non-administrator cannot add equipment
Given the student has the role STUDENT
And the following equipment information exists:
  | Identifier | Name      | Type   | Status    |
  | 100        | HP Laptop | Laptop | AVAILABLE |
When the student adds the equipment information into the system
Then the system rejects the added equipment
And the system does not save the equipment.

Scenario: System reject duplicate equipment identifiers
Given the administrator has the role ADMINISTRATOR
And equipment 101 is already added to the system
When the administrator adds a new equipment with the identifier 101
Then the system rejects the added equipment
And the system keeps the existing equipment 101 as unchanged.