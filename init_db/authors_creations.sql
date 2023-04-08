-- DROP TABLE IF EXISTS authors_creations;

CREATE TABLE IF NOT EXISTS authors_creations (
    author_id BIGINT NOT NULL,
    creation_id BIGINT NOT NULL,
    CONSTRAINT FK_author_id FOREIGN KEY (author_id) REFERENCES authors(id),
    CONSTRAINT FK_creation_id FOREIGN KEY (creation_id) REFERENCES creations(id),
    CONSTRAINT PK_author_creation_id PRIMARY KEY (author_id, creation_id)
);

INSERT INTO authors_creations (
    author_id,
    creation_id
    ) VALUES (
        1,
        1
);

INSERT INTO authors_creations (
    author_id,
    creation_id
    ) VALUES (
        1,
        2
);

-- SELECT * FROM authors_creations;
