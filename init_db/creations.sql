-- DROP TABLE IF EXISTS creations;

CREATE TABLE IF NOT EXISTS creations (
    id BIGSERIAL NOT NULL,
    creation_type TEXT NOT NULL, -- TODO: ENUM
    CONSTRAINT PK_creation_id PRIMARY KEY (id)
);

INSERT INTO creations (
    creation_type
    ) VALUES (
        'doujinshi'
);

INSERT INTO creations (
    creation_type
    ) VALUES (
        'doujinshi'
);

-- SELECT * FROM creations;
