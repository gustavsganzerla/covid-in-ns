halifax <- read.csv("/Users/gustavosganzerla/Desktop/covid_ns/mobility/nova_scotia.csv", sep = ";")

cor(halifax$workplaces_percent_change_from_baseline, halifax$residential_percent_change_from_baseline, method = "pearson")
mean(na.omit(halifax$transit_stations_percent_change_from_baseline))
colnames(halifax)

halifax$date <- as.Date(halifax$date, format="%d/%m/%Y")



halifax_mobility <- data.frame(rollapply(halifax$grocery_and_pharmacy_percent_change_from_baseline, n, sum, by=n))
colnames(halifax_mobility) <- "grocery"
halifax_mobility$transit <- data.frame(rollapply(halifax$transit_stations_percent_change_from_baseline, n, sum, by=n))
halifax_mobility$residential <- data.frame(rollapply(halifax$residential_percent_change_from_baseline, n, sum, by=n))
halifax_mobility$retail <- data.frame(rollapply(halifax$retail_and_recreation_percent_change_from_baseline, n, sum, by=n))
halifax_mobility$parks <- data.frame(rollapply(halifax$parks_percent_change_from_baseline, n, sum, by=n))
halifax_mobility$workplace <- data.frame(rollapply(halifax$workplaces_percent_change_from_baseline, n, sum, by=n))
halifax_mobility$week <- weekly$week  

halifax_mobility <- halifax_mobility[-1,]

driving <- data.frame(rollapply(ns_apple$driving,n, sum, by=n ))
driving <- head(driving, -5)

halifax_mobility$driving <- driving

walking <- data.frame(rollapply(ns_apple$walking, n, sum, by=n))
walking <- head(walking, -5)

halifax_mobility$walking <- walking

halifax_mobility$nature <- 



colnames(ns_apple)

write.table(halifax_mobility, "/Users/gustavosganzerla/Desktop/covid_ns/mobility/weekly_mobility.csv", sep = ",")


grocery_farmacy <- ggplot(data=halifax, aes(x=as.Date(date), y=grocery_and_pharmacy_percent_change_from_baseline, color="blue"))+
  geom_line()+
  theme(axis.ticks.x=element_blank(),
        axis.text.x=element_blank(),
        legend.position = "none")+
  ggtitle("Grocery & Pharmacy")+
  scale_x_date(date_labels = "%d-%m-%Y", breaks = "3 months")+
  theme(axis.text.x = element_text(angle = 50, hjust=1))+
  xlab("")+
  ylab("Grocery and pharmacy mobility")

transit <- ggplot(data=halifax, aes(x=as.Date(date), y=transit_stations_percent_change_from_baseline, color = "blue"))+
  geom_line()+
  theme(axis.ticks.x=element_blank(),
        axis.text.x=element_blank(),
        legend.position = "none")+
  ggtitle("Transit")+
  scale_x_date(date_labels = "%d-%m-%Y", breaks = "3 months")+
  theme(axis.text.x = element_text(angle = 50, hjust=1))+
  xlab("")+
  ylab("Transit mobility")

residential <- ggplot(data=halifax, aes(x=as.Date(date), y=residential_percent_change_from_baseline, color = "blue"))+
  geom_line()+
  theme(axis.ticks.x=element_blank(),
        axis.text.x=element_blank(),
        legend.position = "none")+
  ggtitle("Residential")+
  scale_x_date(date_labels = "%d-%m-%Y", breaks = "3 months")+
  theme(axis.text.x = element_text(angle = 50, hjust=1))+
  xlab("")+
  ylab("Residential mobility")

retail <- ggplot(data=halifax, aes(x=as.Date(date), y=retail_and_recreation_percent_change_from_baseline, color = "blue"))+
  geom_line()+
  theme(axis.ticks.x=element_blank(),
        axis.text.x=element_blank(),
        legend.position = "none")+
  ggtitle("Retail and recreation")+
  scale_x_date(date_labels = "%d-%m-%Y", breaks = "3 months")+
  theme(axis.text.x = element_text(angle = 50, hjust=1))+
  xlab("")+
  ylab("Retail and recreation")

parks <- ggplot(data=halifax, aes(x=as.Date(date), y=parks_percent_change_from_baseline, color = "blue"))+
  geom_line()+
  theme(axis.ticks.x=element_blank(),
        axis.text.x=element_blank(),
        legend.position = "none",
        panel.grid.major.x = element_blank())+
  ggtitle("Parks")+
  scale_x_date(date_labels = "%d-%m-%Y", breaks = "3 months")+
  theme(axis.text.x = element_text(angle = 50, hjust=1))+
  xlab("")+
  ylab("Parks")

workplace <- ggplot(data=halifax, aes(x=as.Date(date), y=workplaces_percent_change_from_baseline, color = "blue"))+
  geom_line()+
  theme(axis.ticks.x=element_blank(),
        axis.text.x=element_blank(),
        legend.position = "none")+
  ggtitle("Workplace")+
  scale_x_date(date_labels = "%d-%m-%Y", breaks = "3 months")+
  theme(axis.text.x = element_text(angle = 50, hjust=1))+
  xlab("")+
  ylab("Workplace")

ggarrange(grocery_farmacy, transit, residential, retail, parks, workplace)

########################
ns_apple <- read.csv("/Users/gustavosganzerla/Desktop/covid_ns/mobility/nova_scotia_apple.csv", sep = ";")

colnames(ns_apple)
ns_apple$date <- as.Date(ns_apple$date, format="%d/%m/%Y")

driving <- ggplot(data=ns_apple, aes(x=as.Date(date), y=driving, color = "blue"))+
  geom_line()+
  theme(axis.ticks.x=element_blank(),
        axis.text.x=element_blank(),
        legend.position = "none")+
  ggtitle("Driving")+
  scale_x_date(date_labels = "%d-%m-%Y", breaks = "3 months")+
  theme(axis.text.x = element_text(angle = 50, hjust=1))+
  xlab("")+
  ylab("Difference to baseline")

walking <- ggplot(data=ns_apple, aes(x=as.Date(date), y=walking, color = "blue"))+
  geom_line()+
  theme(axis.ticks.x=element_blank(),
        axis.text.x=element_blank(),
        legend.position = "none")+
  ggtitle("Walking")+
  scale_x_date(date_labels = "%d-%m-%Y", breaks = "3 months")+
  theme(axis.text.x = element_text(angle = 50, hjust=1))+
  xlab("")+
  ylab("Difference to baseline")

transit <- ggplot(data=ns_apple, aes(x=as.Date(date), y=transit, color = "blue"))+
  geom_line()+
  theme(axis.ticks.x=element_blank(),
        axis.text.x=element_blank(),
        legend.position = "none")+
  ggtitle("Transit")+
  scale_x_date(date_labels = "%d-%m-%Y", breaks = "3 months")+
  theme(axis.text.x = element_text(angle = 50, hjust=1))+
  xlab("")+
  ylab("Difference to baseline")

ggarrange(driving, walking, transit)

########7-day average on all mobility data

halifax_mobility <- read.csv("/Users/gustavosganzerla/Desktop/covid_ns/mobility/weekly_mobility.csv", sep = ",")

colnames(halifax_mobility)
grocery <- ggplot()+
  geom_area(data = halifax_mobility, aes(x = as.Date(week), y = grocery/7), color = "purple", fill = "#69b3a2")+
  scale_x_date(date_labels = "%d/%m/%Y", breaks = "3 months")+
  theme(axis.text.x = element_text(angle = 50, hjust=1),
        legend.position = "none",
        axis.title.y = element_text(size=8))+
  ylab("Grocery and pharmacy\n change from baseline")+
  xlab("")

retail <- ggplot()+
  geom_area(data = halifax_mobility, aes(x = as.Date(week), y = unlist(retail/7)), color = "purple", fill = "#69b3a2")+
  scale_x_date(date_labels = "%d/%m/%Y", breaks = "3 months")+
  theme(axis.text.x = element_text(angle = 50, hjust=1),
        legend.position = "none",
        axis.title.y = element_text(size=8))+
  ylab("Retail and recreation\n change from baseline")+
  xlab("")


transit <- ggplot()+
  geom_area(data = halifax_mobility, aes(x = as.Date(week), y = unlist(transit/7)), color = "#69b3a2", fill = "blue3")+
  scale_x_date(date_labels = "%d/%m/%Y", breaks = "3 months")+
  theme(axis.text.x = element_text(angle = 50, hjust=1),
        legend.position = "none",
        axis.title.y = element_text(size=8))+
  ylab("Transit change from baseline")+
  xlab("")

driving <- ggplot()+
  geom_area(data = halifax_mobility, aes(x = as.Date(week), y = unlist(driving/7)), color = "#69b3a2", fill = "blue3")+
  scale_x_date(date_labels = "%d/%m/%Y", breaks = "3 months")+
  theme(axis.text.x = element_text(angle = 50, hjust=1),
        legend.position = "none",
        axis.title.y = element_text(size=8))+
  ylab("Driving change from baseline")+
  xlab("")

walking <- ggplot()+
  geom_area(data = halifax_mobility, aes(x = as.Date(week), y = unlist(walking/7)), color = "#69b3a2", fill = "blue3")+
  scale_x_date(date_labels = "%d/%m/%Y", breaks = "3 months")+
  theme(axis.text.x = element_text(angle = 50, hjust=1),
        legend.position = "none",
        axis.title.y = element_text(size=8))+
  ylab("Walking change from baseline")+
  xlab("")

parks <- ggplot()+
  geom_area(data = halifax_mobility, aes(x = as.Date(week), y = unlist(parks/7)), color = "brown4", fill = "darksalmon")+
  scale_x_date(date_labels = "%d/%m/%Y", breaks = "3 months")+
  theme(axis.text.x = element_text(angle = 50, hjust=1),
        legend.position = "none",
        axis.title.y = element_text(size=8))+
  ylab("Parks change from baseline")+
  xlab("")


residential <- ggplot()+
  geom_area(data = halifax_mobility, aes(x = as.Date(week), y = unlist(residential/7)), color = "darkgreen", fill = "coral")+
  scale_x_date(date_labels = "%d/%m/%Y", breaks = "3 months")+
  theme(axis.text.x = element_text(angle = 50, hjust=1),
        legend.position = "none",
        axis.title.y = element_text(size=8))+
  ylab("Residential change from baseline")+
  xlab("")


workplace <- ggplot()+
  geom_area(data = halifax_mobility, aes(x = as.Date(week), y = unlist(workplace/7)), color = "darkgreen", fill = "coral")+
  scale_x_date(date_labels = "%d/%m/%Y", breaks = "3 months")+
  theme(axis.text.x = element_text(angle = 50, hjust=1),
        legend.position = "none",
        axis.title.y = element_text(size=8))+
  ylab("Workplace change from baseline")+
  xlab("")


ggarrange(grocery, retail, workplace, residential, parks, walking, driving, transit, nrow = 2, ncol = 4)
