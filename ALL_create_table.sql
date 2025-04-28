drop table if exists edgar.num;
CREATE TABLE edgar.num (
    dateinsert TIMESTAMP(6) NOT NULL DEFAULT now(), 
	adsh VARCHAR(20) NOT NULL,          -- Accession Number
    tag VARCHAR(256) NOT NULL,          -- Unique identifier for a tag
    version VARCHAR(20) NOT NULL,       -- Identifier for taxonomy or accession number
    ddate DATE NOT NULL,                -- End date for the data value
    qtrs NUMERIC(8, 0) NOT NULL,        -- Count of quarters, rounded to whole numbers
    uom VARCHAR(20) NOT NULL,           -- Unit of measure
    segments VARCHAR(1024),             -- Tags for axis and member reporting
    coreg VARCHAR(256),                 -- Specific co-registrant or NULL for consolidated entity
    value NUMERIC(28,4),                -- Numeric value, limited to 4 decimal places
    footnote VARCHAR(512),              -- Superscripted footnotes or blank if none
    PRIMARY KEY (adsh, tag, version, ddate, qtrs, uom) -- Composite primary key
);

drop table if exists public.pre;
CREATE TABLE public.pre (
    dateinsert TIMESTAMP(6) NOT NULL DEFAULT now(), 
	adsh VARCHAR(20) NOT NULL,          -- Accession Number
    report NUMERIC(6, 0) NOT NULL,      -- Report grouping, corresponding to the statement type
    line NUMERIC(6, 0) NOT NULL,        -- Presentation line order for the report
    stmt CHAR(2) ,              -- Financial statement location (e.g., BS, IS)
    inpth BOOLEAN ,             -- Value presented parenthetically (1 = true, 0 = false)
    rfile CHAR(1) ,             -- Type of interactive data file (e.g., H or X)
    tag VARCHAR(256) ,          -- Tag chosen by the filer for the line item
    version VARCHAR(20) ,       -- Taxonomy identifier or accession number
    plabel VARCHAR(512) ,       -- Preferred label text for the line item
    negating BOOLEAN ,          -- Flag for negating preferred label (1 = true, 0 = false),
    PRIMARY KEY (adsh, report, line)    -- Composite primary key for uniqueness
);

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

drop table if exists edgar.tags;
CREATE TABLE edgar.tags (
	dateinsert TIMESTAMP(6) NOT NULL DEFAULT now(),    
	tag VARCHAR(256) NOT NULL,          -- Unique identifier for a tag
    version VARCHAR(20) NOT NULL,      -- Taxonomy identifier or accession number
    custom BOOLEAN,           -- 1 if custom, 0 if standard
    abstract BOOLEAN,         -- 1 if not numeric, 0 otherwise
    datatype VARCHAR(20),              -- Data type for non-abstract tags
    iord CHAR(1),             -- "I" for point-in-time, "D" for duration
    crdr CHAR(1),                      -- "C" for credit, "D" for debit, NULL otherwise
    tlabel VARCHAR(512),               -- Label text for the tag
    doc TEXT,                           -- Detailed definition of the tag
	PRIMARY KEY (tag, version) -- Accession Number as the primary key
);