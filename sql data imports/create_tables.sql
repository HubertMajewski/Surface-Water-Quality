-- create nitrate table --

create schema if not exists nitrate;

create table if not exists nitrate.main_table (
"domainID" text
,"siteID" text
,"horizontalPosition" numeric
,"verticalPosition" numeric
,"startDateTime" timestamp
,"endDateTime" timestamp
,"surfWaterNitrateMean" numeric
,"surfWaterNitrateMinimum" numeric
,"surfWaterNitrateMaximum" numeric
,"surfWaterNitrateVariance" numeric
,"surfWaterNitrateNumPts" numeric
,"surfWaterNitrateExpUncert" numeric
,"surfWaterNitrateStdErMean" numeric
,"rangeFailQM" numeric
,"rangePassQM" numeric
,"rangeNAQM" numeric
,"persistenceFailQM" numeric
,"persistencePassQM" numeric
,"persistenceNAQM" numeric
,"stepFailQM" numeric
,"stepPassQM" numeric
,"stepNAQM" numeric
,"nullFailQM" numeric
,"nullPassQM" numeric
,"nullNAQM" numeric
,"gapFailQM" numeric
,"gapPassQM" numeric
,"gapNAQM" numeric
,"spikeFailQM" numeric
,"spikePassQM" numeric
,"spikeNAQM" numeric
,"nitrateInternalHumidityPassQM" numeric
,"nitrateInternalHumidityFailQM" numeric
,"nitrateInternalHumidityNAQM" numeric
,"nitrateLightDarkSpectralRatioPassQM" numeric
,"nitrateLightDarkSpectralRatioFailQM" numeric
,"nitrateLightDarkSpectralRatioNAQM" numeric
,"validCalFailQM" numeric
,"validCalPassQM" numeric
,"validCalNAQM" numeric
,"alphaQM" numeric
,"betaQM" numeric
,"finalQF" numeric
,"finalQFSciRvw" numeric
,"publicationDate" text
,"release" text
);
 

-- copy nitrate table data -- 
copy nitrate.main_table ("domainID"
,"siteID"
,"horizontalPosition"
,"verticalPosition"
,"startDateTime"
,"endDateTime"
,"surfWaterNitrateMean"
,"surfWaterNitrateMinimum"
,"surfWaterNitrateMaximum"
,"surfWaterNitrateVariance"
,"surfWaterNitrateNumPts"
,"surfWaterNitrateExpUncert"
,"surfWaterNitrateStdErMean"
,"rangeFailQM"
,"rangePassQM"
,"rangeNAQM"
,"persistenceFailQM"
,"persistencePassQM"
,"persistenceNAQM"
,"stepFailQM"
,"stepPassQM"
,"stepNAQM"
,"nullFailQM"
,"nullPassQM"
,"nullNAQM"
,"gapFailQM"
,"gapPassQM"
,"gapNAQM"
,"spikeFailQM"
,"spikePassQM"
,"spikeNAQM"
,"nitrateInternalHumidityPassQM"
,"nitrateInternalHumidityFailQM"
,"nitrateInternalHumidityNAQM"
,"nitrateLightDarkSpectralRatioPassQM"
,"nitrateLightDarkSpectralRatioFailQM"
,"nitrateLightDarkSpectralRatioNAQM"
,"validCalFailQM"
,"validCalPassQM"
,"validCalNAQM"
,"alphaQM"
,"betaQM"
,"finalQF"
,"finalQFSciRvw"
,"publicationDate"
,"release")
from 
'/project/data_stuff/nitrate/stackedFiles/NSW_15_minute.csv'
delimiter ',' csv header;



-- create tempature tables -- 
create schema if not exists temperature;

create table if not exists temperature.main_table(
"domainID" text
,"siteID" text
,"horizontalPosition" numeric
,"verticalPosition" numeric
,"startDateTime" timestamp
,"endDateTime" timestamp
,"surfWaterTempMean" numeric
,"surfWaterTempMinimum" numeric
,"surfWaterTempMaximum" numeric
,"surfWaterTempVariance" numeric
,"surfWaterTempNumPts" numeric
,"surfWaterTempExpUncert" numeric
,"surfWaterTempStdErMean" numeric
,"rangeFailQM" numeric
,"rangePassQM" numeric
,"rangeNAQM" numeric
,"persistenceFailQM" numeric
,"persistencePassQM" numeric
,"persistenceNAQM" numeric
,"stepFailQM" numeric
,"stepPassQM" numeric
,"stepNAQM" numeric
,"nullFailQM" numeric
,"nullPassQM" numeric
,"nullNAQM" numeric
,"gapFailQM" numeric
,"gapPassQM" numeric
,"gapNAQM" numeric
,"spikeFailQM" numeric
,"spikePassQM" numeric
,"spikeNAQM" numeric
,"validCalFailQM" numeric
,"validCalPassQM" numeric
,"validCalNAQM" numeric
,"alphaQM" numeric
,"betaQM" numeric
,"finalQF" numeric
,"finalQFSciRvw" numeric
,"publicationDate" text
,"release" text
);


-- copy tempature data -- 
copy temperature.main_table (
"domainID"
,"siteID"
,"horizontalPosition"
,"verticalPosition"
,"startDateTime"
,"endDateTime"
,"surfWaterTempMean"
,"surfWaterTempMinimum"
,"surfWaterTempMaximum"
,"surfWaterTempVariance"
,"surfWaterTempNumPts"
,"surfWaterTempExpUncert"
,"surfWaterTempStdErMean"
,"rangeFailQM"
,"rangePassQM"
,"rangeNAQM"
,"persistenceFailQM"
,"persistencePassQM"
,"persistenceNAQM"
,"stepFailQM"
,"stepPassQM"
,"stepNAQM"
,"nullFailQM"
,"nullPassQM"
,"nullNAQM"
,"gapFailQM"
,"gapPassQM"
,"gapNAQM"
,"spikeFailQM"
,"spikePassQM"
,"spikeNAQM"
,"validCalFailQM"
,"validCalPassQM"
,"validCalNAQM"
,"alphaQM"
,"betaQM"
,"finalQF"
,"finalQFSciRvw"
,"publicationDate"
,"release")
from program
'awk FNR-1 /project/data_stuff/temperature/stackedFiles/TSW_*.csv'
delimiter ',' csv header;

-- create microbe cell counts table --
create schema if not exists count_microbe;

create table if not exists count_microbe.amc_cellCounts(
"uid" text
,"laboratoryName" text
,"domainID" text
,"siteID" text
,"namedLocation" text
,"collectDate" timestamp
,"testedDate" timestamp
,"sampleCondition" text
,"cellCountSampleID" text
,"testProtocolVersion" text
,"cellCountMethod" text
,"filterSize" numeric
,"dilutionFactor" numeric
,"numberOfFieldsAnalyzed" numeric
,"analysisMagnification" numeric
,"rawMicrobialAbundance" numeric
,"enumerationDifference" numeric
,"qaqcStatus" text
,"remarks" text
,"analyzedBy" text
,"qcAnalyzedBy" text
,"reviewedBy" text
,"publicationDate" text
,"release" text
);

-- copy microbe cell counts data --
copy count_microbe.amc_cellCounts(
"uid"
,"laboratoryName"
,"domainID"
,"siteID"
,"namedLocation"
,"collectDate"
,"testedDate"
,"sampleCondition"
,"cellCountSampleID"
,"testProtocolVersion"
,"cellCountMethod"
,"filterSize"
,"dilutionFactor"
,"numberOfFieldsAnalyzed"
,"analysisMagnification"
,"rawMicrobialAbundance"
,"enumerationDifference"
,"qaqcStatus"
,"remarks"
,"analyzedBy"
,"qcAnalyzedBy"
,"reviewedBy"
,"publicationDate"
,"release")
from '/project/data_stuff/count_microbe/stackedFiles/amc_cellCounts.csv'
delimiter ',' csv header;


-- create microbe field cell counts table --
create table if not exists count_microbe.amc_fieldCellCounts(
"uid" text
,"domainID" text
,"siteID" text
,"namedLocation" text
,"collectDate" timestamp
,"parentSampleID" text
,"cellCountSampleCond" text
,"cellCountSampleID" text
,"cellCountSampleVolume" numeric
,"cellCountPreservantVolume" numeric
,"archiveSampleCond" text
,"archiveID" text
,"geneticSampleCond" text
,"geneticSampleID" text
,"publicationDate" text
,"release" text
);

-- copy microbe field cell counts data --
copy  count_microbe.amc_fieldCellCounts(
"uid"
,"domainID"
,"siteID"
,"namedLocation"
,"collectDate"
,"parentSampleID"
,"cellCountSampleCond"
,"cellCountSampleID"
,"cellCountSampleVolume"
,"cellCountPreservantVolume"
,"archiveSampleCond"
,"archiveID"
,"geneticSampleCond"
,"geneticSampleID"
,"publicationDate"
,"release"
)
from '/project/data_stuff/count_microbe/stackedFiles/amc_fieldCellCounts.csv'
delimiter ',' csv header;



-- create water quality table --
create schema if not exists water_quality;

create table if not exists  water_quality.maintable (
"domainID" text
,"siteID" text
,"horizontalPosition" numeric
,"verticalPosition" numeric
,"startDateTime" timestamp
,"endDateTime" timestamp
,"sensorDepth" numeric
,"sensorDepthExpUncert" numeric
,"sensorDepthRangeQF" numeric
,"sensorDepthNullQF" numeric
,"sensorDepthGapQF" numeric
,"sensorDepthValidCalQF" numeric
,"sensorDepthSuspectCalQF" numeric
,"sensorDepthPersistQF" numeric
,"sensorDepthAlphaQF" numeric
,"sensorDepthBetaQF" numeric
,"sensorDepthFinalQF" numeric
,"sensorDepthFinalQFSciRvw" numeric
,"specificConductance" numeric
,"specificConductanceExpUncert" numeric
,"specificConductanceRangeQF" numeric
,"specificConductanceStepQF" numeric
,"specificConductanceNullQF" numeric
,"specificConductanceGapQF" numeric
,"specificConductanceSpikeQF" numeric
,"specificConductanceValidCalQF" numeric
,"specificCondSuspectCalQF" numeric
,"specificConductancePersistQF" numeric
,"specificConductanceAlphaQF" numeric
,"specificConductanceBetaQF" numeric
,"specificCondFinalQF" numeric
,"specificCondFinalQFSciRvw" numeric
,"dissolvedOxygen" numeric
,"dissolvedOxygenExpUncert" numeric
,"dissolvedOxygenRangeQF" numeric
,"dissolvedOxygenStepQF" numeric
,"dissolvedOxygenNullQF" numeric
,"dissolvedOxygenGapQF" numeric
,"dissolvedOxygenSpikeQF" numeric
,"dissolvedOxygenValidCalQF" numeric
,"dissolvedOxygenSuspectCalQF" numeric
,"dissolvedOxygenPersistenceQF" numeric
,"dissolvedOxygenAlphaQF" numeric
,"dissolvedOxygenBetaQF" numeric
,"dissolvedOxygenFinalQF" numeric
,"dissolvedOxygenFinalQFSciRvw" numeric 
,"seaLevelDissolvedOxygenSat" numeric
,"seaLevelDOSatExpUncert" numeric
,"seaLevelDOSatRangeQF" numeric
,"seaLevelDOSatStepQF" numeric
,"seaLevelDOSatNullQF" numeric
,"seaLevelDOSatGapQF" numeric
,"seaLevelDOSatSpikeQF" numeric
,"seaLevelDOSatValidCalQF" numeric
,"seaLevelDOSatSuspectCalQF" numeric
,"seaLevelDOSatPersistQF" numeric
,"seaLevelDOSatAlphaQF" numeric
,"seaLevelDOSatBetaQF" numeric
,"seaLevelDOSatFinalQF" numeric
,"seaLevelDOSatFinalQFSciRvw" numeric
,"localDissolvedOxygenSat" numeric
,"localDOSatExpUncert" numeric
,"localDOSatRangeQF" numeric
,"localDOSatStepQF" numeric
,"localDOSatNullQF" numeric
,"localDOSatGapQF" numeric
,"localDOSatSpikeQF" numeric
,"localDOSatValidCalQF" numeric
,"localDOSatSuspectCalQF" numeric
,"localDOSatPersistQF" numeric
,"localDOSatAlphaQF" numeric
,"localDOSatBetaQF" numeric
,"localDOSatFinalQF" numeric
,"localDOSatFinalQFSciRvw" numeric
,"pH" numeric
,"pHExpUncert" numeric
,"pHRangeQF" numeric
,"pHStepQF" numeric
,"pHNullQF" numeric
,"pHGapQF" numeric
,"pHSpikeQF" numeric
,"pHValidCalQF" numeric
,"pHSuspectCalQF" numeric
,"pHPersistenceQF" numeric
,"pHAlphaQF" numeric
,"pHBetaQF" numeric
,"pHFinalQF" numeric
,"pHFinalQFSciRvw" numeric
,"chlorophyll" numeric
,"chlorophyllExpUncert" numeric
,"chlorophyllRangeQF" numeric
,"chlorophyllStepQF" numeric
,"chlorophyllNullQF" numeric
,"chlorophyllGapQF" numeric
,"chlorophyllSpikeQF" numeric
,"chlorophyllValidCalQF" numeric
,"chlorophyllSuspectCalQF" numeric
,"chlorophyllPersistenceQF" numeric
,"chlorophyllAlphaQF" numeric
,"chlorophyllBetaQF" numeric
,"chlorophyllFinalQF" numeric
,"chlorophyllFinalQFSciRvw" numeric
,"chlaRelativeFluorescence" numeric
,"chlaRelFluoroExpUncert" numeric
,"chlaRelFluoroRangeQF" numeric
,"chlaRelFluoroStepQF" numeric
,"chlaRelFluoroNullQF" numeric
,"chlaRelFluoroGapQF" numeric
,"chlaRelFluoroSpikeQF" numeric
,"chlaRelFluoroValidCalQF" numeric
,"chlaRelFluoroSuspectCalQF" numeric
,"chlaRelFluoroPersistenceQF" numeric
,"chlaRelFluoroAlphaQF" numeric
,"chlaRelFluoroBetaQF" numeric
,"chlaRelFluoroFinalQF" numeric
,"chlaRelFluoroFinalQFSciRvw" numeric
,"turbidity" numeric
,"turbidityExpUncert" numeric
,"turbidityRangeQF" numeric
,"turbidityStepQF" numeric 
,"turbidityNullQF" numeric
,"turbidityGapQF" numeric
,"turbiditySpikeQF" numeric
,"turbidityValidCalQF" numeric
,"turbiditySuspectCalQF" numeric
,"turbidityPersistenceQF" numeric
,"turbidityAlphaQF" numeric
,"turbidityBetaQF" numeric
,"turbidityFinalQF" numeric
,"turbidityFinalQFSciRvw" numeric
,"fDOM" numeric
,"rawCalibratedfDOM" numeric
,"fDOMExpUncert" numeric
,"fDOMRangeQF" numeric
,"fDOMStepQF" numeric
,"fDOMNullQF" numeric
,"fDOMGapQF" numeric 
,"fDOMSpikeQF" numeric
,"fDOMValidCalQF" numeric
,"fDOMSuspectCalQF" numeric
,"fDOMPersistenceQF" numeric
,"fDOMAlphaQF" numeric
,"fDOMBetaQF" numeric
,"fDOMTempQF" numeric
,"fDOMAbsQF" numeric
,"fDOMFinalQF" numeric
,"fDOMFinalQFSciRvw" numeric
,"buoyNAFlag" numeric
,"spectrumCount" numeric
,"publicationDate" text
,"release" text
);

-- copy water quality data --
copy water_quality.maintable(
"domainID" 
,"siteID" 
,"horizontalPosition" 
,"verticalPosition" 
,"startDateTime" 
,"endDateTime" 
,"sensorDepth" 
,"sensorDepthExpUncert" 
,"sensorDepthRangeQF" 
,"sensorDepthNullQF" 
,"sensorDepthGapQF" 
,"sensorDepthValidCalQF" 
,"sensorDepthSuspectCalQF" 
,"sensorDepthPersistQF" 
,"sensorDepthAlphaQF" 
,"sensorDepthBetaQF" 
,"sensorDepthFinalQF" 
,"sensorDepthFinalQFSciRvw" 
,"specificConductance" 
,"specificConductanceExpUncert" 
,"specificConductanceRangeQF" 
,"specificConductanceStepQF" 
,"specificConductanceNullQF" 
,"specificConductanceGapQF" 
,"specificConductanceSpikeQF" 
,"specificConductanceValidCalQF" 
,"specificCondSuspectCalQF" 
,"specificConductancePersistQF" 
,"specificConductanceAlphaQF" 
,"specificConductanceBetaQF" 
,"specificCondFinalQF" 
,"specificCondFinalQFSciRvw" 
,"dissolvedOxygen" 
,"dissolvedOxygenExpUncert" 
,"dissolvedOxygenRangeQF" 
,"dissolvedOxygenStepQF" 
,"dissolvedOxygenNullQF" 
,"dissolvedOxygenGapQF" 
,"dissolvedOxygenSpikeQF" 
,"dissolvedOxygenValidCalQF" 
,"dissolvedOxygenSuspectCalQF" 
,"dissolvedOxygenPersistenceQF" 
,"dissolvedOxygenAlphaQF" 
,"dissolvedOxygenBetaQF" 
,"dissolvedOxygenFinalQF" 
,"dissolvedOxygenFinalQFSciRvw"  
,"seaLevelDissolvedOxygenSat" 
,"seaLevelDOSatExpUncert" 
,"seaLevelDOSatRangeQF" 
,"seaLevelDOSatStepQF" 
,"seaLevelDOSatNullQF" 
,"seaLevelDOSatGapQF" 
,"seaLevelDOSatSpikeQF" 
,"seaLevelDOSatValidCalQF" 
,"seaLevelDOSatSuspectCalQF" 
,"seaLevelDOSatPersistQF" 
,"seaLevelDOSatAlphaQF" 
,"seaLevelDOSatBetaQF" 
,"seaLevelDOSatFinalQF" 
,"seaLevelDOSatFinalQFSciRvw" 
,"localDissolvedOxygenSat" 
,"localDOSatExpUncert" 
,"localDOSatRangeQF" 
,"localDOSatStepQF" 
,"localDOSatNullQF" 
,"localDOSatGapQF" 
,"localDOSatSpikeQF" 
,"localDOSatValidCalQF" 
,"localDOSatSuspectCalQF" 
,"localDOSatPersistQF" 
,"localDOSatAlphaQF" 
,"localDOSatBetaQF" 
,"localDOSatFinalQF" 
,"localDOSatFinalQFSciRvw" 
,"pH" 
,"pHExpUncert" 
,"pHRangeQF" 
,"pHStepQF" 
,"pHNullQF" 
,"pHGapQF" 
,"pHSpikeQF" 
,"pHValidCalQF" 
,"pHSuspectCalQF" 
,"pHPersistenceQF" 
,"pHAlphaQF" 
,"pHBetaQF" 
,"pHFinalQF" 
,"pHFinalQFSciRvw" 
,"chlorophyll" 
,"chlorophyllExpUncert" 
,"chlorophyllRangeQF" 
,"chlorophyllStepQF" 
,"chlorophyllNullQF" 
,"chlorophyllGapQF" 
,"chlorophyllSpikeQF" 
,"chlorophyllValidCalQF" 
,"chlorophyllSuspectCalQF" 
,"chlorophyllPersistenceQF" 
,"chlorophyllAlphaQF" 
,"chlorophyllBetaQF" 
,"chlorophyllFinalQF" 
,"chlorophyllFinalQFSciRvw" 
,"chlaRelativeFluorescence" 
,"chlaRelFluoroExpUncert" 
,"chlaRelFluoroRangeQF" 
,"chlaRelFluoroStepQF" 
,"chlaRelFluoroNullQF" 
,"chlaRelFluoroGapQF" 
,"chlaRelFluoroSpikeQF" 
,"chlaRelFluoroValidCalQF" 
,"chlaRelFluoroSuspectCalQF" 
,"chlaRelFluoroPersistenceQF" 
,"chlaRelFluoroAlphaQF" 
,"chlaRelFluoroBetaQF" 
,"chlaRelFluoroFinalQF" 
,"chlaRelFluoroFinalQFSciRvw" 
,"turbidity" 
,"turbidityExpUncert" 
,"turbidityRangeQF" 
,"turbidityStepQF"  
,"turbidityNullQF" 
,"turbidityGapQF" 
,"turbiditySpikeQF" 
,"turbidityValidCalQF" 
,"turbiditySuspectCalQF" 
,"turbidityPersistenceQF" 
,"turbidityAlphaQF" 
,"turbidityBetaQF" 
,"turbidityFinalQF" 
,"turbidityFinalQFSciRvw" 
,"fDOM" 
,"rawCalibratedfDOM" 
,"fDOMExpUncert" 
,"fDOMRangeQF" 
,"fDOMStepQF" 
,"fDOMNullQF" 
,"fDOMGapQF"  
,"fDOMSpikeQF" 
,"fDOMValidCalQF" 
,"fDOMSuspectCalQF" 
,"fDOMPersistenceQF" 
,"fDOMAlphaQF" 
,"fDOMBetaQF" 
,"fDOMTempQF" 
,"fDOMAbsQF" 
,"fDOMFinalQF" 
,"fDOMFinalQFSciRvw" 
,"buoyNAFlag" 
,"spectrumCount" 
,"publicationDate" 
,"release" 
)
from program
'awk FNR-1 /project/data_stuff/water_quality/waq_instantaneous*.csv'
delimiter ',' csv header;


-- create dissolved gases table --
create schema if not exists dissolved_gases;

create table if not exists dissolved_gases.sdg_externalLabData(
"uid" text
,"domainID" text
,"siteID" text
,"namedLocation" text
,"collectDate" timestamp
,"analysisDate" date
,"internalLabID" numeric
,"internalSampleName" text
,"internalLabFileName" text
,"sampleID" text
,"sampleCode" text
,"concentrationCH4" numeric
,"runDetectionLimitCH4" numeric
,"precisionCH4" numeric
,"concentrationCO2" numeric
,"runDetectionLimitCO2" numeric
,"precisionCO2" numeric
,"concentrationN2O" numeric
,"runDetectionLimitN2O" numeric
,"precisionN2O" numeric
,"sampleCondition" text
,"laboratoryName" text
,"analyzedBy" text
,"externalRemarks" text
,"volumeGasAnalyzed" numeric
,"gasStandardAccuracy" numeric
,"CH4CheckStandardPercentDev" numeric
,"CH4CheckStandardQF" numeric
,"CO2CheckStandardPercentDev" numeric
,"CO2CheckStandardQF" numeric
,"N2OCheckStandardPercentDev" numeric
,"N2OCheckStandardQF" numeric
,"publicationDate" text
,"release" text
);

-- copy dissolved gases data -- 
copy dissolved_gases.sdg_externalLabData(
"uid"
,"domainID"
,"siteID"
,"namedLocation"
,"collectDate"
,"analysisDate"
,"internalLabID"
,"internalSampleName"
,"internalLabFileName"
,"sampleID"
,"sampleCode"
,"concentrationCH4"
,"runDetectionLimitCH4"
,"precisionCH4"
,"concentrationCO2"
,"runDetectionLimitCO2"
,"precisionCO2"
,"concentrationN2O"
,"runDetectionLimitN2O"
,"precisionN2O"
,"sampleCondition"
,"laboratoryName"
,"analyzedBy"
,"externalRemarks"
,"volumeGasAnalyzed"
,"gasStandardAccuracy"
,"CH4CheckStandardPercentDev"
,"CH4CheckStandardQF"
,"CO2CheckStandardPercentDev"
,"CO2CheckStandardQF"
,"N2OCheckStandardPercentDev"
,"N2OCheckStandardQF"
,"publicationDate"
,"release"
)
from
'/project/data_stuff/dissolved_gases/stackedFiles/sdg_externalLabData.csv' 
delimiter ',' csv header;
