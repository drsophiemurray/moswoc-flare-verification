### Created on December 3, 2015
### @author: smurray
### Working directory:     /home/smurray/workspace/verification
### Basic verification statistics for a probabilistic forecast.
### Edited for Github to simply show an example of one of the data sets
###################
library(verification)

### read in data
DATm1 <- read.table("/Users/sophie/Dropbox/moswoc_paper/data/IFF_logic/m_day1.dat", header = TRUE, sep = ",")

### verification
MODm1 <- verify(DATm1$obs, DATm1$pred, frcst.type="prob", obs.type="binary")
summary(MODm1)

#### ways to plot roc curves
MODm1_roc <- roc.plot(MODm1, lwd=2, plot="emp",
                        thresholds=seq(0,1,0.1), CI=FALSE, binormal=FALSE)

m1area<-roc.area(DATm1$obs, DATm1$pred)
m1area$A
m1area$n.total
m1area$n.events
m1area$n.noevents

library(pROC)
MODm1_proc <- plot.roc(DATmraw$obs, DATmraw$pred, 
                        CI=TRUE, print.thres.="best", print.thres.best.method="youden")

#### plotting reliability or attribute diagrams
reliability.plot(MODm1)
attribute(MODm1, CI=TRUE, freq=FALSE)