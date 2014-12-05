NYC Restaurant Inspections
==========================

Analysis of results of NYC restaurant inspections, 2011-2014

##OVERVIEW

##OBJECTIVE

##DATA
###Raw Data

**Source:** The New York City Department of Health and Hygiene (DOHMH) publishes the results of restaurant inspections on [NYC Open Data](https://data.cityofnewyork.us/Health/DOHMH-New-York-City-Restaurant-Inspection-Results/xx67-kt59).  This dataset was downloaded on December 4, 2014 subject to the following filtering conditions:

*inspection date prior to January 1, 2014
*inspection type limited to cycle inspections

**Description:** x.x million records met the filtering conditions listed above.  Each record represents a single violation for which a restaurant was cited during an inspection.  In other words, if one restaurant inspection found three different violations, three separate records would be included in the dataset.  If no violations were found in the inpsection, the dataset would contain one record.

**Variables Names, Types and Values**

Name                  |Data Type |Description              |Values
----------------------|----------|---------------------------------------------------------------------------
CAMIS                 |Integer   |10-digit identifier      |
DBA                   |Text      |Business Name            |
BORO                  |Text      |Borough Name             |Bronx, Brooklyn, Manhattan, Queens, Staten Island
BUILDING              |Text      |Street Number            |
STREET                |Text      |Street Name              |
ZIPCODE               |Integer   |5-digit zip code         |
CUISINE               |Text      |Type of food sold        |7x categories represented in dataset
INSPECTION DATE       |Date      |Inspection date          |
ACTION                |Text      |Result of inspection     |"Violations were cited..." or "No violations..."
VIOLATION CODE        |Text      |Specific violation       |xx codes represented in dataset
VIOLATION DESCRIPTION |Text      |Name of violation        |
CRITICAL FLAG         |Text      |Nature of violation      |
SCORE                 |Integer   |Total score              |
GRADE                 |Text      |                         |
GRADE DATE            |Date      |                         |
RECORD DATE           |Date      |Date of database version |
INSPECTION TYPE       |Text      |                         |


###Processed Data

##EXPLORATORY ANALYSIS

##MODELING AND PREDICTION
