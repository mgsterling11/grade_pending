  1) Restaurants
    (has_one :cuisine_description)
    (has_one :address)
    (has_one :violation_description)
    - Name
    - Address
    - Inspection date
    - grade name (A, B, C, grade Pending, closed)

  2) Violation description  
    (belongs_to :restaurant)
    - Violation code
    - Violation description
    - Restaurant Id

  3) ADDRESS
    (belongs_to :restaurant)
    - boro
    - building
    - street 
    - zipcode
    - phone
    -restaurant_ID

  4) - cuisine description
    (belongs_to :restaurant)
    -cuisine description
    -restaurant ID