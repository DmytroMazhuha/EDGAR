drop table if exists public.pre;
CREATE TABLE public.pre (
    dateinsert TIMESTAMPTZ(6) NOT NULL DEFAULT now(), 
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