NYC Restaurant Inspections
==========================

Analysis of results of NYC restaurant inspections, 2011-2014

##OVERVIEW

##OBJECTIVE

##DATA
###Raw Data

**Source:** The New York City Department of Health and Hygiene (DOHMH) publishes the results of restaurant inspections on [NYC Open Data](https://data.cityofnewyork.us/Health/DOHMH-New-York-City-Restaurant-Inspection-Results/xx67-kt59).  This dataset was downloaded on December 4, 2014 subject to the following filtering conditions:

* inspection date prior to January 1, 2014
* inspection type limited to cycle inspections

**Description:** 428,817 records met the filtering conditions listed above.  Each record represents a single violation for which a restaurant was cited during an inspection.  In other words, if one restaurant inspection found three different violations, three separate records would be included in the dataset.  If no violations were found in the inpsection, the dataset would contain one record.

**Variables Names, Types and Values**

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
INSPECTION DATE       |Date      |Inspection date            |
ACTION                |Text      |Result of inspection       |"Violations were cited..." "No violations..." "Establishment closed..." "Establishment re-closed"
VIOLATION CODE        |Text      |Specific violation         |73 unqiue codes (or blank)
VIOLATION DESCRIPTION |Text      |Name of violation          |83 unique descriptions (or blank)
CRITICAL FLAG         |Text      |Nature of violation        |"Critical" "Not Critical" "Not Applicable"
SCORE                 |Integer   |Total score for inspection |-1 to 156
GRADE                 |Text      |                           |"A" "B" "C" "Z" "Not Yet Graded" (or blank)
GRADE DATE            |Date      |                           |
RECORD DATE           |Date      |Date of database version   |12/03/2014
INSPECTION TYPE       |Text      |Type of cycle inspection   |"Initial Inspection" or "Re-inspection"


###Processed Data

##EXPLORATORY ANALYSIS

##MODELING AND PREDICTION
