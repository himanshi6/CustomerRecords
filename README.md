## Dependencies
- Swift 5

## How to run Project
- Launch the project and hit `⌘ + r`

## Test Cases
- To run all test cases, launch the project and hit `⌘ + U`

## CustomerRecords
XCode iOS project. What it contains:

- ViewController calls "CustomerManager" class which handles and calls all the functions to read file and get nearest customers.
- "CustomerFileIO" class handles read write operations
- "DistanceCalculator" class calculates distance between two points on earth (using haversine formula)
- "Customer" class is a model class for Customer data
- "output.txt" file with userid and names of cutomers within 100 KMs

It reads the customers.txt and uses the haversine formula to calculate the distance from the Dublin office co-ordinates and returns the list of customers that are within 100KM.
