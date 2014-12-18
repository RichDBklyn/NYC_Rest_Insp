NYC Restaurant Inspections, 2011-2013
=====================================

##OVERVIEW
Each restaurant in New York City is subject to at least one inspection by the NYC Department of Health and Hygiene (DOHMH). These inspections yield three different metrics to assess the level of a restaurant's compliance with health code requirement:

1. The *action* taken by DOHMH (not citing the restaurant for any violations, citing the restaurant for violations but allowing it to continue operation, or closing the restaurant until necessary corrective action has been taken).
2. A numeric *score* based on the quantity and severity of code violations.
3. A letter *grade* ("A" "B" or "C") based on the score.

This objectives of this research are both descriptive and predictive.  **Descriptive analyses** address how restaurant inspection results have varied based on three factors: *year*, *type of cuisine*, and *geographic location*.  **Predictive analyses** develop algorithms for determining the likelihood of future inspection results given tehse three factors as well as a restaurant's *prior inspection results*.

##DATA
###Raw Data

**Source:** DOHMH updates and publishes the results of its restaurant inspections on [NYC Open Data](https://data.cityofnewyork.us/Health/DOHMH-New-York-City-Restaurant-Inspection-Results/xx67-kt59) on a regular (typically daily) basis.  It is important to note that these data do **not** represent the full universe of inspections DOHMH has conducted over a specific time period.  Instead, it contains inspection results only for restaurants *in active status* on the day the datafile was created: no information is provided for inspections conducted at restaurants that have gone out of business.  In addition, the dataset only contains results for inspections that have occurred *within three years of the most recent inspection*: if restaurants A and B both had an inspection on 11/30/2011 and restaurant A's most recent inspection is 11/29/2014 and restuarant B's is 12/1/2014, the dataset will contain the 11/30/2011 inspection results for restaurant A but not for restaurant B.  [A more detailed description of the dataset](https://github.com/RichDBklyn/NYC_Rest_Insp/blob/master/B.%20Data/1.%20Raw%20Data/About_NYC_Restaurant_Inspection_Data_on_NYC_OpenData_082014.docx) and a [data dictionary](www) are available.  ***ADD LINKS*** 

**Download:** A master datafile was created on December 4, 2014 by downloading all restaurant inspection records avaialble on the NYC Open Data site on December 4, 2014, subject to the following filtering condition:

* inspection type limited to cycle inspections

**Master Dataset Description:** The 429,093 records meeting the filtering condition listed above represent the master dataset.  Data are organized at the *violation level*: each record represents a single violation for which a restaurant was cited during an inspection.  (In other words, if one restaurant inspection found three different violations, three separate records would be included in the dataset.)  When no violations were found in the inspection, the dataset contains one record indicating teh absence of violations.

***Variables Names, Types and Values:***

Name                  |Data Type |Description                |Values
----------------------|----------|---------------------------|-------------------------------------------------
CAMIS                 |Integer   |8-digit identifier         |
DBA                   |Text      |Business name              |
BORO                  |Text      |Borough name               |"Bronx" "Brooklyn" "Manhattan" "Queens" "Staten Island" (plus "missing"
BUILDING              |Text      |Street number              |
STREET                |Text      |Street name                |
ZIPCODE               |Integer   |5-digit zip code           |
PHONE                 |Integer   |10-digit phone number      |
CUISINE DESCRIPTION   |Text      |Type of food sold          |82 unique cuisines (plus "Not Listed/Not Applicable")
INSPECTION DATE       |Date      |Date of inspection         |
ACTION                |Text      |Result of inspection       |"Violations were cited..." "No violations..." "Establishment closed..." "Establishment re-closed"
VIOLATION CODE        |Text      |Specific violation         |73 unqiue codes (or blank)
VIOLATION DESCRIPTION |Text      |Name of violation          |83 unique descriptions (or blank)
CRITICAL FLAG         |Text      |Nature of violation        |"Critical" "Not Critical" "Not Applicable"
SCORE                 |Integer   |Total score for inspection |-1 to 156
GRADE                 |Text      |Grade to be posted         |"A" "B" "C" "Z" "Not Yet Graded" (or blank)
GRADE DATE            |Date      |Date grade issued          |
RECORD DATE           |Date      |Date of database version   |12/04/2014
INSPECTION TYPE       |Text      |Type of cycle inspection   |"Initial Inspection" or "Re-inspection"

Four changes were made to the downloaded file to create a clean master dataset:

1. The "BUILDING" and "STREET" variables were combined into an "ADDRESS" variable
2. The "RECORD DATE" variable was eliminated.  (It was the same value for each record.)
3. The following discrete values in the "CUISINE DESCRIPTION" variable were collapsed:
    * "Cajun", "Creole" and "Creole/Cajun" were combined as "Creole/Cajun"
    * "Hotdogs" and "Hotdogs/Pretzels" were combined as "Hotdogs/Pretzels"
    * "Pizza" and "Pizza/Italian" were combined as "Pizza"
    * "Salads", "Sandwiches", "Sandwiches/Salads", "Soups" and "Soups & Sandwiches" were combined as "Soups/Sandwiches/Salads"
4. Certain values for text variables were shortened.
***ADD LINK TO MASTER DATA SET***

###Processed Data

The master dataset was processed to create three datasets used in descriptive analysis:

1. [**Violation Data File**](www) ***ADD LINK***
   * adds a unique identification number for each inspection included in the master dataset
   * uses that inspection ID number and the violation code as the primary key
   * adds a variable classifying each violation into one of five "TYPE"s
   * drops variables not needed for analysis ("DBA" "ADDRESS" "VIOLATION DESCRIPTION" "GRADE DATE" and "INSPECTION TYPE"
2. [**Inspection Data File**](www) ***ADD LINK***
   * drops information on the specific violations cited in each inspection
   * adds summary statistics for the number of violations cited (by "TYPE" and "CRITICAL FLAG")
3. **Restaurant Data File**


##EXPLORATORY ANALYSIS

##MODELING AND PREDICTION
