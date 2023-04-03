create or replace view nwt2018 as 
select 
n."date" as ndate	
,n."domainID" as ndomain
,n."siteID" as nsiteID 
,n."horizontalPosition" as nhorizontalPosition 
,n."verticalPosition" as nverticalPosition
,n."surfWaterNitrateMean" as nsurfWaterNitrateMean
,n."surfWaterNitrateVariance" as nsurfWaterNitrateVariance 
,p."date"  as pdate
,p."domainID" as pdomainID
,p."siteID" as psiteID
,p."horizontalPosition" as phorizontalPosition 
,p."verticalPosition" as pverticalPosition
,p."specificConductance" as pspecificConductance
,p."dissolvedOxygen" as pdissolvedOxygen
,p."seaLevelDissolvedOxygenSat" as pseaLevelDissolvedOxygenSat
,p."localDissolvedOxygenSat" as plocalDissolvedOxygenSat
,p."pH" as ppH
,p."chlorophyll" as pchlorophyll
,p."chlaRelativeFluorescence" as pchlaRelativeFluorescence
,p."turbidity" as pturbidity
,p."fDOM" as pfDOM
,p."spectrumCount" as pspectrumCount
,t."date" as tdate
,t."domainID" as tdomainID
,t."siteID"  as tsiteID
,t."horizontalPosition" as thorizontalPosition
,t."verticalPosition" as tverticalPosition
,t."surfWaterTempMean" as tsurfWaterTempMean
,t."surfWaterTempVariance" as tsurfWaterTempVariance
from 
nitrate2018 n 
full join waterquality2018 p 
on (n."date" = p."date") and ((n."siteID" = p."siteID") and (n."horizontalPosition" = p."horizontalPosition") and (n."verticalPosition" = p."verticalPosition"))
full join temp2018 t 
on (t."date" = p."date") and ((t."siteID" = p."siteID") and (t."horizontalPosition" = p."horizontalPosition") and (t."verticalPosition" = p."verticalPosition"));

create or replace view nwt2019 as 
select 
n."date" as ndate	
,n."domainID" as ndomain
,n."siteID" as nsiteID 
,n."horizontalPosition" as nhorizontalPosition 
,n."verticalPosition" as nverticalPosition
,n."surfWaterNitrateMean" as nsurfWaterNitrateMean
,n."surfWaterNitrateVariance" as nsurfWaterNitrateVariance 
,p."date"  as pdate
,p."domainID" as pdomainID
,p."siteID" as psiteID
,p."horizontalPosition" as phorizontalPosition 
,p."verticalPosition" as pverticalPosition
,p."specificConductance" as pspecificConductance
,p."dissolvedOxygen" as pdissolvedOxygen
,p."seaLevelDissolvedOxygenSat" as pseaLevelDissolvedOxygenSat
,p."localDissolvedOxygenSat" as plocalDissolvedOxygenSat
,p."pH" as ppH
,p."chlorophyll" as pchlorophyll
,p."chlaRelativeFluorescence" as pchlaRelativeFluorescence
,p."turbidity" as pturbidity
,p."fDOM" as pfDOM
,p."spectrumCount" as pspectrumCount
,t."date" as tdate
,t."domainID" as tdomainID
,t."siteID"  as tsiteID
,t."horizontalPosition" as thorizontalPosition
,t."verticalPosition" as tverticalPosition
,t."surfWaterTempMean" as tsurfWaterTempMean
,t."surfWaterTempVariance" as tsurfWaterTempVariance
from 
nitrate2019 n 
full join waterquality2019 p 
on (n."date" = p."date") and ((n."siteID" = p."siteID") and (n."horizontalPosition" = p."horizontalPosition") and (n."verticalPosition" = p."verticalPosition"))
full join temp2019 t 
on (t."date" = p."date") and ((t."siteID" = p."siteID") and (t."horizontalPosition" = p."horizontalPosition") and (t."verticalPosition" = p."verticalPosition"));

create or replace view nwt2020 as 
select 
n."date" as ndate	
,n."domainID" as ndomain
,n."siteID" as nsiteID 
,n."horizontalPosition" as nhorizontalPosition 
,n."verticalPosition" as nverticalPosition
,n."surfWaterNitrateMean" as nsurfWaterNitrateMean
,n."surfWaterNitrateVariance" as nsurfWaterNitrateVariance 
,p."date"  as pdate
,p."domainID" as pdomainID
,p."siteID" as psiteID
,p."horizontalPosition" as phorizontalPosition 
,p."verticalPosition" as pverticalPosition
,p."specificConductance" as pspecificConductance
,p."dissolvedOxygen" as pdissolvedOxygen
,p."seaLevelDissolvedOxygenSat" as pseaLevelDissolvedOxygenSat
,p."localDissolvedOxygenSat" as plocalDissolvedOxygenSat
,p."pH" as ppH
,p."chlorophyll" as pchlorophyll
,p."chlaRelativeFluorescence" as pchlaRelativeFluorescence
,p."turbidity" as pturbidity
,p."fDOM" as pfDOM
,p."spectrumCount" as pspectrumCount
,t."date" as tdate
,t."domainID" as tdomainID
,t."siteID"  as tsiteID
,t."horizontalPosition" as thorizontalPosition
,t."verticalPosition" as tverticalPosition
,t."surfWaterTempMean" as tsurfWaterTempMean
,t."surfWaterTempVariance" as tsurfWaterTempVariance
from 
nitrate2020 n 
full join waterquality2020 p 
on (n."date" = p."date") and ((n."siteID" = p."siteID") and (n."horizontalPosition" = p."horizontalPosition") and (n."verticalPosition" = p."verticalPosition"))
full join temp2020 t 
on (t."date" = p."date") and ((t."siteID" = p."siteID") and (t."horizontalPosition" = p."horizontalPosition") and (t."verticalPosition" = p."verticalPosition"));

create or replace view cdc2018 as 
select 
c."date" as cdate
,c."domainID" as cdomainID
,c."siteID"  as csiteID
,c."laboratoryName" as claboratoryName
,c."analyte" as canalyte
,c."analyteCon" as canalyteCon
,d."date" as ddate
,d."domainID" as ddomainID
,d."siteID" as dsiteID
,d."concentrationCH4" as dconcentrationCH4
,d."concentrationCO2" as dconcentrationCO2
,d."concentrationN2O" as dconcentrationN2O
,d."volumeGasAnalyzed" as dvolumeGasAnalyzed
,d."gasStandardAccuracy" as dgasStandardAccuracy
,c2."date" as c2date
,c2."domainID" as c2domainID
,c2."siteID" as c2SiteID
,c2."microbialAbundancePerMl" as c2microbialAbundancePerMl
from 
chem2018 c 
full join 
dissolvedgases2018 d 
on (c."date" = d."date") and ((c."siteID" = d."siteID"))
full join countmicrobe2018 c2 
on (c2."date" = d."date") and ((c2."siteID" = d."siteID"));

create or replace view cdc2019 as 
select 
c."date" as cdate
,c."domainID" as cdomainID
,c."siteID"  as csiteID
,c."laboratoryName" as claboratoryName
,c."analyte" as canalyte
,c."analyteCon" as canalyteCon
,d."date" as ddate
,d."domainID" as ddomainID
,d."siteID" as dsiteID
,d."concentrationCH4" as dconcentrationCH4
,d."concentrationCO2" as dconcentrationCO2
,d."concentrationN2O" as dconcentrationN2O
,d."volumeGasAnalyzed" as dvolumeGasAnalyzed
,d."gasStandardAccuracy" as dgasStandardAccuracy
,c2."date" as c2date
,c2."domainID" as c2domainID
,c2."siteID" as c2SiteID
,c2."microbialAbundancePerMl" as c2microbialAbundancePerMl
from 
chem2019 c 
full join 
dissolvedgases2019 d 
on (c."date" = d."date") and ((c."siteID" = d."siteID"))
full join countmicrobe2019 c2 
on (c2."date" = d."date") and ((c2."siteID" = d."siteID"));

create or replace view cdc2020 as 
select 
c."date" as cdate
,c."domainID" as cdomainID
,c."siteID"  as csiteID
,c."laboratoryName" as claboratoryName
,c."analyte" as canalyte
,c."analyteCon" as canalyteCon
,d."date" as ddate
,d."domainID" as ddomainID
,d."siteID" as dsiteID
,d."concentrationCH4" as dconcentrationCH4
,d."concentrationCO2" as dconcentrationCO2
,d."concentrationN2O" as dconcentrationN2O
,d."volumeGasAnalyzed" as dvolumeGasAnalyzed
,d."gasStandardAccuracy" as dgasStandardAccuracy
,c2."date" as c2date
,c2."domainID" as c2domainID
,c2."siteID" as c2SiteID
,c2."microbialAbundancePerMl" as c2microbialAbundancePerMl
from 
chem2020 c 
full join 
dissolvedgases2020 d 
on (c."date" = d."date") and ((c."siteID" = d."siteID"))
full join countmicrobe2020 c2 
on (c2."date" = d."date") and ((c2."siteID" = d."siteID"));

create or replace view m2018 as 
select 
ms."date" as msdate
,ms."domainID" as msdomainID
,ms."siteID" as mssiteID
,ms."nucleicAcidConcentration" as msnucleicAcidConcentration
,ms."targetGene" as mstargetGene
,ms."targetTaxonGroup" as mstargetTaxonGroup
,ms."meanCopyNumber" as msmeanCopyNumber
,ms."copyNumberStandardDeviation" as mscopyNumberStandardDeviation
,m."date" as mdate
,m."domainID" as mdomainID
,m."siteID" as msiteID
,m."nucleicAcidConcentration" as mnucleicAcidConcentration
,m."targetGene" as mtargetGene
,m."targetTaxonGroup" as mtargetTaxonGroup
,m."meanCopyNumber" as mmeanCopyNumber
,m."copyNumberStandardDeviation" as mcopyNumberStandardDeviation 
from
microbe16s2018 ms full join 
microbeits2018 m  on (ms."date" = m."date") and ((ms."siteID" = m."siteID"));

create or replace view m2019 as 
select 
ms."date" as msdate
,ms."domainID" as msdomainID
,ms."siteID" as mssiteID
,ms."nucleicAcidConcentration" as msnucleicAcidConcentration
,ms."targetGene" as mstargetGene
,ms."targetTaxonGroup" as mstargetTaxonGroup
,ms."meanCopyNumber" as msmeanCopyNumber
,ms."copyNumberStandardDeviation" as mscopyNumberStandardDeviation
,m."date" as mdate
,m."domainID" as mdomainID
,m."siteID" as msiteID
,m."nucleicAcidConcentration" as mnucleicAcidConcentration
,m."targetGene" as mtargetGene
,m."targetTaxonGroup" as mtargetTaxonGroup
,m."meanCopyNumber" as mmeanCopyNumber
,m."copyNumberStandardDeviation" as mcopyNumberStandardDeviation 
from
microbe16s2019 ms full join 
microbeits2019 m  on (ms."date" = m."date") and ((ms."siteID" = m."siteID"));


