username="gigas"
database_name="test"
sql_path=$PWD

# Drop everything
psql -U $username -d $database_name -f "$sql_path/drop_everything.sql"

# Init order:
# authors
# circles
# authors_circles
# creations
# authors_creations
# circles_creations
# creation_relations
# doujinshi
# characters
# creations_characters
# character_relations

# Re-initialize
psql -U $username -d $database_name -f "$sql_path/authors.sql"
psql -U $username -d $database_name -f "$sql_path/circles.sql"
psql -U $username -d $database_name -f "$sql_path/authors_circles.sql"
psql -U $username -d $database_name -f "$sql_path/creations.sql"
psql -U $username -d $database_name -f "$sql_path/authors_creations.sql"
# psql -U $username -d $database_name -f "$sql_path/circles_creations.sql"
psql -U $username -d $database_name -f "$sql_path/creation_relations.sql"
psql -U $username -d $database_name -f "$sql_path/doujinshi.sql"
psql -U $username -d $database_name -f "$sql_path/characters.sql"
psql -U $username -d $database_name -f "$sql_path/creations_characters.sql"
psql -U $username -d $database_name -f "$sql_path/character_relations.sql"
