DROP TABLE if exists temp_pre;
CREATE TEMP TABLE temp_pre (
   adsh VARCHAR(20) NOT NULL,          -- Accession Number
    report NUMERIC(6, 0) NOT NULL,      -- Report grouping, corresponding to the statement type
    line NUMERIC(6, 0) NOT NULL,        -- Presentation line order for the report
    stmt CHAR(2) ,              -- Financial statement location (e.g., BS, IS)
    inpth BOOLEAN ,             -- Value presented parenthetically (1 = true, 0 = false)
    rfile CHAR(1) ,             -- Type of interactive data file (e.g., H or X)
    tag VARCHAR(256) ,          -- Tag chosen by the filer for the line item
    version VARCHAR(20) ,       -- Taxonomy identifier or accession number
    plabel VARCHAR(512) ,       -- Preferred label text for the line item
    negating BOOLEAN          -- Flag for negating preferred label (1 = true, 0 = false),
);

COPY temp_pre FROM 'C:\Users\dmitr\Downloads\2024q4\pre.txt'
DELIMITER E'\t' CSV HEADER;

INSERT INTO public.pre (
adsh, report, line, stmt, inpth, rfile, tag, version, plabel, negating
)
SELECT *
FROM temp_pre
ON CONFLICT (adsh, report, line) DO NOTHING;


DROP TABLE if exists temp_pre;