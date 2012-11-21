#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
include Makefile

# Environment
SHELL=cmd.exe
# Adding MPLAB X bin directory to path
PATH:=C:/Program Files (x86)/Microchip/MPLABX/mplab_ide/mplab_ide/modules/../../bin/:$(PATH)
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=cof
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/ILCv4.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/ILCv4.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/src/BeatDetection.p1 ${OBJECTDIR}/src/DSP.p1 ${OBJECTDIR}/src/frontend_WS2801.p1 ${OBJECTDIR}/src/frame.p1 ${OBJECTDIR}/src/modes.p1 ${OBJECTDIR}/src/main.p1 ${OBJECTDIR}/src/RC4.p1 ${OBJECTDIR}/src/User_Interface_button.p1 ${OBJECTDIR}/src/fireflies.p1 ${OBJECTDIR}/src/FukaiMori.p1 ${OBJECTDIR}/src/LightEgg.p1 ${OBJECTDIR}/src/SparksFly.p1 ${OBJECTDIR}/src/Sunlight.p1 ${OBJECTDIR}/src/transforms.p1 ${OBJECTDIR}/src/twinklecandle.p1 ${OBJECTDIR}/src/aqua.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/src/BeatDetection.p1.d ${OBJECTDIR}/src/DSP.p1.d ${OBJECTDIR}/src/frontend_WS2801.p1.d ${OBJECTDIR}/src/frame.p1.d ${OBJECTDIR}/src/modes.p1.d ${OBJECTDIR}/src/main.p1.d ${OBJECTDIR}/src/RC4.p1.d ${OBJECTDIR}/src/User_Interface_button.p1.d ${OBJECTDIR}/src/fireflies.p1.d ${OBJECTDIR}/src/FukaiMori.p1.d ${OBJECTDIR}/src/LightEgg.p1.d ${OBJECTDIR}/src/SparksFly.p1.d ${OBJECTDIR}/src/Sunlight.p1.d ${OBJECTDIR}/src/transforms.p1.d ${OBJECTDIR}/src/twinklecandle.p1.d ${OBJECTDIR}/src/aqua.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/src/BeatDetection.p1 ${OBJECTDIR}/src/DSP.p1 ${OBJECTDIR}/src/frontend_WS2801.p1 ${OBJECTDIR}/src/frame.p1 ${OBJECTDIR}/src/modes.p1 ${OBJECTDIR}/src/main.p1 ${OBJECTDIR}/src/RC4.p1 ${OBJECTDIR}/src/User_Interface_button.p1 ${OBJECTDIR}/src/fireflies.p1 ${OBJECTDIR}/src/FukaiMori.p1 ${OBJECTDIR}/src/LightEgg.p1 ${OBJECTDIR}/src/SparksFly.p1 ${OBJECTDIR}/src/Sunlight.p1 ${OBJECTDIR}/src/transforms.p1 ${OBJECTDIR}/src/twinklecandle.p1 ${OBJECTDIR}/src/aqua.p1


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

# Path to java used to run MPLAB X when this makefile was created
MP_JAVA_PATH="C:\Program Files (x86)\Java\jre6/bin/"
OS_CURRENT="$(shell uname -s)"
############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
MP_CC="C:\Program Files (x86)\HI-TECH Software\PICC-18\9.80\bin\picc18.exe"
# MP_BC is not defined
MP_AS="C:\Program Files (x86)\HI-TECH Software\PICC-18\9.80\bin\picc18.exe"
MP_LD="C:\Program Files (x86)\HI-TECH Software\PICC-18\9.80\bin\picc18.exe"
MP_AR="C:\Program Files (x86)\HI-TECH Software\PICC-18\9.80\bin\picc18.exe"
DEP_GEN=${MP_JAVA_PATH}java -jar "C:/Program Files (x86)/Microchip/MPLABX/mplab_ide/mplab_ide/modules/../../bin/extractobjectdependencies.jar" 
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps
MP_CC_DIR="C:\Program Files (x86)\HI-TECH Software\PICC-18\9.80\bin"
# MP_BC_DIR is not defined
MP_AS_DIR="C:\Program Files (x86)\HI-TECH Software\PICC-18\9.80\bin"
MP_LD_DIR="C:\Program Files (x86)\HI-TECH Software\PICC-18\9.80\bin"
MP_AR_DIR="C:\Program Files (x86)\HI-TECH Software\PICC-18\9.80\bin"
# MP_BC_DIR is not defined

.build-conf:  ${BUILD_SUBPROJECTS}
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/ILCv4.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F25K22
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/src/BeatDetection.p1: src/BeatDetection.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/BeatDetection.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/BeatDetection.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/BeatDetection.p1: > ${OBJECTDIR}/src/BeatDetection.p1.d
	@cat ${OBJECTDIR}/src/BeatDetection.dep >> ${OBJECTDIR}/src/BeatDetection.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/BeatDetection.p1.d" $(SILENT) -ht
	
${OBJECTDIR}/src/DSP.p1: src/DSP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/DSP.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/DSP.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/DSP.p1: > ${OBJECTDIR}/src/DSP.p1.d
	@cat ${OBJECTDIR}/src/DSP.dep >> ${OBJECTDIR}/src/DSP.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/DSP.p1.d" $(SILENT) -ht
	
${OBJECTDIR}/src/frontend_WS2801.p1: src/frontend_WS2801.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/frontend_WS2801.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/frontend_WS2801.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/frontend_WS2801.p1: > ${OBJECTDIR}/src/frontend_WS2801.p1.d
	@cat ${OBJECTDIR}/src/frontend_WS2801.dep >> ${OBJECTDIR}/src/frontend_WS2801.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/frontend_WS2801.p1.d" $(SILENT) -ht
	
${OBJECTDIR}/src/frame.p1: src/frame.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/frame.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/frame.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/frame.p1: > ${OBJECTDIR}/src/frame.p1.d
	@cat ${OBJECTDIR}/src/frame.dep >> ${OBJECTDIR}/src/frame.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/frame.p1.d" $(SILENT) -ht
	
${OBJECTDIR}/src/modes.p1: src/modes.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/modes.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/modes.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/modes.p1: > ${OBJECTDIR}/src/modes.p1.d
	@cat ${OBJECTDIR}/src/modes.dep >> ${OBJECTDIR}/src/modes.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/modes.p1.d" $(SILENT) -ht
	
${OBJECTDIR}/src/main.p1: src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/main.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/main.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/main.p1: > ${OBJECTDIR}/src/main.p1.d
	@cat ${OBJECTDIR}/src/main.dep >> ${OBJECTDIR}/src/main.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/main.p1.d" $(SILENT) -ht
	
${OBJECTDIR}/src/RC4.p1: src/RC4.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/RC4.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/RC4.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/RC4.p1: > ${OBJECTDIR}/src/RC4.p1.d
	@cat ${OBJECTDIR}/src/RC4.dep >> ${OBJECTDIR}/src/RC4.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/RC4.p1.d" $(SILENT) -ht
	
${OBJECTDIR}/src/User_Interface_button.p1: src/User_Interface_button.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/User_Interface_button.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/User_Interface_button.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/User_Interface_button.p1: > ${OBJECTDIR}/src/User_Interface_button.p1.d
	@cat ${OBJECTDIR}/src/User_Interface_button.dep >> ${OBJECTDIR}/src/User_Interface_button.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/User_Interface_button.p1.d" $(SILENT) -ht
	
${OBJECTDIR}/src/fireflies.p1: src/fireflies.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/fireflies.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/fireflies.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/fireflies.p1: > ${OBJECTDIR}/src/fireflies.p1.d
	@cat ${OBJECTDIR}/src/fireflies.dep >> ${OBJECTDIR}/src/fireflies.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/fireflies.p1.d" $(SILENT) -ht
	
${OBJECTDIR}/src/FukaiMori.p1: src/FukaiMori.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/FukaiMori.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/FukaiMori.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/FukaiMori.p1: > ${OBJECTDIR}/src/FukaiMori.p1.d
	@cat ${OBJECTDIR}/src/FukaiMori.dep >> ${OBJECTDIR}/src/FukaiMori.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/FukaiMori.p1.d" $(SILENT) -ht
	
${OBJECTDIR}/src/LightEgg.p1: src/LightEgg.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/LightEgg.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/LightEgg.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/LightEgg.p1: > ${OBJECTDIR}/src/LightEgg.p1.d
	@cat ${OBJECTDIR}/src/LightEgg.dep >> ${OBJECTDIR}/src/LightEgg.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/LightEgg.p1.d" $(SILENT) -ht
	
${OBJECTDIR}/src/SparksFly.p1: src/SparksFly.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/SparksFly.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/SparksFly.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/SparksFly.p1: > ${OBJECTDIR}/src/SparksFly.p1.d
	@cat ${OBJECTDIR}/src/SparksFly.dep >> ${OBJECTDIR}/src/SparksFly.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/SparksFly.p1.d" $(SILENT) -ht
	
${OBJECTDIR}/src/Sunlight.p1: src/Sunlight.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/Sunlight.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/Sunlight.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/Sunlight.p1: > ${OBJECTDIR}/src/Sunlight.p1.d
	@cat ${OBJECTDIR}/src/Sunlight.dep >> ${OBJECTDIR}/src/Sunlight.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/Sunlight.p1.d" $(SILENT) -ht
	
${OBJECTDIR}/src/transforms.p1: src/transforms.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/transforms.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/transforms.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/transforms.p1: > ${OBJECTDIR}/src/transforms.p1.d
	@cat ${OBJECTDIR}/src/transforms.dep >> ${OBJECTDIR}/src/transforms.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/transforms.p1.d" $(SILENT) -ht
	
${OBJECTDIR}/src/twinklecandle.p1: src/twinklecandle.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/twinklecandle.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/twinklecandle.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/twinklecandle.p1: > ${OBJECTDIR}/src/twinklecandle.p1.d
	@cat ${OBJECTDIR}/src/twinklecandle.dep >> ${OBJECTDIR}/src/twinklecandle.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/twinklecandle.p1.d" $(SILENT) -ht
	
${OBJECTDIR}/src/aqua.p1: src/aqua.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/aqua.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/aqua.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/aqua.p1: > ${OBJECTDIR}/src/aqua.p1.d
	@cat ${OBJECTDIR}/src/aqua.dep >> ${OBJECTDIR}/src/aqua.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/aqua.p1.d" $(SILENT) -ht
	
else
${OBJECTDIR}/src/BeatDetection.p1: src/BeatDetection.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/BeatDetection.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/BeatDetection.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/BeatDetection.p1: > ${OBJECTDIR}/src/BeatDetection.p1.d
	@cat ${OBJECTDIR}/src/BeatDetection.dep >> ${OBJECTDIR}/src/BeatDetection.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/BeatDetection.p1.d" $(SILENT) -ht
	
${OBJECTDIR}/src/DSP.p1: src/DSP.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/DSP.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/DSP.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/DSP.p1: > ${OBJECTDIR}/src/DSP.p1.d
	@cat ${OBJECTDIR}/src/DSP.dep >> ${OBJECTDIR}/src/DSP.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/DSP.p1.d" $(SILENT) -ht
	
${OBJECTDIR}/src/frontend_WS2801.p1: src/frontend_WS2801.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/frontend_WS2801.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/frontend_WS2801.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/frontend_WS2801.p1: > ${OBJECTDIR}/src/frontend_WS2801.p1.d
	@cat ${OBJECTDIR}/src/frontend_WS2801.dep >> ${OBJECTDIR}/src/frontend_WS2801.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/frontend_WS2801.p1.d" $(SILENT) -ht
	
${OBJECTDIR}/src/frame.p1: src/frame.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/frame.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/frame.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/frame.p1: > ${OBJECTDIR}/src/frame.p1.d
	@cat ${OBJECTDIR}/src/frame.dep >> ${OBJECTDIR}/src/frame.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/frame.p1.d" $(SILENT) -ht
	
${OBJECTDIR}/src/modes.p1: src/modes.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/modes.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/modes.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/modes.p1: > ${OBJECTDIR}/src/modes.p1.d
	@cat ${OBJECTDIR}/src/modes.dep >> ${OBJECTDIR}/src/modes.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/modes.p1.d" $(SILENT) -ht
	
${OBJECTDIR}/src/main.p1: src/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/main.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/main.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/main.p1: > ${OBJECTDIR}/src/main.p1.d
	@cat ${OBJECTDIR}/src/main.dep >> ${OBJECTDIR}/src/main.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/main.p1.d" $(SILENT) -ht
	
${OBJECTDIR}/src/RC4.p1: src/RC4.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/RC4.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/RC4.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/RC4.p1: > ${OBJECTDIR}/src/RC4.p1.d
	@cat ${OBJECTDIR}/src/RC4.dep >> ${OBJECTDIR}/src/RC4.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/RC4.p1.d" $(SILENT) -ht
	
${OBJECTDIR}/src/User_Interface_button.p1: src/User_Interface_button.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/User_Interface_button.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/User_Interface_button.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/User_Interface_button.p1: > ${OBJECTDIR}/src/User_Interface_button.p1.d
	@cat ${OBJECTDIR}/src/User_Interface_button.dep >> ${OBJECTDIR}/src/User_Interface_button.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/User_Interface_button.p1.d" $(SILENT) -ht
	
${OBJECTDIR}/src/fireflies.p1: src/fireflies.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/fireflies.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/fireflies.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/fireflies.p1: > ${OBJECTDIR}/src/fireflies.p1.d
	@cat ${OBJECTDIR}/src/fireflies.dep >> ${OBJECTDIR}/src/fireflies.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/fireflies.p1.d" $(SILENT) -ht
	
${OBJECTDIR}/src/FukaiMori.p1: src/FukaiMori.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/FukaiMori.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/FukaiMori.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/FukaiMori.p1: > ${OBJECTDIR}/src/FukaiMori.p1.d
	@cat ${OBJECTDIR}/src/FukaiMori.dep >> ${OBJECTDIR}/src/FukaiMori.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/FukaiMori.p1.d" $(SILENT) -ht
	
${OBJECTDIR}/src/LightEgg.p1: src/LightEgg.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/LightEgg.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/LightEgg.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/LightEgg.p1: > ${OBJECTDIR}/src/LightEgg.p1.d
	@cat ${OBJECTDIR}/src/LightEgg.dep >> ${OBJECTDIR}/src/LightEgg.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/LightEgg.p1.d" $(SILENT) -ht
	
${OBJECTDIR}/src/SparksFly.p1: src/SparksFly.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/SparksFly.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/SparksFly.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/SparksFly.p1: > ${OBJECTDIR}/src/SparksFly.p1.d
	@cat ${OBJECTDIR}/src/SparksFly.dep >> ${OBJECTDIR}/src/SparksFly.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/SparksFly.p1.d" $(SILENT) -ht
	
${OBJECTDIR}/src/Sunlight.p1: src/Sunlight.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/Sunlight.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/Sunlight.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/Sunlight.p1: > ${OBJECTDIR}/src/Sunlight.p1.d
	@cat ${OBJECTDIR}/src/Sunlight.dep >> ${OBJECTDIR}/src/Sunlight.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/Sunlight.p1.d" $(SILENT) -ht
	
${OBJECTDIR}/src/transforms.p1: src/transforms.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/transforms.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/transforms.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/transforms.p1: > ${OBJECTDIR}/src/transforms.p1.d
	@cat ${OBJECTDIR}/src/transforms.dep >> ${OBJECTDIR}/src/transforms.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/transforms.p1.d" $(SILENT) -ht
	
${OBJECTDIR}/src/twinklecandle.p1: src/twinklecandle.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/twinklecandle.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/twinklecandle.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/twinklecandle.p1: > ${OBJECTDIR}/src/twinklecandle.p1.d
	@cat ${OBJECTDIR}/src/twinklecandle.dep >> ${OBJECTDIR}/src/twinklecandle.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/twinklecandle.p1.d" $(SILENT) -ht
	
${OBJECTDIR}/src/aqua.p1: src/aqua.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/src 
	${MP_CC} --pass1 src/aqua.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@${MP_CC} --scandep  src/aqua.c $(MP_EXTRA_CC_PRE) -q --chip=$(MP_PROCESSOR_OPTION) -P  --outdir=${OBJECTDIR}/src -N31 --warn=0 --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 --cp=16 -Blarge --double=24  --mode=lite -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s"  
	@echo ${OBJECTDIR}/src/aqua.p1: > ${OBJECTDIR}/src/aqua.p1.d
	@cat ${OBJECTDIR}/src/aqua.dep >> ${OBJECTDIR}/src/aqua.p1.d
	@${FIXDEPS} "${OBJECTDIR}/src/aqua.p1.d" $(SILENT) -ht
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/ILCv4.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE) -odist/${CND_CONF}/${IMAGE_TYPE}/ILCv4.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  -mdist/${CND_CONF}/${IMAGE_TYPE}/ILCv4.X.${IMAGE_TYPE}.map --summary=default,-psect,-class,+mem,-hex --chip=$(MP_PROCESSOR_OPTION) -P --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -D__DEBUG --debugger=realice -N31 --warn=0 --cp=16 -Blarge --double=24  --mode=lite  --output=default,-inhx032 -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s" ${OBJECTFILES_QUOTED_IF_SPACED}    
	${RM} dist/${CND_CONF}/${IMAGE_TYPE}/ILCv4.X.${IMAGE_TYPE}.hex
else
dist/${CND_CONF}/${IMAGE_TYPE}/ILCv4.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE) -odist/${CND_CONF}/${IMAGE_TYPE}/ILCv4.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  -mdist/${CND_CONF}/${IMAGE_TYPE}/ILCv4.X.${IMAGE_TYPE}.map --summary=default,-psect,-class,+mem,-hex --chip=$(MP_PROCESSOR_OPTION) -P --runtime=default,+clear,+init,-keep,-download,+stackwarn,-config,+clib,-plib --opt=default,+asm,-asmfile,-speed,+space,9 -N31 --warn=0 --cp=16 -Blarge --double=24  --mode=lite  --output=default,-inhx032 -g --asmlist "--errformat=%%f:%%l: error: %%s" "--msgformat=%%f:%%l: advisory: %%s" "--warnformat=%%f:%%l warning: %%s" ${OBJECTFILES_QUOTED_IF_SPACED}    
endif


# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf:
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
