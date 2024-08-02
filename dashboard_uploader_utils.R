library(googlesheets4)

source("dashboard_constants.R")

upload_sheet <- function(df, tab, sheet_url = GOOGLE_SHEET_URL) {
  write_sheet(data = df,
              ss = sheet_url,
              sheet = tab)
} 

googlesheets4::gs4_auth()
