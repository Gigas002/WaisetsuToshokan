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
g::"shounen" && c::"manga" || c::"anime" a::"<30" && -n::"name"
```

**TODO:** It's also a good idea to implement import/export macros schemes, so that regular searches would be fast to do. Plus, you can share your search macross with other people. But is there any point in saving them? Its just a string after all... Nah, that seems like a bad idea, but it's worth noting it as `discussable` in community

## Localization issues

How to localize db content? E.g. manga description. Seems hard/resource-painful to implement

UI is easily localizable, so it's out of question

Here's one of the ways to do so:

Since we won't be indexing and searching through descriptions and other localizable content, it's ok (?) for them to take lots of space into column

So... I don't think it's a good idea, but we can push descriptions like so:

```c
en-US::"This is description about yet another stupid manga";ja-JP::"お金が欲しい"
```

And then parse strings after taking value from DB

I don't think anything except descriptions should be localized. Tags **must** not be localized, names have `alternative_name` field and a way to be found, and that's kind of it?

## Db request pool

Add/fix request pool should not affect actual dbs until it's pushed by mods/admins, so we need to think about threshold database or tables and manage their cleanup/migrations

Probably the best option is to have a threshold database and clean it once per week or so, migrating yet unmerged entries into new threshold

## Discussable: author's category, that depends on content type feature.

e.g. Author "name" is an artist. He is a `main_artist` for `creation_1`, but he also participate in some magazines as main page illustrator, therefore for these magazines he is a `main_page_artist` or something like that.

The outcome of implementing this feature will be:
- Ability to add authors as `secondary_artist` (*name not yet decided*) to some works, where they usualy are not tagged (*not implemented even on sadpanda*)
- Ability to search for creations using `artist_category` switch

Also, I guess we still would be in need to implement such feature in future, when adding the `games` objects onto standard. These **require** artist to have diffrenet tasks, since there illustrators, programmers and so on (*though I don't think we'll need to tag every each one of them into creation's page lol*)

How can this be done?

Let's see...

```c#
public class Creation
{
    // AuthorCategory is enum
    public Dictionary<IAuthor, AuthorCategory> Authors { get; set; }
}
```

Then, in database:

```c
authors_creations.sql

author_id creation_id author_role
```

Looks ok I guess?

## Tag hierarchy/binding

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
