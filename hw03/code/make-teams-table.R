#===========================================================

#title: make teams table
#description: create a csv data file nba2017-teams.csv that will contain
#             the required variables to be used in the ranking analysis
#input(s): data file 'nba2017-teams.csv'
#output(s): data frame of teams
# Author: Xuening Hu
# Date: 10-04-2017
#===========================================================

# packages
library(readr)
library(dplyr)
library(ggplot2)

#set working directery
setwd('/Users/Xuening/stat133/stat133-hws-fall17/hw03')

# with "base" read.csv()
dat_stats <- read.csv('/Users/Xuening/stat133/stat133-hws-fall17/hw03/data/nba2017-stats.csv')
dat_roster <- read.csv('/Users/Xuening/stat133/stat133-hws-fall17/hw03/data/nba2017-roster.csv',
                       stringsAsFactors = FALSE)

#mutate() to add the following variables to the data frame associated with nba2017-stats.csv
dat_stats2<-mutate(dat_stats,
       missed_fg = (field_goals_atts - field_goals_made),
       missed_ft = (points1_atts - points1_made),
       points = ((points3_made*3)+(points2_made*2)+points1_made),
       rebounds = (off_rebounds + def_rebounds),
       efficiency = (points + rebounds + assists + steals + blocks
                     - missed_fg - missed_ft - turnovers) / games_played)
#use sink() to send the R output of summary()
sink(file = '/Users/Xuening/stat133/stat133-hws-fall17/hw03/output/efficiency-summary.txt')
summary(dat_stats2$efficiency)
sink()

#merge the roster and stats data frames
big_table <- merge(dat_roster,dat_stats2)

#Creating nba2017-teams.csv
teams <- summarize(group_by(big_table,team),
  experience = round(sum(experience),2),
  salary = round(sum(salary/1000000),2),
  points3 = sum(points3_made),
  points2 = sum(points2_made),
  free_throws = sum(points1_made),
  points = (points3 * 3 + points2 * 2 + free_throws),
  off_rebounds = sum(off_rebounds),
  def_rebounds = sum(def_rebounds),
  assists = sum(assists),
  steals = sum(steals),
  blocks = sum(blocks),
  turnovers = sum(turnovers),
  fouls = sum(fouls),
  efficiency = sum(efficiency)
)
summary(teams)

#Use sink() to send the R output of the teams summary to a text file named
#teams-summary.txt
sink(file = '/Users/Xuening/stat133/stat133-hws-fall17/hw03/output/teams-summary.txt')
summary(teams)
sink()

#export the teams table to a csv file named nba2017-teams.csv, inside the data/ folder
write.csv(teams, file = '/Users/Xuening/stat133/stat133-hws-fall17/hw03/data/nba2017-teams.csv',row.names=FALSE)

#use stars() to get a star plot of the teams. 
#Save the plot in the file teams_star_plot.pdf (insise the images/ folder)
pdf('/Users/Xuening/stat133/stat133-hws-fall17/hw03/images/teams_star_plot.pdf')
stars(teams[ ,-1], labels = teams$team)
dev.off()

#use ggplot() to get a scatterplot of experience and salary, in which the names of
#the teams are included. Save the plot in the file experience_salary.pdf (insise the images/ folder
pdf(file = '/Users/Xuening/stat133/stat133-hws-fall17/hw03/images/experience_salary.pdf')
ggplot(data = teams)+
  geom_point(aes(x = experience,y = salary))+
  geom_label(mapping = aes(x = experience, y = salary, label = team))
dev.off()










