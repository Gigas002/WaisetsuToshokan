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

## Tag search scheme and syntax (WIP)

Its deeply bound to tagging and database schemes, so im thinking about writing a standard for it while working on them. It should be easy to use for users, powerful and should not explode the database/server with long queries

**TODO:** research sadpanda and sankaku search strategies

**TODO:** keep in mind all `tag_categories`

```text
an::"Araki" // author_name
aan::"Jjba author" // author_alternative_name
g::"shounen" // genre
c::"manga" // category
cn::"Jojo no kimyou na bouken" // creation_name
can::"jjba" // creation_alternative_name
chn::"Kujou Jotarou" // character_name
chan::"Star platinum" // character_alternative_name
ca::"30" // character_age TODO: search operations on numbers, e.g. ca::">30"
o::"hat" // other, e.g. `clothes`, discussable
p::">30" // pages_count
```

example of combined search:

```text
g::"shounen" && c::"manga" && ca::"<30"
```

**TODO:** It's also a good idea to implement import/export macros schemes, so that regular searches would be fast to do. Plus, you can share your search macross with other people. But is there any point in saving them? Its just a string after all... Nah, that seems like a bad idea, but it's worth noting it as `discussable` in community

