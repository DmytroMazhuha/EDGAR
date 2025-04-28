DROP TABLE IF EXISTS edgar.sub;
CREATE TABLE edgar.sub (
    dateinsert TIMESTAMP(6) NOT NULL DEFAULT now(),
    adsh VARCHAR(20) not NULL, -- Accession Number, 20-character alphanumeric
    cik NUMERIC(10, 0) , -- Central Index Key (CIK)
    name VARCHAR(150) , -- Name of registrant
    sic NUMERIC(4, 0), -- Standard Industrial Classification (SIC)
    countryba CHAR(2), -- Country of registrant's business address
    stprba CHAR(2), -- State/province of business address (if countryba is US or CA)
    cityba VARCHAR(30), -- City of registrant's business address
    zipba VARCHAR(10), -- Zip code of business address
    bas1 VARCHAR(40), -- First line of street in business address
    bas2 VARCHAR(40), -- Second line of street in business address
    baph VARCHAR(20), -- Phone number of business address
    countryma CHAR(2), -- Country of mailing address
    stprma CHAR(2), -- State/province of mailing address (if countryma is US or CA)
    cityma VARCHAR(30), -- City of registrant's mailing address
    zipma VARCHAR(10), -- Zip code of mailing address
    mas1 VARCHAR(40), -- First line of street in mailing address
    mas2 VARCHAR(40), -- Second line of street in mailing address
    countryinc CHAR(3), -- Country of incorporation
    stprinc CHAR(2), -- State/province of incorporation (if countryinc is US or CA)
    ein NUMERIC(10, 0), -- Employee Identification Number (EIN)
    former VARCHAR(150), -- Most recent former name of registrant
    changed CHAR(8), -- Date of change from the former name
    afs CHAR(5), -- Filer status
    wksi BOOLEAN , -- Well-Known Seasoned Issuer (WKSI)
    fye CHAR(4), -- Fiscal Year End Date (rounded to nearest month-end)
    form VARCHAR(10) , -- Submission type of registrant's filing
    period DATE , -- Balance Sheet Date (rounded to nearest month-end)
    fy NUMERIC(4, 0), -- Fiscal Year Focus
    fp CHAR(2), -- Fiscal Period Focus (e.g., FY, Q1, Q2, etc.)
    filed DATE , -- Filing date
    accepted TIMESTAMP , -- Acceptance date/time of filing
    prevrpt BOOLEAN , -- Indicates if submission was subsequently amended
    detail BOOLEAN , -- Indicates if XBRL submission contains quantitative disclosures
    instance VARCHAR(40) , -- Name of submitted XBRL Instance Document
    nciks NUMERIC(4, 0) , -- Number of Central Index Keys (CIK)
    aciks VARCHAR(120), -- Additional CIKs (space-delimited)
    PRIMARY KEY (adsh) -- Accession Number as the primary key
);
