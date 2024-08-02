source("dashboard_etl.R")
source("dashboard_uploader_utils.R")

full_rosters = load_player_values()
waivers = full_rosters %>% filter(is.na(franchise_id))
sims = simulate_season()

upload_sheet(full_rosters, "All Players Raw")
upload_sheet(waivers, "Waivers Raw")
upload_sheet(sims, "Season Outcomes Raw")


