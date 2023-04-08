-- DROP TABLE IF EXISTS characters;

CREATE TABLE IF NOT EXISTS characters (
    id BIGSERIAL NOT NULL,
    first_name VARCHAR(64),
    last_name VARCHAR(64),
    full_name VARCHAR(128),
    alternative_names TEXT,
    species VARCHAR(128),
    additional_details TEXT,
    description TEXT,
    gender VARCHAR(10),
    birthday DATE,
    age INT,
    picture TEXT, -- TODO: class
    is_cosplay BOOLEAN,
    genitails TEXT, -- TODO: enum
    CONSTRAINT PK_character_id PRIMARY KEY (id)
);

INSERT INTO characters (
    first_name,
    last_name,
    full_name,
    alternative_names,
    species,
    additional_details,
    description,
    gender,
    birthday,
    age,
    picture,
    is_cosplay,
    genitails
    ) VALUES (
        'fname',
        'lname',
        'fullname',
        'aname1;aname2',
        'elf',
        'details',
        'desc',
        'female',
        '1999-12-31',
        10,
        'https://cdn.myanimelist.net/images/voiceactors/2/72007.jpg',
        FALSE,
        'pizzdah'
);

INSERT INTO characters (
    first_name,
    last_name,
    full_name,
    alternative_names,
    species,
    additional_details,
    description,
    gender,
    birthday,
    age,
    picture,
    is_cosplay,
    genitails
    ) VALUES (
        'fname2',
        'lname2',
        'fullname2',
        'aname1;aname2',
        'human',
        'details2',
        'desc2',
        'female',
        '1999-12-31',
        11,
        'https://cdn.myanimelist.net/images/voiceactors/2/72007.jpg',
        FALSE,
        'pizzdah'
);

-- SELECT * FROM characters;
