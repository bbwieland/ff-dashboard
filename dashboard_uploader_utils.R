library(googlesheets4)
library(cronR)

CONSTANTS_FILE = "/Users/ben/Desktop/Code/Dynasty Dashboard/dashboard_constants.R"

source(CONSTANTS_FILE)

upload_sheet <- function(df, tab, sheet_url = GOOGLE_SHEET_URL) {
  write_sheet(data = df,
              ss = sheet_url,
              sheet = tab)
} 

schedule_cronjob <- function() {
  
  script_job = cron_rscript(UPLOADER_FILEPATH)
  cron_add(script_job,
           frequency = CRONR_FREQUENCY,
           at = CRONR_TIME_OF_DAY,
           id = CRONR_ID
           )
  
}