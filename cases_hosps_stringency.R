weekly <- read.csv("/Users/gustavosganzerla/Desktop/covid_ns/mobility/weekly.csv", sep = ";")
weekly$normalized_cases <- range01(weekly$cases)
weekly$normalized_hosps <- range01(weekly$hospitalizations)



cases <- ggplot()+
  geom_area(data = weekly, aes(x = as.Date(week), y = normalized_cases, color = "cases", fill = "cases"))+
  scale_x_date(date_labels = "%d/%m/%Y", breaks = "3 months")+
  theme(axis.text.x = element_text(angle = 90, hjust=1),
        legend.position = "none")+
  geom_line(data = weekly, aes(x = as.Date(week), y = stringency/100), color = "darkgreen")+
  xlab("Week")+
  ylab("")+
  annotate("text", x = as.Date("20/04/2020", format = "%d/%m/%Y"), y = 0.70, label = "Oxford\n Stringency Index", size = 3)+
  annotate("text", x = as.Date("10/05/2020", format = "%d/%m/%Y"), y = 0.1, label = "7-day average", size = 3)+
  ggtitle("Cases")+
  stat_cor(method="pearson", label.y.npc="top", label.x.npc = "left", col = "black")

shapiro.test(weekly$cases)
cor(weekly$cases[1:95], weekly$stringency[96:99], method = "spearman")
cor(weekly$cases[96:99], weekly$stringency[96:99], method = "spearman")



hosps <- ggplot()+
  geom_area(data = weekly, aes(x = as.Date(week), y = normalized_hosps, color = "cases", fill = "cases"))+
  scale_x_date(date_labels = "%d/%m/%Y", breaks = "3 months")+
  theme(axis.text.x = element_text(angle = 90, hjust=1),
        legend.position = "none")+
  geom_line(data = weekly, aes(x = as.Date(week), y = stringency/100), color = "darkgreen")+
  xlab("Week")+
  ylab("")+
  annotate("text", x = as.Date("20/04/2020", format = "%d/%m/%Y"), y = 0.70, label = "Oxford\n Stringency Index", size = 3)+
  annotate("text", x = as.Date("10/05/2020", format = "%d/%m/%Y"), y = 0.1, label = "7-day average", size = 3)+
  ggtitle("Hospitalizations")
  
  
shapiro.test(weekly$hospitalizations)
cor(weekly$hospitalizations[1:95], weekly$stringency[96:99], method = "spearman")
cor(weekly$hospitalizations[96:99], weekly$stringency[96:99], method = "spearman")

ggarrange(cases, hosps)
