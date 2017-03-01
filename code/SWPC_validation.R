### Created on December 3, 2015
### @author: smurray
### Working directory:     /home/smurray/workspace/verification
### Basic verification statistics for a probabilistic forecast.
###################
library(verification)

### read in data
DATm1 <- read.table("/Users/sophie/Dropbox/moswoc_paper/data/swpc_logic/m_day1.dat", header = TRUE, sep = ",")
DATm2 <- read.table("/Users/sophie/Dropbox/moswoc_paper/data/swpc_logic/m_day2.dat", header = TRUE, sep = ",")
DATm3 <- read.table("/Users/sophie/Dropbox/moswoc_paper/data/swpc_logic/m_day3.dat", header = TRUE, sep = ",")

DATx1 <- read.table("/Users/sophie/Dropbox/moswoc_paper/data/swpc_logic/x_day1.dat", header = TRUE, sep = ",")
DATx2 <- read.table("/Users/sophie/Dropbox/moswoc_paper/data/swpc_logic/x_day2.dat", header = TRUE, sep = ",")
DATx3 <- read.table("/Users/sophie/Dropbox/moswoc_paper/data/swpc_logic/x_day3.dat", header = TRUE, sep = ",")



MODm1 <- verify(DATm1$obs, DATm1$pred, frcst.type = "prob", obs.type = "binary")
summary(MODm1)
MODm2 <- verify(DATm2$obs, DATm2$pred, frcst.type = "prob", obs.type = "binary")
summary(MODm2)
MODm3 <- verify(DATm3$obs, DATm3$pred, frcst.type = "prob", obs.type = "binary")
summary(MODm3)

MODx1 <- verify(DATx1$obs, DATx1$pred, frcst.type = "prob", obs.type = "binary")
summary(MODx1)
MODx2 <- verify(DATx2$obs, DATx2$pred, frcst.type = "prob", obs.type = "binary")
summary(MODx2)
MODx3 <- verify(DATx3$obs, DATx3$pred, frcst.type = "prob", obs.type = "binary")
summary(MODx3)


#### plotting 

png('m_day1_swpc_roc.png', width = 5.25, height = 4.25, units = "in", res = 200)
roc.plot(MODm1, main = 'M day 1 ROC plot', binormal = TRUE, plot = "both") #CI = TRUE, n.boot = 100
dev.off()
png('m_day2_swpc_roc.png', width = 5.25, height = 4.25, units = "in", res = 200)
roc.plot(MODm2, main = 'M day 2 ROC plot', binormal = TRUE, plot = "both")
dev.off()
png('m_day3_swpc_roc.png', width = 5.25, height = 4.25, units = "in", res = 200)
roc.plot(MODm3, main = 'M day 3 ROC plot', binormal = TRUE, plot = "both") 
dev.off()

m1area<-roc.area(DATm1$obs, DATm1$pred)
m1area$A
m1area$n.total
m1area$n.events
m1area$n.noevents
m2area<-roc.area(DATm2$obs, DATm2$pred)
m2area$A
m2area$n.total
m2area$n.events
m2area$n.noevents
m3area<-roc.area(DATm3$obs, DATm3$pred)
m3area$A
m3area$n.total
m3area$n.events
m3area$n.noevents
#AA$roc.vol #another method

png('m_day1_swpc_reliability.png', width = 5.25, height = 4.25, units = "in", res = 200)
reliability.plot(MODm1, titl = 'M day 1 reliability diagram')
dev.off()
png('m_day2_swpc_reliability.png', width = 5.25, height = 4.25, units = "in", res = 200)
reliability.plot(MODm2, titl = 'M day 2 reliability diagram')
dev.off()
png('m_day3_swpc_reliability.png', width = 5.25, height = 4.25, units = "in", res = 200)
reliability.plot(MODm3, titl = 'M day 3 reliability diagram')
dev.off()


png('x_day1_swpc_roc.png', width = 5.25, height = 4.25, units = "in", res = 200)
roc.plot(MODx1, main = 'X day 1 ROC plot', binormal = TRUE, plot = "both") #CI = TRUE, n.boot = 100
dev.off()
png('x_day2_swpc_roc.png', width = 5.25, height = 4.25, units = "in", res = 200)
roc.plot(MODx2, main = 'X day 2 ROC plot', binormal = TRUE, plot = "both")
dev.off()
png('x_day3_swpc_roc.png', width = 5.25, height = 4.25, units = "in", res = 200)
roc.plot(MODx3, main = 'X day 3 ROC plot', binormal = TRUE, plot = "both") 
dev.off()

x1area<-roc.area(DATx1$obs, DATx1$pred)
x1area$A
x2area<-roc.area(DATx2$obs, DATx2$pred)
x2area$A
x3area<-roc.area(DATx3$obs, DATx3$pred)
x3area$A

png('x_day1_swpc_reliability.png', width = 5.25, height = 4.25, units = "in", res = 200)
reliability.plot(MODx1, titl = 'X day 1 reliability diagram')
dev.off()
png('x_day2_swpc_reliability.png', width = 5.25, height = 4.25, units = "in", res = 200)
reliability.plot(MODx2, titl = 'X day 2 reliability diagram')
dev.off()
png('x_day3_swpc_reliability.png', width = 5.25, height = 4.25, units = "in", res = 200)
reliability.plot(MODx3, titl = 'X day 3 reliability diagram')
dev.off()

