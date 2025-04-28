drop table if exists public.tags;
CREATE TABLE public.num (
    dateinsert TIMESTAMPTZ(6) NOT NULL DEFAULT now(), 
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