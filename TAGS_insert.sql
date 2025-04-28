DROP TABLE if exists temp_tag;
CREATE TEMP TABLE temp_tag (
    tag VARCHAR(256) NOT NULL,          -- Unique identifier for a tag
    version VARCHAR(20) NOT NULL,      -- Taxonomy identifier or accession number
    custom BOOLEAN,           -- 1 if custom, 0 if standard
    abstract BOOLEAN,         -- 1 if not numeric, 0 otherwise
    datatype VARCHAR(20),              -- Data type for non-abstract tags
    iord CHAR(1),             -- "I" for point-in-time, "D" for duration
    crdr CHAR(1),                      -- "C" for credit, "D" for debit, NULL otherwise
    tlabel VARCHAR(512),               -- Label text for the tag
    doc TEXT                           -- Detailed definition of the tag
);

COPY temp_tag FROM 'C:\Users\dmitr\Downloads\2024q4-archive\tag.txt'
DELIMITER E'\t' CSV HEADER;

INSERT INTO public.tags (
tag, version, custom, abstract, datatype, iord, crdr, tlabel, doc
)
SELECT *
FROM temp_tag
ON CONFLICT (tag, version) DO NOTHING;


DROP TABLE if exists temp_tag;