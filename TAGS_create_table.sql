drop table if exists public.tags;
CREATE TABLE public.tags (
	dateinsert TIMESTAMPTZ(6) NOT NULL DEFAULT now(),    
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

ALTER TABLE public.tags ADD PRIMARY KEY (tag, version);