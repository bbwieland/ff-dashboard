library(ffscrapr)
library(ffsimulator)
library(ffopportunity)
library(tidyverse)

clean_team_names <- function(names) {
  trimws(names)
}