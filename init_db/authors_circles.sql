-- DROP TABLE IF EXISTS authors_circles;

CREATE TABLE IF NOT EXISTS authors_circles (
    author_id BIGINT NOT NULL,
    circle_id BIGINT NOT NULL,
    CONSTRAINT FK_author_id FOREIGN KEY (author_id) REFERENCES authors(id),
    CONSTRAINT FK_circle_id FOREIGN KEY (circle_id) REFERENCES circles(id),
    CONSTRAINT PK_author_circle_id PRIMARY KEY (author_id, circle_id)
);

INSERT INTO authors_circles (
    author_id,
    circle_id
    ) VALUES (
        1,
        1
);

-- SELECT * FROM authors_circles;
