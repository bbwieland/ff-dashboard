CONSTANTS_FILE = "/Users/ben/Desktop/Code/Dynasty Dashboard/dashboard_constants.R"

source(CONSTANTS_FILE)
source(ETL_FILE)
source(UPLOADER_UTILS_FILE)

full_rosters = load_player_values()
waivers = full_rosters %>% filter(is.na(franchise_id))
sims = simulate_season()

upload_sheet(full_rosters, "All Players Raw")
upload_sheet(waivers, "Waivers Raw")
upload_sheet(sims, "Season Outcomes Raw")