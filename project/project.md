

# Reference file : input.txt

<pre>
# Report Generated: 2025-03-13
Design: {ALU_32} \ Version: 1.2
 
{ Process: 7nm  /  Voltage: 0.9V  \  Temperature: 125C }
--------------------------------------------------------
Cell   |  Type   |  Power (mW)  |  Delay (ns)
--------------------------------------------------------
U1     |  NAND2  |  0.85   |  0.12  
U2     |  INV    |  0.45   |  0.08  
U3     |  NOR2   |  0.72   |  0.11  
U4     |  INV    |  0.50   |  0.09  
--------------------------------------------------------
 
{ Process: 7nm  /  Voltage: 1.0V  \  Temperature: 100C }
--------------------------------------------------------
Cell   |  Type   |  Power (mW)  |  Delay (ns)
--------------------------------------------------------
U1     |  NAND2  |  0.88   |  0.11  
U2     |  INV    |  0.47   |  0.07  
U3     |  NOR2   |  0.75   |  0.10  
U4     |  INV    |  0.52   |  0.08  
--------------------------------------------------------
 
{ Process: 5nm  /  Voltage: 0.8V  \  Temperature: 125C }
--------------------------------------------------------
Cell   |  Type   |  Power (mW)  |  Delay (ns)
--------------------------------------------------------
U1     |  NAND2  |  0.80   |  0.13  
U2     |  INV    |  0.40   |  0.09  
U3     |  NOR2   |  0.70   |  0.12  
U4     |  INV    |  0.48   |  0.10  
--------------------------------------------------------
\End of report\
</pre>

# Objectives

## Read and Parse the File
 -  Extract PVT Conditions (Process, Voltage, Temperature)
 -  Extract Cell-wise Data for each PVT table
## Store Data Efficiently using Hashes
 -  Data will be stored in a nested hash structure like: 

<pre perl>
   $data{Process}{Voltage}{Temperature}{Cell} = { 
   $data{'7nm'}{'0.9V'}{'125C'}{U2} = { 
   		'Type' => "INV",
		'Power' => 0.45,
		'Delay' => 0.08
		};
</pre>

## Query the Delay of a Specific Cell for a Given PVT Condition
 - The program should allow users to enter a Process, Voltage, Temperature, and Cell name at runtime to retrieve its delay value.

## Perform Additional Processing & Reporting
 -  Compute Total Power Consumption & Average Delay for each PVT table
 -  Sort & Rearrange rows
 -  Generate a structured summary report
 

# Exercises Distribution

## Session 1

## Session 2
✅ Pattern Recognition – Identifying & extracting PVT-specific data  
✅ Sorting & Data Processing – Dynamic sorting & querying


## Session 3
✅ File Handling & Parsing – Handling multiple tables in a single file  
✅ User Input Handling – Interactive CLI with real-time querying

<pre>
- Implement a program that runs like following
    Enter Process Node (e.g., 7nm, 5nm): 7nm  
    Enter Voltage (e.g., 0.9V, 1.0V): 0.9V  
    Enter Temperature (e.g., 125C, 100C): 125C  
    Enter Cell Name (e.g., U1, U2, U3): U3  

    Result:  
    Delay for Cell U3 at 7nm / 0.9V / 125C = 0.11 ns  
</pre>

## Session 4
✅ Regular Expressions – Extracting complex patterns

## Session 5
✅ Hash Data Structure – Efficient storage & retrieval  
✅ Mathematical Calculations – Computing total power & average delay

Cover HoH
Write a program that arranges data content retrieved in following format
<pre>
    %data = (
    "7nm" => {
        "0.9V" => {
            "125C" => {
                "U1" => { Type => "NAND2", Power => 0.85, Delay => 0.12 },
                "U2" => { Type => "INV", Power => 0.45, Delay => 0.08 },
                "U3" => { Type => "NOR2", Power => 0.72, Delay => 0.11 },
                "U4" => { Type => "INV", Power => 0.50, Delay => 0.09 }
            }
        }
    }
    );
</pre>

    - Raw Contents
        - Capture file contents line in array
        - Dump the array
    - Extract Design Summary (Name / version)
    - Extract Process Lines
        - Use Match to extract process lines
    - Extract Cell Lines
        - Think of ways to identify Cell Lines



## Session 6

<pre>
Write a script that will generate a CSV file (processed_report.csv) containing:
        Process, Voltage, Temperature, Cell, Type, Power (mW), Delay (ns)  
        7nm, 0.9V, 125C, U1, NAND2, 0.85, 0.12  
        7nm, 0.9V, 125C, U2, INV, 0.45, 0.08  
        7nm, 0.9V, 125C, U3, NOR2, 0.72, 0.11  
</pre>


# Submission requirements

•	Perl Script (pvt_report_parser.pl)  
•	Sample Input File (pvt_input_report.txt)  
•	Generated Report (pvt_processed_report.txt) - csv format  
•	README.md (Describing approach, challenges, execution steps)  


## Across Sessions
1. Read File Contents
2. Filter Out following
  a. Special Characters : {}
  b. Leading and trailing Spaces
3. Accept following params either through command line param or interactively  
  a. Process, Voltage, Temperature, and Cell name  
  b. Extract corresponding row from the input file 
3. Arrange Section cells  
  a. Display in alphabetical order  
  b. Display in increasing level of power consumption
4. Perform Calculations  
  a. Compute total power consumption??   
  b. Compute Average Delay


# Summary of Complexity Enhancements
✔ Multiple Tables for Different PVT Combinations  
✔ Hash-Based Storage for Efficient Queries  
✔ User-Interactive Query System (CLI-Based)  
✔ Regular Expressions for Complex Parsing  
✔ Sorting & Rearranging Data  
✔ Mathematical Computations (Power & Delay Analysis)  

