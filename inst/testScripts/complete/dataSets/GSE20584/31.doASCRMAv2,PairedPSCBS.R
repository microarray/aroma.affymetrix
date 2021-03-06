##########################################################################
# AS-CRMAv2 and Paired PSCBS
##########################################################################
library("aroma.affymetrix");
library("aroma.cn");  # PairedPscbsModel
stopifnot(packageVersion("aroma.cn") >= "1.2.4");
verbose <- Arguments$getVerbose(-8, timestamp=TRUE);


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Setup
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
dataSet <- "GSE20584";
chipType <- "GenomeWideSNP_6,Full";

csR <- AffymetrixCelSet$byName(dataSet, chipType=chipType);


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# AS-CRMAv2
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
dsNList <- doASCRMAv2(csR, verbose=verbose);
print(dsNList);

dsN <- exportAromaUnitPscnBinarySet(dsNList);
print(dsN);


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Group samples by name and type
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# AD HOC: For now, just hardwire the path.
path <- file.path("testScripts/complete/dataSets", dataSet);
db <- TabularTextFile(sprintf("%s,samples.txt", dataSet), path=path);
setColumnNameTranslator(db, function(names, ...) {
  names <- gsub("id", "fixed", names);
  names <- gsub("fullname", "replacement", names);
  names;
});
df <- readDataFrame(db, colClasses=c("*"="character"));
setFullNamesTranslator(dsN, df);

# Identify unique sample names
sampleNames <- unique(getNames(dsN));

dsList <- lapply(sampleNames, FUN=function(sampleName) {
  ds <- dsN[sampleName];
  lapply(c(T="T", N="N"), FUN=function(type) {
    ds[sapply(ds, hasTag, type)];
  });
});
names(dsList) <- sampleNames;


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Extract (single) tumor-normal pairs
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
dfTList <- lapply(dsList, FUN=function(dsList) { dsList$T[[1]] });
dsT <- newInstance(dsList[[1]]$T, dfTList);
dfNList <- lapply(dsList, FUN=function(dsList) { dsList$N[[1]] });
dsN <- newInstance(dsList[[1]]$T, dfNList);


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Segment tumor-normal pairs
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
sm <- PairedPscbsModel(dsT=dsT, dsN=dsN, gapMinLength=2e6);
print(sm);

res <- fit(sm, verbose=verbose);
print(res);

sms <- getOutputDataSet(sm);
print(sms);


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Call segments to be in ROH, AB and LOH.
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
caller <- PairedPscbsCaller(sms);
print(caller);
scs <- process(caller, verbose=verbose);
print(scs);


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
# Generate report
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
setOption("PSCBS::reports/pscnSegmentationTransitions", TRUE);

# Generate report for first tumor-normal pair
df <- scs[[1]];
fit <- loadObject(df);
pathname <- report(fit, studyName=getFullName(dsT), verbose=verbose);
print(pathname);
