# Roadmap (not at all)

First I need to make OpenHentai useful, decide on database standard and then finally decide how to write this app: should this be a blazor app, avalonia's weird thingy (I know it's a bad decision in terms of perfomance/support, but I hate writing html/js code for frontend and if no one helps me on this point, I will have to use avalonia) or something else.
Now it's just a dummy-project without any useful code. 

The numbers out here is the priority of task as I see them right now. **1.0** is a point, where beta release is possible, I think

TL;DR plan looks something like this:

basic API (no events, collections questionable)

basic DB scheme

link code to postgres, update/fix existing API

~~API of collections/events + schemes~~ *later*

frontend (**I hate this shit**)

More below

## Circle page

1.0

- [ ] Title (e.g. `Noraneko-no-tama`)
- [ ] Alternative titles (e.g. `ノラネコノタマ`)
- [ ] Authors (list of related authors)

## Author page

1.0

- [ ] First name (e.g. `Yumiri`)
- [ ] Last name (e.g. `Hanamori`)
- [ ] Full name (e.g. `Hanamori Yumiri`)
- [ ] Alternative names (e.g. `花守 ゆみり`)
- [ ] Species (hardcoded `Human`)
- [ ] Additional details (minor text info, e.g. link to MAL if exists)
- [ ] Description (e.g. `Voice actor`)
- [ ] Gender (e.g. `Female`)
- [ ] Birthday (e.g. `29.09.1997`)
- [ ] Age (e.g. `25`)
- [ ] Preview image (or gallery?)
- [ ] Author name (e.g. `Yukino Minato`)
- [ ] Alternative author names (e.g. `雪野みなと`)
- [ ] Circle (e.g. `noraneko-no-tama`)
- [ ] External links (e.g. `pixiv - https://..., fantia - https://...`)
- [ ] Creations (list of `doujins`)

Questionable

- [ ] Characters (list of `chara`)

## Character page

1.0

- [ ] First name (e.g. `Nadeshiko`)
- [ ] Last name (e.g. `Kagamihara`)
- [ ] Full name (e.g. `Kagamihara Nadeshiko`)
- [ ] Alternative names (e.g. `各務原 なでしこ`)
- [ ] Species (e.g. `Human`)
- [ ] Additional details (minor text info, e.g. link to MAL if exists)
- [ ] Description (e.g. `Nadeshiko Kagamihara is a young girl from Nanbucho. She is very cheerful and energetic, but easily forgets things. She also likes to eat a lot.`)
- [ ] Gender (e.g. `Female`)
- [ ] Birthday (e.g. `01.01.2001`)
- [ ] Age (e.g. `16`)
- [ ] Preview image (or gallery?)
- [ ] IsCosplay (not related to page, but a property of chara for exact doujin)
- [ ] RelatedTo (list of related `chara`)
- [ ] FeaturedIn (list of `doujin`)

Questionable:

- [ ] Authors (list of authors, that used this `chara`)
- [ ] Genitals (related to `Gender`)
- [ ] Body type (`loli`, `oppai-loli`, etc)

## Doujinshi page

1.0

- [ ] Title (e.g. `Poputepipikku 2nd Season`)
- [ ] Preview image
- [ ] Alternative titles (e.g. `Japanese:ポプテピピック, English:Pop Team Epic`)
- [ ] Authors (probably should be expanded as `Staff` on MAL? e.g. `Asanagi: page 1-20, Yukino Minato: page 21-40...`)
- [ ] Type (manga, doujinshi, game, etc)
- [ ] Genres (lolicon, rape, etc)
- [ ] Length (pages count)
- [ ] Volumes
- [ ] Chapters
- [ ] Status (publishing, published, etc)
- [ ] Release date (or Date started/Date ended)
- [ ] Rating (e.g. `R18G`)
- [ ] Avalilable at (e.g. `Pixiv (free):https://..., Fanbox (paid):https://...`)
- [ ] Description
- [ ] Parent doujinshi/story (if exists)
- [ ] Alternative doujinshi/story (???)
- [ ] Child doujinshi (if exists)
- [ ] Released at (event, e.g. comic1, komiket. etc)
- [ ] Collections (magazine, e.g. comic lo, towako, etc)
- [ ] List of characters (relies on `Charater` specification)
- [ ] Related to (in case it's parody; in form of external url, e.g. `Parody of: Pop Team Epic -- https://myanimelist.net/anime/50663`)
- [ ] Languages (e.g. `Official: japanese, english; Fan: russian`)
- [ ] Censorship type (none, mosaic, etc)
- [ ] Is colored
- [ ] Has images (excluding front page)

1.1

- [ ] User notes (anything, e.g. link to sadpanda)
- [ ] Other kind of creations (games, videos, etc)
- [ ] Add/remove to list support
- [ ] Scoring system
- [ ] Tags (user-proposed)
- [ ] Preview images gallery

2.0

- [ ] Favorites
- [ ] Statistics (Ranked, popularity, members)
- [ ] Discussions
- [ ] Reviews
- [ ] Recommendations (user-driven)
- [ ] News

3.0

- [ ] Recommendations (AI)

## Add circle page

## Add author page

## Add chara page

## Add doujin page

## User page and list

1.1

- [ ] Export/import as json (compatible with `DoujinDownloader`/`gallery-dl` /w user notes)
