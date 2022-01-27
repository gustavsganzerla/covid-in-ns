#####statistical tests for NS paper
covid_ns <- read.csv("/Users/gustavosganzerla/Desktop/covid_ns/dailies/Jan17/COVID19Tracker.ca Data - NS.csv", sep = ",")
#test/case
colnames(covid_ns)
test_case<- ggplot(data=covid_ns, aes(x=data...total_tests, y=data...total_cases, group=1, color = "cases"))+
  geom_point()+
  ylab("Cases")+
  xlab("Tests")+
  theme(axis.text.x = element_text(angle = 90, hjust=1), legend.position = "none")+
  #stat_cor(method="pearson", label.y.npc="top", label.x.npc = "left", col = "black")+
  geom_smooth(method = "lm", col = "gray", size = 1)+
  annotate("text", x=220000, y = 25000, label = "R(before Omicron) = 0.97")+
  annotate("text", x=200000, y = 28000, label = "R(after Omicron) = 0.85")+
  geom_hline(yintercept=8720)+
  annotate("text", x=1600000, y=8300, label = "Omicron")+
  ggtitle("Nova Scotia")


  

cases_om <- sum(covid_ns$data...total_cases[687:723])
tests_om <- sum(covid_ns$data...total_tests[687:723])

tests_om/cases_om


colnames(covid_ns)

model <- lm(covid_ns$data...total_cases~covid_ns$data...total_tests)
summary(model)

pre_omicron <- covid_ns[1:689,]
post_omicron <- covid_ns[690:723,]

plot(post_omicron$data...change_cases~post_omicron$data...change_tests)
plot(pre_omicron$data...total_cases~pre_omicron$data...total_tests)

cor(method = "pearson", covid_ns$data...total_cases, covid_ns$data...total_tests)
cor(method = "pearson", pre_omicron$data...total_cases, pre_omicron$data...total_tests)
cor(method = "pearson", post_omicron$data...total_cases, post_omicron$data...total_tests)
y = -46860.881+177.944*x

lm_eqn <- function(df){
  m <- lm(y ~ x, df);
  eq <- substitute(italic(y) == a + b %.% italic(x)*","~~italic(r)^2~"="~r2, 
                   list(a = format(unname(coef(m)[1]), digits = 2),
                        b = format(unname(coef(m)[2]), digits = 2),
                        r2 = format(summary(m)$r.squared, digits = 3)))
  as.character(as.expression(eq));
}