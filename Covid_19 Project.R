print(getwd())
setwd("C:\Users\Jayanta Roy\Downloads\R_Projects")




confirmed_cases_worldwide=read.xlsx("C:/Users/Jayanta Roy/Downloads/R_Projects/COVID_cases.xlsx",sheetIndex=1)

summary(COVID_cases)
str(COVID_cases)

      
install.packages('xlsx')
any(grepl("xlsx",installed.packages()))
library("readxl")  


install.packages('dplyr')
install.packages('ggplot2')
install.packages('Shiny')

library(ggplot2)
library(dplyr)
library(xlsx)

CCW<-COVID_cases
str(CCW)

ggplot(data=CCW,aes(x=date, y=cum_cases))+ 
  geom_line(col="red") + ylab("cumulative_confirmed_cases")


confirmed_cases_china_vs_world <- read_excel("COVID_cases.xlsx", 
                            sheet = "Sheet2")

str(confirmed_cases_china_vs_world)
summary(confirmed_cases_china_vs_world)

plt_cum_confirmed_cases_china_vs_world<-ggplot(data=confirmed_cases_china_vs_world,aes(x=date, y=cum_cases))+
  geom_line(aes(x=date, y=cum_cases, group= is_china, color= is_china)) + ggtitle("Covid_19 confirmed cases in China created by Jayanta Roy")
  ylab("cumulative_confirmed_cases")
  plt_cum_confirmed_cases_china_vs_world

PLT_CCCH_VS_W<-plt_cum_confirmed_cases_china_vs_world

PLT_CCCH_VS_W

jpeg(file="china_vs_world.jpeg")
PLT_CCCH_VS_W
dev.off()


install.packages('magrittr')
library(magrittr)
library(dplyr)
library(ggplot2)

who_events<-tribble(
  ~ date, ~ event,
  "2020-01-30", "Global health\nemergency declared",
  "2020-03-11", "Pandemic\ndeclared",
  "2020-02-13",  "China  reporting\nchange"
  
)%>%
  
  mutate(date= as.Date(date))

who_events


PLT_CCCH_VS_W +
  geom_vline(aes(xintercept=date),data=who_events,linetype="dashed")+
geom_text(aes(x=date, label=event), data=who_events, y = 100000)

PLT_CCCH_VS_W

china_after_feb15<-confirmed_cases_china_vs_world %>%
  filter(is_china=="China", date >= "2020-02-15")

china_after_feb15

ggplot(data=china_after_feb15, aes(x= date, y=cum_cases)) +
   geom_line() +
   geom_smooth(method = "lm", se=FALSE) +ggtitle("Covid_19 in China created by Jayanta Roy")
   ylab("Cumulative_confirmed_cases")
       
   
   
not_china<-confirmed_cases_china_vs_world %>%
  filter(is_china=="Not China")

not_china

plt_not_china_trend_line<-ggplot(data=not_china, aes(x=date, y=cum_cases)) +
  geom_line()+
  geom_smooth(method = "lm", se=FALSE) +ggtitle("Covid_19 Not in China created by Jayanta Roy")
ylab("Cumulative_confirmed_cases")

plt_not_china_trend_line

plt_not_china_trend_line +
  scale_y_log10()

library(readxl)
confirmed_cases_by_country <- read_excel("COVID_cases.xlsx", 
                                         sheet = "Sheet3")
confirmed_cases_by_country

X<-confirmed_cases_by_country$cum_cases
X

df<-confirmed_cases_by_country[order(-X),]
df
df[1:25,]

top_country_by_total_cases<-df[1:25,]      
top_country_by_total_cases


barplot(top_country_by_total_cases$cum_cases, name.arg=top_country_by_total_cases$cum_cases, names.arg=top_country_by_total_cases$country,col='green',ggtitle=('created by Jayanta Roy'))
barplot(top_country_by_total_cases$cum_cases, name.arg=top_country_by_total_cases$cum_cases, names.arg=top_country_by_total_cases$date, col='blue',ggtitle=('created by Jayanta roy'))


ggplot(data=top_country_by_total_cases,aes(x=date, y=cum_cases))+ ggtitle=("created by Jayanta Roy")
geom_line()

ggplot(data=top_country_by_total_cases,aes(x=date, y=cum_cases))+
  geom_line(aes(x=date, y=cum_cases,group = country, color= country))+ ggtitle("created by Jayantar Roy")
  ylab("Cumulative_confirmed_cases")

ggplot(data=top_country_by_total_cases,aes(x=date,y=cum_cases))+geom_area()

x1<-top_country_by_total_cases$date
y1<-top_country_by_total_cases$cum_cases
z1<-top_country_by_total_cases$country
qplot(x1,y1)
qplot(x1,y1, geom=c("point","line"))
qplot(x1,y1, geom=c("point","line"),col="red")

ggplot(data=top_country_by_total_cases, aes(x=date,y=cum_cases)) +

geom_point(aes(x=date,y=cum_cases, color=country))
ylab("top_country_by_total_cases")





