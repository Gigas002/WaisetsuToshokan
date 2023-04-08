-- DROP TABLE IF EXISTS circles;

CREATE TABLE IF NOT EXISTS circles (
    id BIGSERIAL NOT NULL,
    title TEXT,
    alternative_titles TEXT,
    CONSTRAINT PK_circle_id PRIMARY KEY (id)
);

INSERT INTO circles (
    title,
    alternative_titles
    ) VALUES (
        'fatalpulse',
        'taras;panis'
);

-- SELECT * FROM circles;
