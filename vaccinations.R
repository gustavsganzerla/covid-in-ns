recent_ns <- covid_ns[covid_ns$data...date>=as.Date("2021-10-01"),]

covid_ns$data...change_cases[covid_ns$data...change_cases<0] <- 0
recent_ns$data...change_hospitalizations[recent_ns$data...change_hospitalizations<0] <- 0
recent_ns$data...change_criticals[recent_ns$data...change_criticals<0] <- 0

cases_hosps_ns <- ggplot()+
  geom_line(data=recent_ns, aes(x=as.Date(data...date), y=data...change_hospitalizations, group=1, color = "hospitalizations"))+
  geom_line(data=recent_ns, aes(x=as.Date(data...date), y=data...change_cases, group=1, color = "cases"))+
  geom_line(data=recent_ns, aes(x=as.Date(data...date), y=data...change_hospitalizations*12.58, group=1, color = "extrapolated"))+
  ylab("Cases and hospitalizations")+
  xlab("")+
  theme(axis.text.x = element_text(angle = 90, hjust=1))+
  ggtitle("B")+
  scale_x_date(date_labels = "%Y-%m-%d", breaks = "10 days")


ggarrange(cases_ns, cases_hosps_ns, ncol = 1)            
            
