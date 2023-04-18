# blah-blah-blah


## Tables listing

These do **not** include upcoming features, like `events` yet

**Obsolete**, need update for below stuff, table initialization order: authors == circles -> authors_circles -> creations -> authors_creations -> (creation_relations) -> doujinshi -> characters -> creations_characters == (character_relations)


### Main tables

**Listing:**

circles:
- id
- ~~title~~ table: circles_titles
- ~~alternative_titles~~ table: circles_titles
- table: authors_circles
- table: creations_circles


creations:
- id
- ~~title~~ table: creations_titles
- ~~alternative_titles~~ table: creations_titles
- ~~authors (author+role)~~ table: authors_creations
- publish_started
- publish_ended
- external_links (json)
- description (json)
- ~~events~~ WIP, probably creations_events
- ~~collections~~ WIP
- ~~characters (character+relation)~~ table: creations_characters
- picture **TODO** pictures
- ~~languages~~ creations_languages
- rating
- ~~genres~~ obsoleted by tags
- publish_status
- censorship
- ~~tags~~ table: creations_tags
- ~~adaptations~~ table: obsoleted by tags


doujinshi:
- creation_id
- id
- length
- volumes
- chapters
- ~~has_images~~ `true` by default for doujin, inherited from `book`
- is_colored (**TODO**: colored fan/official with `ColorInfo`?)


authors:
- creature_id
- id
- ~~first_name~~ table: authors_real_names
- ~~last_name~~ table: authors_real_names
- ~~full_name~~ table: authors_real_names
- ~~alternative_names~~ table: authors_real_names
- ~~additional_details~~ obsolete: write everything as description
- description (json)
- birthday
- age
- picture **TODO**: pictures
- ~~species~~ always human
- gender
- ~~tags~~ table: authors_tags
- ~~author_name~~ table: authors_artist_names
- ~~alternative_author_names~~ table: authors_artist_names
- ~~circles~~ table: authors_circles
- external_links (json)
- ~~creations~~ (creation+role) table: authors_creations
- ~~relations~~ (author + realtion) obsolete
- ~~genitals~~ obsolete


characters:
- creature_id
- id
- ~~first_name~~ table: characters_names
- ~~last_name~~ table: characters_names
- ~~full_name~~ table: characters_names
- ~~alternative_names~~ table: characters_names
- ~~additional_details~~ obsolete
- description (json)
- birthday
- age
- picture **TODO**: pictures
- species **TODO**: I don't remember if I handle this
- gender
- ~~tags~~ table: characters_tags
- ~~relations~~ (chara + relation) table: characters_relations
- genitals
- ~~featured_in~~ (creation + relation) table: creations_characters


tags:
- id
- category (string, but enum in code)
- value
- description (json)
- ~~additional_info~~ obsolete


**Relational:**

Naming priority: authors > creations > chars > circles > tags

*Uses `-info` class*
circles_titles
- circle_id
- title
- language


creations_circles
- creation_id
- circle_id


*Uses `-info` class*
authors_real_names
- author_id
- name
- language


authors_tags
- author_id
- tag_id


*Uses `-info` class*
authors_artist_names
- author_id
- name
- language


authors_circles
- author_id
- circle_id


authors_creations
- author_id
- creation_id
- author_role


*Uses `-info` class*
creations_titles
- creation_id
- title
- language


creations_characters
- creation_id
- character_id
- character_role


*Uses `LanguageInfo` class*
creations_languages
- creation_id
- language
- is_official


creations_tags
- creation_id
- tag_id


*Uses `-info` class*
characters_names
- character_id
- name
- language


characters_tags
- character_id
- tag_id


**TODO**: is this the best way possible to show relations between chara?

characters_realtions
- origin_character_id
- relative_character_id
- relation


tags_relations
- master_id
- slave_id


**TODO**: can rework `ICreature` child like so:


creatures:
- id
- ~~first_name~~ table: creatures_names
- ~~last_name~~ table: creatures_names
- ~~full_name~~ table: creatures_names
- ~~alternative_names~~ table: creatures_names
- ~~additional_details~~ obsolete
- description (json)
- birthday
- age
- picture **TODO**: pictures
- species **TODO**: I don't remember if I handle this
- gender
- ~~tags~~ table: creatures_tags
- ~~creature_relations~~ table: creatures_relations
- genitals


author:
- creature_id
- id
- ~~author_name~~ table: authors_names
- ~~alternative_author_names~~ table: authors_names
- ~~circles~~ table: authors_circles
- external_links (json)
- ~~creations~~ table: authors_creations


character:
- creature_id
- id
- ~~featured_in~~ table: creations_characters


*Uses `-info` class*
creatures_names
- creature_id
- name
- language


creatures_tags
- creature_id
- tag_id


creatures_realtions (*for both author and character*)
- origin_creature_id
- relative_creature_id
- relation


*Uses `-info` class*
authors_names
- author_id
- name
- language


authors_circles
- author_id
- circle_id


authors_creations
- author_id
- creation_id
- author_role


## Tag search scheme and syntax (WIP)

Its deeply bound to tagging and database schemes, so im thinking about writing a standard for it while working on them. It should be easy to use for users, powerful and should not explode the database/server with long queries

**TODO:** research sadpanda and sankaku search strategies

**TODO:** keep in mind all `tag_categories`

**Still incomplete list of possible tag commands. But it's okay, it's too soon to make predictions about it for now**

```c
n::"Araki" // author_name
an::"Jjba author" // author_alternative_name/alternative_name
ar::"main_artist" // author_role
g::"shounen" // genre
c::"manga" // category
t::"Jojo no kimyou na bouken" // creation_name/title
at::"jjba" // creation_alternative_name/alternative_title
cn::"Kujou Jotarou" // character_name
acn::"Star platinum" // character_alternative_name/alternative_character_name
a::"<30" // character_age/age
o::"hat" // other, e.g. `clothes`
p::">30" // pages_count
```

The search syntax would look something like this:

`%command%::%value%`, where `::` is a delimeter

(By default, search without specified command will preform a search over `title` and `alternative_titles`)

Example of combined search with exclude tag feature:

Find all shounen manga or anime with characters aged lesser than 30yo, that were created by
everyone except "name" artist:

```c
g::"shounen" && (c::"manga" || c::"anime") a::"<30" && -n::"name"
```

Upd 1: There's no point in separating search by name/alternative names, since user most probably doesn't know what he's looking for, so it should be deprecated

Upd 2: deprecate `&&` (`AND`). It should be a default search option. The `||` for `OR` must stay though

**TODO:** work harder on `except` syntax. It's especially essential when talking about tag hierarchy. E.g., how would you write "I want to see `manga` by `name` where he is **not** `secondary_author`"

Is it: `c::"manga" && -n::"name"=>ar::"secondary_author"`? Not clear for user, I think

**TODO:** It's also a good idea to implement import/export macros schemes, so that regular searches would be fast to do. Plus, you can share your search macross with other people. But is there any point in saving them? Its just a string after all... Nah, that seems like a bad idea, but it's worth noting it as `discussable` in community


**Example of excluding search**


Search for all `fantasy_creature`s except `goblin`s:

```sql
fc_id = SELECT tag_id FROM tags WHERE tag_category = 'species' AND tag_value = 'fantasy_creature'
gob_id = SELECT tag_id FROM tags WHERE tag_category = 'species' AND tag_value = 'goblin'
SELECT * FROM tags_relations WHERE master_tag_id = fc_id AND slave_tag_id != gob_id
```

### Search hierarchy

User should be able to access table fields for search. This is NOT related to tag hierarchy e.g. user wants to find artist named `Asanagi`:

```
search: Asanagi
full syntax: author_name::'Asanagi'
```

Pretty simple, right? But what if user wants to find works, where `Asanagi` is a secondary artist?
It means, user wants to enumerate through all `ICreation`s, where `Artists` collection returns
`Asanagi` with `secondary_artist` value:

```
search: author_name::'Asanagi'=>author_role='secondary_artist'
```

This is different from tag hierarchy from up above thread, because tags have inner, code-prescribed behavior and you don't need to access their fields directly

Tags should be able to inherit from object where they exist, e.g.

Search for `female` `slime` tagged galleries:

```
search: character_gender::'female'=>tag::'species'::'slime'
```

Search for all galleries, tagged with `slime`:

```
search: tag::'species'::'slime'
```



## Db request pool

Add/fix request pool should not affect actual dbs until it's pushed by mods/admins, so we need to think about threshold database or tables and manage their cleanup/migrations

Probably the best option is to have a threshold database and clean it once per week or so, migrating yet unmerged entries into new threshold


## Tag hierarchy/binding (on species example)

Discussable. If implemented, then only for main tags, like name, etc. For example, if we want to find all the works, where `author` is `main_author`, how would we do it?

e.g.

```c
n::"author"=>ar::"main_artist"
```

or separate expression inside parenthesis:

```c
(n::"author" && ar::"main_artist")
```

Anyway, it should take no effect if there's no binding, no error must be thrown

**Species thoughts and example**

Since there's millions of different species, we should either divide them by main category
e.g. `Animal`, `Human`, `Insect`, etc
either handle them with `Tags`, e.g. `species::insect`
The choice depends on count of categories

If we're to implement second system, then it would also be a great
idea to insert a tag hierarchy here
E.g. sometimes someone wants to find a specific tag, like
`species::goblin` tagged galleries, but I think mostly people are more
abstract with their search, so the base for `species::goblin` should be a 
`species::fantasy_creature`

Current master-slave tag system is designed to redirect
slave searches to master

```sql
insert into tags values 0, 'fantasy_creatures', 'species';
insert into tags values 1, 'goblin', 'species';
insert into tags_relations values 0, 1, 'master'

insert into tags values 2, 'jojo bizzare adventure', 'parody';
insert into tags values 3, 'jjba', 'parody';
insert into tags_relations values 2, 3, 'master'
```

search by `fantasy_creatures`:

```sql
select tag_id from tags where type='species' AND value='fantasy_creatures'
[0]
select slave_id from tags_relations where master_tag_id=0
[1]
select * from tags where tag_id = 0 or tag_id = 1
```

search by `jjba`:


```sql
select tag_id from tags where type='parody' AND value='jjba'
[3] // slave tag jjba
select slave_id from tags_relations where master_id = 3
[] // check tag's slaves == we MUST show all slaves
select master_id from tags_relations where slave_id = 3
[2] // check tag's master. In this case we MUST show the master
select * from creations_tags where tag_id = 3 or tag_id = 2
```

search by `goblin`:

```sql
select tag_id from tags where type='species' and value = 'goblin'
[1]
select slave_id from tags_relations where master_id = 1
[]
we SHOULD NOT read `master_id` in this case, but how can we know?
should this decision be dependent on tag_type?
```

```
tag::species::goblin
```


## Image gallery for artist/creations/etc

Not only the main picture must exist, but also a bunch of preview imgs. Not a bad feature to have I guess and doesn't seem to be hard to implement

## About tagging rules, adding info on website, etc

I think it's better to host it on github, not on the main site, since it would require some resources into developing own wiki, hosting it, etc. Maybe in the future, but definetely not in priority

## About voting for entries

Voting must refer to a different tables to not cause a buggy `update`s on the main table. I haven't thought yet about it's realization in details

Voting for chapters of collections or chapters of manga is a great feature, but I think (*not sure yet*) we'll go with on the same way MAL does, doing it through discussions

## Comments, discussions, users, etc

Needed, but not in priority. Related to website project only, so no point in thinking about it in context of OH project. I guess I'll make a different library (`WT.PostgreSQL`) for all website-only related DB stuff

## Tag votes

Do we need it? The same system, as it's on sadpanda. Related to WT only

## Languages/AlternativeTitles/etc problems

UPD. **4th** choice seems to be the **best** in terms of searching capabilities. Parsing string on indexed columns is **bad**

Several properties in above tables have multiple values/collections inside. We need to deal with that the best way possible. The below example is for `languages`, but it's mostly the same for other classes with this problem

One of the main points to choose one or another system is which one would be easier (*in terms of performance for server/db*) to search data

`LanguageInfo` prototype class for reference:

```c#
public class LanguageInfo
{
    // TODO: static methods can also be useful

    public CultureInfo Language { get; set; }

    // From lang code, e.g. `en-US`
    public CultureInfo GetFromCode(string languageCode) => CultureInfo.Parse(languageString);

    // To lang code, e.g. `en-US`
    public override string ToString() => Language.ToString();

    // e.g. CutureInfo or `ru-RU` will become `Русский` in output string
    public string ToLocalizedString() => Language.ToLocalizedString();

    public bool IsOfficial { get; set; } = false;
}
```

### 1st choice

**Format string:** `en-US::true`

**Table layout:**

- `creations.sql` -> no `language` info at all
- `creations_languages.sql` -> `creation_id`, `language`

**Class layout:**

```c#
public class CreationsLanguages
{
    public ulong CreationId { get; set; }

    public string Language { get; set; }

    // or when parsed
    public LanguageInfo Language { get; set; }
}
```

**Pros:**

- No need to update `creations` table each time `languages` changed
- Simple code

**Cons:**

- Additional table with lots of data, which means harder to create and support, time-consuming queries as table grows fast?
- Need to parse string server-side
- Hard to search for official/unofficial translation


### 2nd choice

**Format string:** `en-US::true;ru-RU:false`

**Table layout:**

- `creations.sql` -> `languages` column contains all info in formatted string

**Class layout:**

```c#
public class Creation
{
    public string Languages { get; set; }

    // or when parsed
    public IEnumerable<LanguageInfo> Languages { get; set; }
}
```

**Pros:**

- No need for fat additional tables
- Simple code

**Cons:**

- Need to update `creations` table each time `languages` changed
- Need to parse string server-side
- Hard to search for official/unofficial translation

### 3rd choice

Mix of **1** and **2**

**Format string:** `en-US::true;ru-RU:false`

**Table layout:**

- `creations.sql` -> no `language` info at all
- `creations_languages.sql` -> `creation_id`, `languages` column contains all info in formatted string

**Class layout:**

```c#
public class CreationsLanguages
{
    public string Languages { get; set; }

    // or when parsed
    public IEnumerable<LanguageInfo> Languages { get; set; }
}
```

**Pros:**

- No need to update `creations` table each time `languages` changed
- Simple code

**Cons:**

- Additional table with lots of data, but less, than in **1** approach
- Need to parse string server-side
- Hard to search for official/unofficial translation

### 4th choice

**Format string:** 

- `language` -> `en-US`
- `is_official` -> `true`

**Table layout:**

- `creations.sql` -> no `language` info at all
- `creations_languages.sql` -> `creation_id`, `language`, `is_official`

**Class layout:**

```c#
public class CreationsLanguages
{
    public ulong CreationId { get; set; }

    public string Language { get; set; }

    // or
    public LanguageInfo Language { get; set; }

    public bool IsOfficial { get; set; }
}
```

**Pros:**

- Search for official/unofficial translations easily
- Every entity is divided in it's own class in code
- No need to parse string server-side
- No need to update `creations` table each time `languages` changed

**Cons:**

- Additional table with lots of data, which means harder to create and support, time-consuming queries as table grows fast?

## Difference between storing properties: enums, custom class/collections and tags

Tags are different from values above and from enums:

- `Enum`s can be stored with one string in table and easily parsed server-side. Enum's categories are pretty limited and they always have only one value at time. `Enum`s values are crystal-clear from their names
- Custom-`class` values or custom-`class` collections have more properties, than just a `value`
- Tags have a lot of periodically addable categories, which are hard to be `enum`ed and they have only one `value`, which can be represented as string. Tags can have `description` as additional property, because, compared to `enum`s they're not very clear

E.g., `language` could have been enum if it didn't have the `is_official` property. It could also be a `tag` in this case, but `enum` is prefferable, since `language`s list is limited

The tag `parody` can't be an `enum`, since there's too many different anime/manga of which `parody` is created, and new can be added frequently. It also can't be an `enum`, since each title requires custom `description`. `parody` can be a custom `class`, but there't no point in it, since it only needs a generic `value` and `description` properties

Everything, which type is `ICollection` **should not** exist inside same table. The same *probably* is true for custom classes. The enums are safe-to-go and easily parsable from `string`

## Localizable data inside DB

I don't think anything except descriptions should be localized. Tags **must** not be localized, names have `alternative_name` field and a way to be found, and that's kind of it?

Since it't not indexed/there's no search, it's OK to store them as `json`(`bson`) string. E.g. for description:

```json
{
    [
        {
            "Language": "en-US",
            "Description": "This is description"
        },
        {
            "Language": "ru-RU",
            "Description": "Пошел нахуй"
        }
    ]
}
```

## Refactor entries, that contain only language and value properties

Should look something like this. Applies to: NameInfo, TitleInfo, DescriptionInfo, maybe more. Name's not decided yet

```c#
public class LocalizableEntry
{
    public LanguageInfo Language { get; set; }
    public string Value { get; set; }
}
```

## Working with relations

How should we handle writing relations into db? I can see two
approaches:

**1.**

```
characters_relations.sql
origin_character_id related_character_id relation_type
```

Here we write relations into `characters_relations.sql` table.
We make **TWO** writes when adding one relation, e.g:

```sql
INSERT INTO characters_relations VALUES(0, 1, 'friend')
INSERT INTO characters_relations VALUES(1, 0, 'friend')
```

**UPD. Can be done with one insert:**

```sql
INSERT INTO characters_relations VALUES(0, 1, 'friend'),(1, 0, 'friend')
```

Then, when extracting the data, we make **ONE** select for each character, searching only by `origin_character_id` e.g.:

```sql
SELECT * FROM characters_relations WHERE origin_character_id = 0
```

This apporach seem very logical and also gives an opportunity to make
relations, where `character_1` thinks of `character_2` as `friend`,
but `character_2` thinks about `character_1` as `enemy`

2.

```
charaters_relations.sql
origin_character_id related_character_id relation_type
```

Here we write relations into `characters_relations.sql` table.
We make **ONE** write when adding one relation, e.g:

```sql
INSERT INTO characters_relations VALUES(1, 0, 'friend')
```

Then, when extracting the data, we make TWO selects for each character, searching only by both `origin_character_id` and `related_character_id` e.g.:

```sql
SELECT * FROM characters_relations WHERE origin_character_id = 0
SELECT * FROM characters_relations WHERE related_character_id = 0
```

or

```sql
SELECT * FROM characters_relations WHERE origin_character_id = 0 OR related_character_id = 0
```

And then analyze the selected data


## Reading collections

```
relation_types: collection_master, collection_slave, parent, child, alternative
creation_type: manga, magazine, tankoubon ...
```

No table inheritance (`PostgreSQL` feature):

```
creations: creation_id creation_type title ...
manga: creation_id length chapter ...
```

Then, get the data from tables with two queries:

```sql
real_class = SELECT creation_type FROM creations WHERE creation_id = 0
SELECT * FROM real_class WHERE creation_id = 0
```

If we use inheritance, there's two queries too, but lesser fields in tables:

```
creations: id title ... // rename creation_id to id
manga: length chapter ... // we don't need creation_id and id since it's inherited
```

Get data like this:

```sql
real_class = SELECT creations.tableoid::regclass FROM creations WHERE creations.id= 0;
SELECT * FROM real_class WHERE creation_id = 0;
```
