DROP TABLE if exists temp_sub;
CREATE TEMP TABLE temp_sub (
    adsh VARCHAR(20),
    cik NUMERIC(10, 0),
    name VARCHAR(150),
    sic NUMERIC(4, 0),
    countryba CHAR(2),
    stprba CHAR(2),
    cityba VARCHAR(30),
    zipba VARCHAR(10),
    bas1 VARCHAR(40),
    bas2 VARCHAR(40),
    baph VARCHAR(20),
    countryma CHAR(2),
    stprma CHAR(2),
    cityma VARCHAR(30),
    zipma VARCHAR(10),
    mas1 VARCHAR(40),
    mas2 VARCHAR(40),
    countryinc CHAR(3),
    stprinc CHAR(2),
    ein NUMERIC(10, 0),
    former VARCHAR(150),
    changed CHAR(8),
    afs CHAR(5),
    wksi BOOLEAN,
    fye CHAR(4),
    form VARCHAR(10),
    period DATE,
    fy NUMERIC(4, 0),
    fp CHAR(2),
    filed DATE,
    accepted TIMESTAMP,
    prevrpt BOOLEAN,
    detail BOOLEAN,
    instance VARCHAR(40),
    nciks NUMERIC(4, 0),
    aciks VARCHAR(120)
);

COPY temp_sub FROM 'C:\Users\dmitr\Downloads\2024q4-archive\sub.txt'
DELIMITER E'\t' CSV HEADER;

INSERT INTO public.sub (
    adsh, cik, name, sic, countryba, stprba, cityba, zipba, bas1, bas2, baph,
    countryma, stprma, cityma, zipma, mas1, mas2, countryinc, stprinc, ein, former,
    changed, afs, wksi, fye, form, period, fy, fp, filed, accepted, prevrpt, detail,
    instance, nciks, aciks
)
SELECT *
FROM temp_sub
ON CONFLICT (adsh) DO NOTHING;


DROP TABLE if exists temp_sub;