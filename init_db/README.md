# blah-blah-blah

Tables and links:

// TODO: upgrade to tags system

authors == circles -> authors_circles -> creations -> authors_creations -> (creation_relations) -> doujinshi -> characters -> creations_characters == (character_relations)

Partially done:

```text
+ authors
+ circles
+ authors_circles
+ creations
+ authors_creations
+ creation_relations
+ doujinshi
+ characters
+ creations_characters
+ character_relations
```

Not yet done:

**Postgres seems not to work with arrays-of-FKs, so we need to shit out tons of tables for tags**

```text
- authors_tags
- creations_tags
- characters_tags
- tags
- tags_relations
```

Questionable:

```text
? circles_tags
? circles_creations
? tags_categories
? collections // creations_collections // collection IS creation, so is this useless?
```

Future:

```text
? events
? creations_events
```
