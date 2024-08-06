# https://discindo.org/post/joining-the-flock-from-r-working-with-data-on-motherduck/
# https://discindo.org/post/shiny-ducks-connecting-to-motherduck-from-shiny/
# https://app.motherduck.com/

Sys.setenv('MD_TOKEN'='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzZXNzaW9uIjoiam9obi5iLmdhdmluK2dpdGh1Yi5nbWFpbC5jb20iLCJlbWFpbCI6ImpvaG4uYi5nYXZpbitnaXRodWJAZ21haWwuY29tIiwidXNlcklkIjoiOTViMjgzMDctYzI0NS00ZmE5LThkZGUtNzcyMjUyNjliZGU0IiwiaWF0IjoxNzE5NjkwOTQ3LCJleHAiOjE3NTEyNDg1NDd9.3u7LKEEw0d-4KZ4gw1rcDppA_CMKC042r79nemOZT4I')
Sys.getenv('MD_TOKEN')

if (!requireNamespace('pak')) installed.packages('pak')
if (!requireNamespace('pacman')) pak::pak(pacman)
pacman::p_load(DBI, duckdb)

con <- dbConnect(duckdb::duckdb(), ":memory:")
dbWriteTable(con, "iris", iris)
data <- dbGetQuery(con, "SELECT * FROM iris")
head(data, 2)

# con <- DBI::dbConnect(duckdb::duckdb(), "md:")
con <- DBI::dbConnect(duckdb::duckdb(), "local.duckdb")
# duckdb # in terminal
# DBI::dbExecute(con, "INSTALL 'motherduck';")
# DBI::dbExecute(con, "LOAD 'motherduck';")
DBI::dbGetQuery(
  con,
  "SELECT extension_name, loaded, installed FROM duckdb_extensions() WHERE
  extension_name = 'motherduck'"
)
DBI::dbExecute(con, "PRAGMA MD_CONNECT")
