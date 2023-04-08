-- DROP TABLE IF EXISTS authors;

CREATE TABLE IF NOT EXISTS authors (
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
    author_name VARCHAR(256) NOT NULL,
    alternative_author_names TEXT,
    external_links TEXT, -- TODO: class
    CONSTRAINT PK_author_id PRIMARY KEY (id)
);

INSERT INTO authors (
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
    author_name,
    alternative_author_names,
    external_links
    ) VALUES (
        'tfn',
        'tln',
        'tln tfn',
        'alt_name1;alt_name2',
        'human',
        'details',
        'descr',
        'unknown',
        '1900-12-31',
        100,
        'https://cdn.myanimelist.net/images/voiceactors/2/72007.jpg',
        '朝凪',
        'asanagi;fatalpulse',
        'pixiv:https://www.pixiv.net/users/355065;twitter:https://twitter.com/Victim_Girls'
);

-- SELECT * FROM authors;
