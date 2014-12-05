NYC Restaurant Inspections
==========================

Analysis of results of NYC restaurant inspections, 2011-2013

##OVERVIEW
Each restaurant in New York City is subject to at least one inspection by the NYC Department of Health and Hygiene (DOHMH). These inspections yield three different metrics to assess the level of a restaurant's compliance with health code requirement:

1. The *action* taken by DOHMH (not citing the restaurant for any violations, citing the restaurant for violations but allowing it to continue operation, or closing the restaurant until necessary corrective action has been taken).
2. A numeric *score* based on the quantity and severity of code violations.
3. A letter *grade* ("A" "B" or "C") based on the score.

This research evaluated factors associated with the results of these inspections.  Specifically, it evaluated the impact of *type of cuisine*, *geographic location*, and *prior inspection results* on the likelihood a restaurant received a negative inspection outcome.

##DATA
###Raw Data

**Source:** The New York City Department of Health and Hygiene (DOHMH) publishes the results of restaurant inspections on [NYC Open Data](https://data.cityofnewyork.us/Health/DOHMH-New-York-City-Restaurant-Inspection-Results/xx67-kt59).  This dataset was downloaded on December 4, 2014 subject to the following filtering condition:

* inspection type limited to cycle inspections

**Description:** 429,903 records met the filtering conditions listed above.  Each record represents a single violation for which a restaurant was cited during an inspection.  In other words, if one restaurant inspection found three different violations, three separate records would be included in the dataset.  If no violations were found in the inpsection, the dataset would contain one record.

**Variables Names, Types and Values:**

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

Three changes were made to clean the downloaded dataset:

1. The "BUILDING" and "STREET" variables were combined into an "ADDRESS" variable
2. The "RECORD DATE" variable was eliminated.  (It was the same value for each record.)
3. Certain values for text variables were shortened.

###Processed Data

**Phase I Analytic Datasets:**


##EXPLORATORY ANALYSIS

##MODELING AND PREDICTION
