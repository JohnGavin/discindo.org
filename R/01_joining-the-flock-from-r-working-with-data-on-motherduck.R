# https://discindo.org/post/joining-the-flock-from-r-working-with-data-on-motherduck/
# https://discindo.org/post/shiny-ducks-connecting-to-motherduck-from-shiny/
# https://app.motherduck.com/

if (!requireNamespace('pak')) installed.packages('pak')
if (!requireNamespace('pacman')) pak::pak(pacman)
pacman::p_load(DBI, duckdb)

con <- dbConnect(duckdb::duckdb(), ":memory:")
dbWriteTable(con, "iris", iris)
data <- dbGetQuery(con, "SELECT * FROM iris")


# con <- DBI::dbConnect(duckdb::duckdb(), "md:")
con <- DBI::dbConnect(duckdb::duckdb(), "local.duckdb")
# DBI::dbExecute(con, "INSTALL 'motherduck';")
# DBI::dbExecute(con, "LOAD 'motherduck';")
DBI::dbGetQuery(
  con,
  "SELECT extension_name, loaded, installed FROM duckdb_extensions() WHERE
  extension_name = 'motherduck'"
)
DBI::dbExecute(con, "PRAGMA MD_CONNECT")
