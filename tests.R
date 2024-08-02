source("dashboard_etl.R")

foo = load_player_values()

load_pick_values()

load_rosters()

foo = simulate_season()

foo$summary_simulation

foo$