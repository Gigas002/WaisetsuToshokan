-- DROP TABLE IF EXISTS creations_characters;

CREATE TABLE IF NOT EXISTS creations_characters (
    creation_id BIGINT NOT NULL,
    character_id BIGINT NOT NULL,
    CONSTRAINT FK_creation_id FOREIGN KEY (creation_id) REFERENCES creations(id),
    CONSTRAINT FK_character_id FOREIGN KEY (character_id) REFERENCES characters(id),
    CONSTRAINT PK_creation_character_id PRIMARY KEY (creation_id, character_id)
);

INSERT INTO creations_characters (
    creation_id,
    character_id
    ) VALUES (
        1,
        1
);

-- SELECT * FROM creations_characters;
