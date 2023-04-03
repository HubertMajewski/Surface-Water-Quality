-- nitrate view -- 

create or replace view nitrate_view as 
select 
date(nt."startDateTime") as "date"
,nt."domainID" 
,nt."siteID" 
,nt."horizontalPosition" 
,nt."verticalPosition" 
,avg(nt."surfWaterNitrateMean") as "surfWaterNitrateMean"
,avg(nt."surfWaterNitrateVariance") as "surfWaterNitrateVariance"
from nitrate.main_table nt
group by date
,nt."domainID" 
,nt."siteID" 
,nt."horizontalPosition" 
,nt."verticalPosition";


select * from nitrate_view nv; 


-- temperature view -- 

create or replace view temp_view as 
select 
date(t."startDateTime") as "date"
,t."domainID" 
,t."siteID" 
,t."horizontalPosition" 
,t."verticalPosition" 
,avg(t."surfWaterTempMean") as "surfWaterTempMean"
,avg(t."surfWaterTempVariance") as "surfWaterTempVariance"
from temperature.main_table t
group by date
,t."domainID" 
,t."siteID" 
,t."horizontalPosition" 
,t."verticalPosition";

select * from temp_view t;


-- water quality view -- 

create or replace view waterquality_view as 
select 
date(m."startDateTime") as "date"
,m."domainID" 
,m."siteID" 
,m."horizontalPosition" 
,m."verticalPosition" 
,avg(m."specificConductance") as "specificConductance"
,avg(m."dissolvedOxygen") as "dissolvedOxygen"
,avg(m."seaLevelDissolvedOxygenSat") as "seaLevelDissolvedOxygenSat"
,avg(m."localDissolvedOxygenSat") as "localDissolvedOxygenSat"
,avg(m."pH") as "pH"
,avg(m."chlorophyll") as "chlorophyll"
,avg(m."chlaRelativeFluorescence") as "chlaRelativeFluorescence"
,avg(m."turbidity") as "turbidity"
,avg(m."fDOM") as "fDOM"
,avg(m."spectrumCount") as "spectrumCount"
from water_quality.maintable m
group by date
,m."domainID" 
,m."siteID" 
,m."horizontalPosition" 
,m."verticalPosition";

select * from waterquality_view w 



-- countmicrobe view -- 

create or replace view masterCellCount as 
select 
ac."domainID"
,ac."siteID"
,ac."collectDate"
,ac."cellCountSampleID" as "acSampleID"
,ac."rawMicrobialAbundance"
,fcc."cellCountSampleID" as "fccSampleID"
,fcc."cellCountSampleVolume"
,fcc."cellCountPreservantVolume"  
,((ac."rawMicrobialAbundance" * (fcc."cellCountSampleVolume" + fcc."cellCountPreservantVolume") / fcc."cellCountSampleVolume")) as "microbialAbundancePerMl"
from count_microbe.amc_fieldCellCounts fcc 
full join count_microbe.amc_cellcounts ac on fcc."cellCountSampleID" = ac."cellCountSampleID";

create or replace view countmicrobe_view as 
select 
date(m."collectDate") as date,
m."domainID",
m."siteID",
avg(m."microbialAbundancePerMl") as "microbialAbundancePerMl"
from mastercellcount m 
group by date
,m."domainID" 
,m."siteID" 
order by 1;

select * from countmicrobe_view

-- dissolved gases view --

create or replace view dissolvedgases_view as 
select
date(se."collectDate") as date
,se."domainID" 
,se."siteID" 
,avg(se."concentrationCH4") as  "concentrationCH4"
,avg(se."concentrationCO2") as "concentrationCO2"
,avg(se."concentrationN2O") as "concentrationN2O"
,avg(se."volumeGasAnalyzed") as "volumeGasAnalyzed"
,avg(se."gasStandardAccuracy") as "gasStandardAccuracy"
from dissolved_gases.sdg_externallabdata se
group by date
,se."domainID" 
,se."siteID";

select * from dissolvedgases_view

