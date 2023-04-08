-- DROP TABLE IF EXISTS character_relations;

CREATE TABLE IF NOT EXISTS character_relations (
    origin_character_id BIGINT NOT NULL,
    related_character_id BIGINT NOT NULL,
    relation_type INTEGER NOT NULL, -- TODO: ENUM
    FOREIGN KEY (origin_character_id) REFERENCES characters(id),
    FOREIGN KEY (related_character_id) REFERENCES characters(id),
    CONSTRAINT PK_character_relation_id PRIMARY KEY (origin_character_id, related_character_id)
);

INSERT INTO character_relations (
    origin_character_id,
    related_character_id,
    relation_type
    ) VALUES (
        1,
        2,
        1
);

-- SELECT * FROM character_relations;
