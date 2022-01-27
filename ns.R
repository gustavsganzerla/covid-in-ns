covid_ns <- read.csv("/Users/gustavosganzerla/Desktop/covid_ns/dailies/Jan17/COVID19Tracker.ca Data - NS.csv", sep = ",")
covid_ns$data...date <- as.Date(covid_ns$data...date)

cases_ns_big_picture <- ggplot()+
  geom_area(data=covid_ns, aes(x=as.Date(data...date), y=data...change_cases, group=1), color="salmon", fill = "coral")+
  ylab("Cases")+
  xlab("Date")+
  theme(axis.text.x = element_text(angle = 90, hjust=1),
        legend.position = "none")+
  ggtitle("Evolution of cases in Nova Scotia")
