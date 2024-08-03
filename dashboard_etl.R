CONSTANTS_FILE = "/Users/ben/Desktop/Code/Dynasty Dashboard/dashboard_constants.R"
source(UTILS_FILE)

add_sleeper_ids <- function(df) {
  
  ids <- ffscrapr::dp_playerids() %>%
    select(sleeper_id, fantasypros_id)
  
  output_df <- left_join(df, ids, by = c("fp_id" = "fantasypros_id")) %>%
    select(id = sleeper_id, everything()) %>%
    select(-fp_id)
  
  return(output_df)
  
}

load_player_values <- function() {
  output_df <- ffscrapr::dp_values("values-players.csv") %>%
    add_sleeper_ids() %>%
    add_rosters() %>%
    process_player_values()
  
  return(output_df)
}

load_pick_values <- function() {
  output_df <- ffscrapr::dp_values("values-picks.csv")
  
  return(output_df)
}

load_rosters <- function(league_con=con) {
  output_df <- ffscrapr::ff_rosters(league_con) %>%
    mutate(franchise_name = clean_team_names(franchise_name)) %>%
    select(player_id, franchise_id, franchise_name)
  
  return(output_df)
} 

add_rosters <- function(df) {
  rosters <- load_rosters()
  output_df <- left_join(df, rosters, by = c("id" = "player_id"))
  
  return(output_df)
}

process_player_values <- function(df) {
  output_df <- df %>%
    select(all_of(ROSTER_VALUES_COLUMNS)) %>%
    arrange(-roster_value)
  
  return(output_df)
}

simulate_season <- function(league_con=con) {
  
  season_sim <- ffsimulator::ff_simulate(league_con, n_seasons = N_SIMS)
  
  sim_summary <- season_sim$summary_simulation %>%
    mutate(franchise_name = clean_team_names(franchise_name),
           h2h_wins = h2h_wins * N_WEEKS / 14)
  
  sim_playoffs <- season_sim$summary_season %>% 
    mutate(franchise_name = clean_team_names(franchise_name)) %>%
    group_by(season) %>%
    arrange(-h2h_wins, -points_for, .by_group = TRUE) %>%
    slice_head(n = N_PLAYOFF_TEAMS) %>%
    group_by(franchise_name) %>%
    count() %>%
    mutate(playoff_odds = n / N_SIMS) %>%
    select(franchise_name, playoff_odds)
  
  sim_results <- left_join(sim_summary, sim_playoffs, by = "franchise_name")
  
  output_df <- sim_results %>%
    select(all_of(SIMULATION_COLUMNS))
  
  
  return(output_df)
  
}
