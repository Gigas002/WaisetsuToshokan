-- DROP TABLE IF EXISTS doujinshi;

CREATE TABLE IF NOT EXISTS doujinshi (
    id BIGSERIAL NOT NULL, -- PK
    creation_id BIGINT NOT NULL, -- FK
    title TEXT NOT NULL,
    alternative_titles TEXT ARRAY,
    release_date DATE,
    age_rating VARCHAR(5), -- TODO: ENUM
    available_at TEXT ARRAY,
    genres VARCHAR(64) ARRAY, -- TODO: ENUM?
    status VARCHAR(64), -- TODO: ENUM
    description TEXT,
    related_to TEXT ARRAY, -- of doujin, not manga
    languages VARCHAR(64) ARRAY, -- TODO: class
    censorship VARCHAR(64), -- TODO: ENUM
    picture TEXT,
    length INT,
    volumes INT,
    chapters INT,
    has_images BOOLEAN,
    is_colored BOOLEAN,
    CONSTRAINT FK_creation_id FOREIGN KEY (creation_id) REFERENCES creations(id),
    CONSTRAINT PK_doujinshi_id PRIMARY KEY (id)
);

INSERT INTO doujinshi (
    creation_id,
    title,
    release_date,
    age_rating,
    available_at,
    genres,
    status,
    description,
    related_to,
    languages,
    censorship,
    picture,
    length,
    volumes,
    chapters,
    has_images,
    is_colored
    ) VALUES (
        1,
        'VictiM GirLs',
        '2007-12-30',
        'R18',
        '{"https://duckduckgo.com/test_url1"}',
        '{"ahegao", "loli", "rape", "slave", "mind break"}',
        'published',
        'story about a true love',
        '{"ragnarok online:https://duckduckgo.com/test_url2"}',
        '{"official:japanese", "fan:russian", "fan:english"}',
        'tanks',
        'https://duckduckgo.com/test_url3',
        26,
        1,
        1,
        TRUE,
        FALSE
);

INSERT INTO doujinshi (
    creation_id,
    title,
    alternative_titles,
    release_date,
    age_rating,
    available_at,
    genres,
    status,
    description,
    related_to,
    languages,
    censorship,
    picture,
    length,
    volumes,
    chapters,
    has_images,
    is_colored
    ) VALUES (
        2,
        'Gareki 2',
        '{"Fatal Force", "Rising Force"}',
        '2007-09-28',
        'R18',
        '{"https://duckduckgo.com/test_url1"}',
        '{"ahegao", "bdsm", "rape", "slave", "elf"}',
        'published',
        'story about elf love',
        '{"rfonline:https://duckduckgo.com/test_url2"}',
        '{"official:japanese", "fan:russian", "fan:english"}',
        'tanks',
        'https://duckduckgo.com/test_url3',
        16,
        1,
        1,
        TRUE,
        FALSE
);

-- SELECT * FROM doujinshi;
