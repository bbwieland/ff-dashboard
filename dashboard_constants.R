# Basic Constants ---------------------------------------------------------

CURRENT_SEASON = 2024
LEAGUE_ID = "1048251064442605568"
MY_TEAM = "Garrett Park Grinders"

# Column Subset Constants --------------------------------------------------

ROSTER_VALUES_COLUMNS = c("id", "franchise_id", "player", 
                          "franchise" = "franchise_name", 
                          "pos", "nfl_team" = "team", "age", "draft_year",
                          "roster_value" = "value_2qb", 
                          "roster_ranking" = "ecr_2qb")

SIMULATION_COLUMNS = c("franchise" = "franchise_name", "playoff_odds",
                       "xwins" = "h2h_wins", 
                       "xwinpct" = "h2h_winpct", 
                       "true_talent" = "allplay_winpct", 
                       "pf" = "points_for", "pa" = "points_against")

# Simulator Constants -----------------------------------------------------

N_SIMS = 500
N_WEEKS = 15
N_PLAYOFF_TEAMS = 4

# Uploader Constants ------------------------------------------------------

GOOGLE_SHEET_URL = "https://docs.google.com/spreadsheets/d/1hgeJVr1BPfSLrSnqPoOBg5dDJbBChDA_jPsYgwdaDXY/edit?gid=1078734378#gid=1078734378"
GOOGLE_AUTH_EMAIL = "benbowenwieland@gmail.com"
UPLOADER_FILEPATH = "/Users/ben/Desktop/Code/Dynasty Dashboard/dashboard_uploader.R"


# Filepath Constants ------------------------------------------------------

FILE_PREFIX = "/Users/ben/Desktop/Code/Dynasty Dashboard/"

ETL_FILE = paste0(FILE_PREFIX,"dashboard_etl.R")
UTILS_FILE = paste0(FILE_PREFIX,"dashboard_utils.R")
UPLOADER_UTILS_FILE = paste0(FILE_PREFIX, "dashboard_uploader_utils.R")



# Cronjob Constants -------------------------------------------------------

CRONR_FREQUENCY = "daily"
CRONR_TIME_OF_DAY = "7AM"
CRONR_ID = "dynasty_uploader"

# Connection to Sleeper ---------------------------------------------------

con = ffscrapr::sleeper_connect(season=CURRENT_SEASON, league_id=LEAGUE_ID)