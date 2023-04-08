-- DROP TABLE IF EXISTS creation_relations;

CREATE TABLE IF NOT EXISTS creation_relations (
    origin_creation_id BIGINT NOT NULL,
    related_creation_id BIGINT NOT NULL,
    relation_type INTEGER NOT NULL, -- TODO: ENUM
    FOREIGN KEY (origin_creation_id) REFERENCES creations(id),
    FOREIGN KEY (related_creation_id) REFERENCES creations(id),
    CONSTRAINT PK_creation_relation_id PRIMARY KEY (origin_creation_id, related_creation_id)
);

INSERT INTO creation_relations (
    origin_creation_id,
    related_creation_id,
    relation_type
    ) VALUES (
        1,
        2,
        1
);

-- SELECT * FROM creation_relations;
