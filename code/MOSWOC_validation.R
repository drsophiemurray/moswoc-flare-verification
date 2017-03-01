### Created on December 3, 2015
### @author: smurray
### Working directory:     /home/smurray/workspace/verification
### Basic verification statistics for a probabilistic forecast.
###################
library(verification)

### read in data
DATm1 <- read.table("/Users/sophie/Dropbox/moswoc_paper/data/new_total_logic/m_day1.dat", header = TRUE, sep = ",")
DATm2 <- read.table("/Users/sophie/Dropbox/moswoc_paper/data/new_total_logic/m_day2.dat", header = TRUE, sep = ",")
DATm3 <- read.table("/Users/sophie/Dropbox/moswoc_paper/data/new_total_logic/m_day3.dat", header = TRUE, sep = ",")
DATm4 <- read.table("/Users/sophie/Dropbox/moswoc_paper/data/new_total_logic/m_day4.dat", header = TRUE, sep = ",")

DATx1 <- read.table("/Users/sophie/Dropbox/moswoc_paper/data/new_total_logic/x_day1.dat", header = TRUE, sep = ",")
DATx2 <- read.table("/Users/sophie/Dropbox/moswoc_paper/data/new_total_logic/x_day2.dat", header = TRUE, sep = ",")
DATx3 <- read.table("/Users/sophie/Dropbox/moswoc_paper/data/new_total_logic/x_day3.dat", header = TRUE, sep = ",")
DATx4 <- read.table("/Users/sophie/Dropbox/moswoc_paper/data/new_total_logic/x_day4.dat", header = TRUE, sep = ",")

DATmraw <- read.table("/Users/sophie/Dropbox/moswoc_paper/data/new_srs_raw_logic/m_day1.dat", header = TRUE, sep = ",")
DATmiss <- read.table("/Users/sophie/Dropbox/moswoc_paper/data/new_srs_issued_logic/m_day1.dat", header = TRUE, sep = ",")
DATxraw <- read.table("/Users/sophie/Dropbox/moswoc_paper/data/new_srs_raw_logic/x_day1.dat", header = TRUE, sep = ",")
DATxiss <- read.table("/Users/sophie/Dropbox/moswoc_paper/data/new_srs_issued_logic/x_day1.dat", header = TRUE, sep = ",") 



MODm1 <- verify(DATm1$obs, DATm1$pred, frcst.type = "prob", obs.type = "binary")
summary(MODm1)
MODm2 <- verify(DATm2$obs, DATm2$pred, frcst.type = "prob", obs.type = "binary")
summary(MODm2)
MODm3 <- verify(DATm3$obs, DATm3$pred, frcst.type = "prob", obs.type = "binary")
summary(MODm3)
MODm4 <- verify(DATm4$obs, DATm4$pred, frcst.type = "prob", obs.type = "binary")
summary(MODm4)

MODx1 <- verify(DATx1$obs, DATx1$pred, frcst.type = "prob", obs.type = "binary")
summary(MODx1)
MODx2 <- verify(DATx2$obs, DATx2$pred, frcst.type = "prob", obs.type = "binary")
summary(MODx2)
MODx3 <- verify(DATx3$obs, DATx3$pred, frcst.type = "prob", obs.type = "binary")
summary(MODx3)
MODx4 <- verify(DATx4$obs, DATx4$pred, frcst.type = "prob", obs.type = "binary")
summary(MODx4)

MODmraw <- verify(DATmraw$obs, DATmraw$pred, frcst.type = "prob", obs.type = "binary")
summary(MODmraw)
MODmiss <- verify(DATmiss$obs, DATmiss$pred, frcst.type = "prob", obs.type = "binary")
summary(MODmiss)
MODxraw <- verify(DATxraw$obs, DATxraw$pred, frcst.type = "prob", obs.type = "binary")
summary(MODxraw)
MODxiss <- verify(DATxiss$obs, DATxiss$pred, frcst.type = "prob", obs.type = "binary")
summary(MODxiss)

#### plotting 
png('m_day1_roc_corrected.png', width = 5.25, height = 5.25, units = "in", res = 200)
MODm1_roc <- roc.plot(MODm1, lwd = 2, plot="emp",thresholds=seq(0,1,0.1),
         CI = FALSE, main = 'M day 1 ROC plot')
lines.roc(MODm1, col = "black", lwd = 2, type = "b")
dev.off()


png('m_day1_roc_new.png', width = 5.25, height = 5.25, units = "in", res = 200)
roc.plot(MODm1, lwd = 2, CI = FALSE, main = 'M day 1 ROC plot',plot="null")
lines.roc(MODm1, col = "black", lwd = 2, type = "b")
dev.off()
png('m_day2_roc_new.png', width = 5.25, height = 5.25, units = "in", res = 200)
roc.plot(MODm2, lwd = 2, CI = FALSE, main = 'M day 2 ROC plot',plot="null")
lines.roc(MODm2, col = "black", lwd = 2, type = "b")
dev.off()
png('m_day3_roc_new.png', width = 5.25, height = 5.25, units = "in", res = 200)
roc.plot(MODm3, lwd = 2, CI = FALSE, main = 'M day 3 ROC plot',plot="null")
lines.roc(MODm3, col = "black", lwd = 2, type = "b")
dev.off()
png('m_day4_roc_new.png', width = 5.25, height = 5.25, units = "in", res = 200)
roc.plot(MODm4, lwd = 2, CI = FALSE, main = 'M day 4 ROC plot',plot="null")
lines.roc(MODm4, col = "black", lwd = 2, type = "b")
dev.off()
png('m_raw_roc_new.png', width = 5.25, height = 5.25, units = "in", res = 200)
roc.plot(MODmraw, lwd = 2, CI = FALSE, main = 'M raw ROC plot',plot="null")
lines.roc(MODmraw, col = "black", lwd = 2, type = "b")
dev.off()
png('m_iss_roc_new.png', width = 5.25, height = 5.25, units = "in", res = 200)
roc.plot(MODmiss, lwd = 2, CI = FALSE, main = 'M issued ROC plot',plot="null")
lines.roc(MODmiss, col = "black", lwd = 2, type = "b")
dev.off()


png('m_day1_roc.png', width = 5.25, height = 4.25, units = "in", res = 200)
roc.plot(MODm1, main = 'M day 1 ROC plot', binormal = TRUE, plot = "both") #CI = TRUE, n.boot = 100
dev.off()
png('m_day2_roc.png', width = 5.25, height = 4.25, units = "in", res = 200)
roc.plot(MODm2, main = 'M day 2 ROC plot', binormal = TRUE, plot = "both")
dev.off()
png('m_day3_roc.png', width = 5.25, height = 4.25, units = "in", res = 200)
roc.plot(MODm3, main = 'M day 3 ROC plot', binormal = TRUE, plot = "both") 
dev.off()
png('m_day4_roc.png', width = 5.25, height = 4.25, units = "in", res = 200)
roc.plot(MODm4, main = 'M day 4 ROC plot', binormal = TRUE, plot = "both")
dev.off()
png('m_raw_roc.png', width = 5.25, height = 4.25, units = "in", res = 200)
roc.plot(MODmraw, main = 'M raw ROC plot', binormal = TRUE, plot = "both")
dev.off()
png('m_iss_roc.png', width = 5.25, height = 4.25, units = "in", res = 200)
roc.plot(MODmiss, main = 'M issued ROC plot', binormal = TRUE, plot = "both")
dev.off()

m1area<-roc.area(DATm1$obs, DATm1$pred)
m1area$A
m1area$n.total
m1area$n.events
m1area$n.noevents
m2area<-roc.area(DATm2$obs, DATm2$pred)
m2area$A
m3area<-roc.area(DATm3$obs, DATm3$pred)
m3area$A
m4area<-roc.area(DATm4$obs, DATm4$pred)
m4area$A
mrawarea<-roc.area(DATmraw$obs, DATmraw$pred)
mrawarea$A
missarea<-roc.area(DATmiss$obs, DATmiss$pred)
missarea$A
#AA$roc.vol #another method

png('m_day1_reliability.png', width = 5.25, height = 4.25, units = "in", res = 200)
reliability.plot(MODm1, titl = 'M day 1 reliability diagram')
dev.off()
png('m_day2_reliability.png', width = 5.25, height = 4.25, units = "in", res = 200)
reliability.plot(MODm2, titl = 'M day 2 reliability diagram')
dev.off()
png('m_day3_reliability.png', width = 5.25, height = 4.25, units = "in", res = 200)
reliability.plot(MODm3, titl = 'M day 3 reliability diagram')
dev.off()
png('m_day4_reliability.png', width = 5.25, height = 4.25, units = "in", res = 200)
reliability.plot(MODm4, titl = 'M day 4 reliability diagram')
dev.off()
png('m_raw_reliability.png', width = 5.25, height = 4.25, units = "in", res = 200)
reliability.plot(MODmraw, titl = 'M raw reliability diagram')
dev.off()
png('m_iss_reliability.png', width = 5.25, height = 4.25, units = "in", res = 200)
reliability.plot(MODmiss, titl = 'M issued reliability diagram')
dev.off()


png('m_day1_attribute.png', width = 5.25, height = 4.25, units = "in", res = 200)
attribute(MODm1, CI=FALSE, freq=FALSE, titl = 'M day 1 attribute diagram', plot="null")
lines.attrib(MODm1, col = "black",type='b')
dev.off()
png('m_day2_attribute.png', width = 5.25, height = 4.25, units = "in", res = 200)
attribute(MODm2, CI=FALSE, freq=FALSE, titl = 'M day 2 attribute diagram')
lines.attrib(MODm2, col = "black",type='b')
dev.off()
png('m_day3_attribute.png', width = 5.25, height = 4.25, units = "in", res = 200)
attribute(MODm3, CI=FALSE, freq=FALSE, titl = 'M day 3 attribute diagram')
lines.attrib(MODm3, col = "black",type='b')
dev.off()
png('m_day4_attribute.png', width = 5.25, height = 4.25, units = "in", res = 200)
attribute(MODm4, CI=FALSE, freq=FALSE, titl = 'M day 4 attribute diagram')
lines.attrib(MODm4, col = "black",type='b')
dev.off()
png('m_raw_attribute.png', width = 5.25, height = 4.25, units = "in", res = 200)
attribute(MODmraw, CI=FALSE, freq=FALSE, titl = 'M raw attribute diagram')
lines.attrib(MODmraw, col = "black",type='b')
dev.off()
png('m_iss_attribute.png', width = 5.25, height = 4.25, units = "in", res = 200)
attribute(MODmiss, CI=FALSE, freq=FALSE, titl = 'M issued attribute diagram')
lines.attrib(MODmiss, col = "black",type='b')
dev.off()

png('x_day1_roc.png', width = 5.25, height = 4.25, units = "in", res = 200)
roc.plot(MODx1, main = 'X day 1 ROC plot', binormal = TRUE, plot = "both") #CI = TRUE, n.boot = 100
dev.off()
png('x_day2_roc.png', width = 5.25, height = 4.25, units = "in", res = 200)
roc.plot(MODx2, main = 'X day 2 ROC plot', binormal = TRUE, plot = "both")
dev.off()
png('x_day3_roc.png', width = 5.25, height = 4.25, units = "in", res = 200)
roc.plot(MODx3, main = 'X day 3 ROC plot', binormal = TRUE, plot = "both") 
dev.off()
png('x_day4_roc.png', width = 5.25, height = 4.25, units = "in", res = 200)
roc.plot(MODx4, main = 'X day 4 ROC plot', binormal = TRUE, plot = "both")
dev.off()
png('x_raw_roc.png', width = 5.25, height = 4.25, units = "in", res = 200)
roc.plot(MODxraw, main = 'X raw ROC plot', binormal = TRUE, plot = "both")
dev.off()
png('x_iss_roc.png', width = 5.25, height = 4.25, units = "in", res = 200)
roc.plot(MODxiss, main = 'X issued ROC plot', binormal = TRUE, plot = "both")
dev.off()

x1area<-roc.area(DATx1$obs, DATx1$pred)
x1area$A
x2area<-roc.area(DATx2$obs, DATx2$pred)
x2area$A
x3area<-roc.area(DATx3$obs, DATx3$pred)
x3area$A
x4area<-roc.area(DATx4$obs, DATx4$pred)
x4area$A
xrawarea<-roc.area(DATxraw$obs, DATxraw$pred)
xrawarea$A
xissarea<-roc.area(DATxraw$obs, DATxiss$pred)
xissarea$A

png('x_day1_reliability.png', width = 5.25, height = 4.25, units = "in", res = 200)
reliability.plot(MODx1, titl = 'X day 1 reliability diagram')
dev.off()
png('x_day2_reliability.png', width = 5.25, height = 4.25, units = "in", res = 200)
reliability.plot(MODx2, titl = 'X day 2 reliability diagram')
dev.off()
png('x_day3_reliability.png', width = 5.25, height = 4.25, units = "in", res = 200)
reliability.plot(MODx3, titl = 'X day 3 reliability diagram')
dev.off()
png('x_day4_reliability.png', width = 5.25, height = 4.25, units = "in", res = 200)
reliability.plot(MODx4, titl = 'X day 4 reliability diagram')
dev.off()
png('x_raw_reliability.png', width = 5.25, height = 4.25, units = "in", res = 200)
reliability.plot(MODxraw, titl = 'X raw reliability diagram')
dev.off()
png('x_iss_reliability.png', width = 5.25, height = 4.25, units = "in", res = 200)
reliability.plot(MODxiss, titl = 'X issued reliability diagram')
dev.off()


#CORRECTED PLOTS

png('m_day1-4_roc_corrected.png', width = 5.25, height = 5.25, units = "in", res = 200)
roc.plot(MODm1, binormal = FALSE,thresholds=seq(0,1,0.1),plot="null") #CI = TRUE, n.boot = 100
lines.roc(MODm1, col = "black", lwd = 2, type = "b")
lines.roc(MODm2, col = "dark green", lwd = 2, type = "b")
lines.roc(MODm3, col = "blue", lwd = 2, type = "b")
lines.roc(MODm4, col = "purple", lwd = 2, type = "b")
dev.off()


png('m_raw-iss_roc_corrected.png', width = 5.25, height = 5.25, units = "in", res = 200)
MODmraw_roc <- roc.plot(MODmraw, binormal = FALSE,thresholds=seq(0,1,0.1),plot="null") #CI = TRUE, n.boot = 100
lines.roc(MODmraw, col = "black", lwd = 2, type = "b")
lines.roc(MODmiss, col = "blue", lwd = 2, type = "b")
dev.off()

roc.plot(MODm1, binormal = FALSE,thresholds=seq(0,1,0.1),plot="null") #CI = TRUE, n.boot = 100

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
m4area<-roc.area(DATm4$obs, DATm4$pred)
m4area$A
m4area$n.total
m4area$n.events
m4area$n.noevents
mrawarea<-roc.area(DATmraw$obs, DATmraw$pred)
mrawarea$A
mrawarea$n.total
mrawarea$n.events
mrawarea$n.noevents
missarea<-roc.area(DATmiss$obs, DATmiss$pred)
missarea$A
missarea$n.total
missarea$n.events
missarea$n.noevents


library(pROC)
roc.plot(MODmraw, binormal = FALSE,thresholds=seq(0,1,0.01))
test <- plot.roc(DATmraw$obs, DATmraw$pred, 
                 ci=TRUE,of="thresholds",
                 thresholds="best", print.thres="best")
#0.265 (0.749, 0.794)
roc.plot(MODmiss, binormal = FALSE,thresholds=seq(0,1,0.01))
test <- plot.roc(DATmiss$obs, DATmiss$pred, 
                 ci=TRUE,of="thresholds",
                 thresholds="best", print.thres="best")
#0.175 (0.774, 0.929)
roc.plot(MODm1, binormal = FALSE,thresholds=seq(0,1,0.01))
test <- plot.roc(DATm1$obs, DATm1$pred, 
                 ci=TRUE,of="thresholds",
                 thresholds="best", print.thres="best")
#0.275 (0.636, 0.833)
roc.plot(MODm2, binormal = FALSE,thresholds=seq(0,1,0.01))
test <- plot.roc(DATm2$obs, DATm2$pred, 
                 ci=TRUE,of="thresholds",
                 thresholds="best", print.thres="best")
#0.225 (0.592, 0.846)
roc.plot(MODm3, binormal = FALSE,thresholds=seq(0,1,0.01))
test <- plot.roc(DATm3$obs, DATm3$pred, 
                 ci=TRUE,of="thresholds",
                 thresholds="best", print.thres="best")
#0.225 (0.592, 0.790)
roc.plot(MODm4, binormal = FALSE,thresholds=seq(0,1,0.01))
test <- plot.roc(DATm4$obs, DATm4$pred, 
                 ci=TRUE,of="thresholds",
                 thresholds="best", print.thres="best")
#0.175 (0.492, 0.846)


png('m_day1_reliab_corrected.png', width = 5.25, height = 5.25, units = "in", res = 200)
m1_reliab <- reliability.plot(MODm1, titl = 'M day 1 reliability diagram')
dev.off()
png('m_day2_reliab_corrected.png', width = 5.25, height = 5.25, units = "in", res = 200)
reliability.plot(MODm2, titl = 'M day 2 reliability diagram')
dev.off()
png('m_day3_reliab_corrected.png', width = 5.25, height = 5.25, units = "in", res = 200)
reliability.plot(MODm3, titl = 'M day 3 reliability diagram')
dev.off()
png('m_day4_reliab_corrected.png', width = 5.25, height = 5.25, units = "in", res = 200)
reliability.plot(MODm4, titl = 'M day 4 reliability diagram')
dev.off()
png('m_raw_reliab_corrected.png', width = 5.25, height = 5.25, units = "in", res = 200)
reliability.plot(MODmraw, titl = 'M raw reliability diagram')
dev.off()
png('m_iss_reliab_corrected.png', width = 5.25, height = 5.25, units = "in", res = 200)
reliability.plot(MODmiss, titl = 'M issued reliability diagram')
dev.off()


png('m_raw_attrib_corrected.png', width = 5.25, height = 5.25, units = "in", res = 200)
attribute(MODmraw, CI=TRUE,freq=FALSE)
dev.off()
png('m_iss_attrib_corrected.png', width = 5.25, height = 5.25, units = "in", res = 200)
attribute(MODmiss, CI=TRUE,freq=FALSE)
dev.off()
png('m_day1_attrib_corrected.png', width = 5.25, height = 5.25, units = "in", res = 200)
attribute(MODm1, CI=TRUE,freq=FALSE)
dev.off()
png('m_day2_attrib_corrected.png', width = 5.25, height = 5.25, units = "in", res = 200)
attribute(MODm2, CI=TRUE,freq=FALSE)
dev.off()
png('m_day3_attrib_corrected.png', width = 5.25, height = 5.25, units = "in", res = 200)
attribute(MODm3, CI=TRUE,freq=FALSE)
dev.off()
png('m_day4_attrib_corrected.png', width = 5.25, height = 5.25, units = "in", res = 200)
attribute(MODm4, CI=TRUE,freq=FALSE)
dev.off()
