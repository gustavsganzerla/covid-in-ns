

covid_ns <- read.csv("/Users/gustavosganzerla/Desktop/covid_ns/dailies/Jan17/COVID19Tracker.ca Data - NS.csv", sep = ",")

covid_ns$data...date <- as.Date(covid_ns$data...date)
covid_ns$data...change_hospitalizations[covid_ns$data...change_hospitalizations<0] <- 0
covid_ns$data...change_cases[covid_ns$data...change_cases<0] <- 0
covid_ns$cases_100k[covid_ns$cases_100k<0] <- 0



colnames(covid_ns)
ns_pop <- 992055 
covid_ns$Phase <- c(0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 
                    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
                    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 
                    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 
                    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 0,  0,  0,  0,  0,  0,  0,  0,  0,  
                    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  
                    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  
                    0,  0, 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  
                    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 
                    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  
                    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  
                    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 0,  0,  0,  0,  0,  0,  0, 
                    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 
                    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  
                    0,  0,  0,  0, 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 
                    0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1, 
                    1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  2,  2,  2,  2, 2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  3,  3,  3,  3,  3,  
                    3,  3,  3,  3,  3,  3,  3,  3,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4, 
                    4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4, 4,  4,  4,  4,  4,  
                    4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  5,  5,  
                    5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  
                    5,  5,  5,  5,  5,  5, 5,  5,  5,  5,  5,  5,  5, 5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5, 
                    5,  5,  5,  5,  5,  5,  5,  5,  5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5)

plot2 <- ggplot(data = covid_ns, aes(x=as.Date(data...date), y=data...change_cases, group=1, color = factor(Phase)))+
  geom_line(aes(group=1))+
  theme(axis.text.x = element_text(angle = 90, hjust=1))+
  scale_x_date(date_labels = "%Y-%m-%d", breaks = "3 months")+

  annotate("rect", xmin = as.Date("2021-06-02"), xmax = as.Date("2021-06-15"), ymin = 0, ymax = Inf, alpha = .2, fill = "#BB9D00" )+
  annotate("rect", xmin = as.Date("2021-06-15"), xmax = as.Date("2021-06-29"), ymin = 0, ymax = Inf, alpha = .2, fill = "#00BF7D" )+
  annotate("rect", xmin = as.Date("2021-06-29"), xmax = as.Date("2021-07-14"), ymin = 0, ymax = Inf, alpha = .2, fill = "#00C1AA" )+
  annotate("rect", xmin = as.Date("2021-07-14"), xmax = as.Date("2021-10-04"), ymin = 0, ymax = Inf, alpha = .2, fill = "#00B4EF" )+
  annotate("rect", xmin = as.Date("2021-10-04"), xmax = as.Date("2022-01-01"), ymin = 0, ymax = Inf, alpha = .2, fill = "#E76BF3" )+
  annotate("text", x = as.Date("2021-06-11"), y = 25 , label = "Delta variant" )+
  annotate("text", x = as.Date("2020-12-17"), y = 50 , label = "First vaccine" )+
  
  annotate("text", size = 3, x = as.Date("2020-04-23"), y = 130 , label = paste(round(ns_c1/ns_h1,2), "Cases/hospitalization"))+
  annotate("text", size = 3, x = as.Date("2020-04-23"), y = 100 , label = paste(round(ns_vac1/ns_pop,2), "% vaccinated"))+
  
  annotate("text", size = 3, x = as.Date("2021-05-07"), y = 250 , label = paste(round(ns_c2/ns_h2,2), "Cases/hospitalization"))+
  annotate("text", size = 3, x = as.Date("2021-05-07"), y = 220 , label = paste(round(ns_vac2/ns_pop*100,2), "% vaccinated"))+
  
  annotate("text", size = 3, x = as.Date("2021-12-20"), y = 630 , label = paste(round(ns_c3/ns_h3,2), "Cases/hospitalization"))+
  annotate("text", size = 3, x = as.Date("2021-12-20"), y = 600 , label = paste(round(ns_vac3/ns_pop*100,2), "% vaccinated"))
  
  


###FROM cases_ns, we can observe three waves
#wave 1
ns_c1 <- sum(covid_ns[67:94,]$data...change_cases)
ns_h1 <- sum(covid_ns[67:94,]$data...change_hospitalizations)
ns_d1 <- sum(covid_ns[67:94,]$data...change_criticals)
ns_vac1 <- covid_ns[94,]$data...total_vaccinated

#wave 2
ns_c2 <- sum(covid_ns[463:478,]$data...change_cases)
ns_h2 <- sum(covid_ns[463:478,]$data...change_hospitalizations)
ns_d2 <- sum(covid_ns[463:478,]$data...change_criticals)
ns_vac2 <- covid_ns[492,]$data...total_vaccinated
#wave 3 - omicron
ns_c3 <- sum(covid_ns[687:723,]$data...change_cases)
ns_h3 <- sum(covid_ns[687:723,]$data...change_hospitalizations)
ns_d3 <- sum(covid_ns[687:723,]$data...change_criticals)
ns_vac3 <- covid_ns[723,]$data...total_vaccinated



cases_ns_vaccine_ratio <- ggplot()+
  geom_area(data=covid_ns, aes(x=as.Date(data...date), y=data...change_cases, group=1), color="salmon", fill = "coral")+
  ylab("Cases")+
  xlab("Date")+
  theme(axis.text.x = element_text(angle = 90, hjust=1),
        legend.position = "none")+
  ggtitle("A")+
  scale_x_date(date_labels = "%Y-%m-%d", breaks = "3 months")+
  annotate("text", size = 3, x = as.Date("2020-04-15"), y = 130 , label = paste(round(ns_c1/ns_h1,2), "Cases/hospitalization"))+
  annotate("text", size = 3, x = as.Date("2020-04-15"), y = 80 , label = paste(round(ns_vac1/ns_pop,2), "% vaccinated"))+
  
  annotate("text", size = 3, x = as.Date("2021-05-01"), y = 340 , label = paste(round(ns_c2/ns_h2,2), "Cases/hospitalization"))+
  annotate("text", size = 3, x = as.Date("2021-05-01"), y = 280 , label = paste(round(ns_vac2/ns_pop*100,2), "% vaccinated"))+
  
  annotate("text", size = 3, x = as.Date("2021-12-01"), y = 1000 , label = paste(round(ns_c3/ns_h3,2), "Cases/hospitalization"))+
  annotate("text", size = 3, x = as.Date("2021-12-01"), y = 940 , label = paste(round(ns_vac3/ns_pop*100,2), "% vaccinated"))


cases_ns_big_picture <- ggplot()+
  geom_area(data=covid_ns, aes(x=as.Date(data...date), y=data...change_cases, group=1), color="salmon", fill = "coral")+
  ylab("Cases")+
  xlab("Date")+
  theme(axis.text.x = element_text(angle = 90, hjust=1),
        legend.position = "none")+
  # annotate("text", x = as.Date("2021-06-11"), y = 0.0004 , label = "Delta" )+
  # geom_segment(aes(x = as.Date("2021-06-11"), y = 0, xend = as.Date("2021-06-11"), yend = 0.00035))+
  # annotate("text", x = as.Date("2021-11-13"), y = 0.0004 , label = "Omicron" )+
  # geom_segment(aes(x = as.Date("2021-12-13"), y = 0, xend = as.Date("2021-12-01"), yend = 0.00035))+
  ggtitle("Evolution of cases in Nova Scotia")
  


