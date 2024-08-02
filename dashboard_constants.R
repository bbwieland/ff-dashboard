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
con = ffscrapr::sleeper_connect(season=CURRENT_SEASON, league_id=LEAGUE_ID)