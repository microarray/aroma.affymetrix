%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  AdditiveCovariatesNormalization.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 \name{AdditiveCovariatesNormalization}
\docType{class}
\alias{AdditiveCovariatesNormalization}


 \title{The AdditiveCovariatesNormalization class}

 \description{
  Package:  aroma.affymetrix \cr
\bold{Class AdditiveCovariatesNormalization}\cr

\code{\link[R.oo]{Object}}\cr
\code{~~|}\cr
\code{~~+--}\code{\link[aroma.core]{AromaTransform}}\cr
\code{~~~~~~~|}\cr
\code{~~~~~~~+--}\code{\link[aroma.affymetrix]{Transform}}\cr
\code{~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~+--}\code{\link[aroma.affymetrix]{ChipEffectTransform}}\cr
\code{~~~~~~~~~~~~~~~~~|}\cr
\code{~~~~~~~~~~~~~~~~~+--}\emph{\code{AdditiveCovariatesNormalization}}\cr

\bold{Directly known subclasses:}\cr
\link[aroma.affymetrix]{GcContentNormalization2}\cr

public abstract static class \bold{AdditiveCovariatesNormalization}\cr
extends \emph{\link[aroma.affymetrix]{ChipEffectTransform}}\cr



  This class represents a normalization method that corrects for
  GC-content effects on copy-number chip-effect estimates.
 }

 \usage{AdditiveCovariatesNormalization(dataSet=NULL, ..., target=NULL, subsetToFit="-XY", shift=0, onMissing=c("median", "ignore"))}

 \arguments{
   \item{dataSet}{A \code{\link{SnpChipEffectSet}}.}
   \item{...}{Additional arguments passed to the constructor of
     \code{\link{ChipEffectTransform}}.}
   \item{target}{(Optional) A \code{\link[base]{character}} string or a \code{\link[base]{function}}
     specifying what to normalize toward.}
   \item{subsetToFit}{The units from which the normalization curve should
     be estimated.  If \code{\link[base]{NULL}}, all are considered.}
   \item{onMissing}{Specifies how to normalize units for which the
     GC contents are unknown.}
   \item{shift}{An optional amount the data points should be shifted
      (translated).}
 }

 \section{Fields and Methods}{
  \bold{Methods:}\cr
\tabular{rll}{
 \tab \code{clearCache} \tab  -\cr
 \tab \code{getCdf} \tab  -\cr
 \tab \code{getCovariates} \tab  -\cr
 \tab \code{getOutputDataSet00} \tab  -\cr
 \tab \code{\link[aroma.affymetrix:process.AdditiveCovariatesNormalization]{process}} \tab Normalizes the data set.\cr
}


 \bold{Methods inherited from Transform}:\cr
getOutputDataSet, getOutputDataSetOLD20090509, getOutputFiles

 \bold{Methods inherited from AromaTransform}:\cr
getFullName, getInputDataSet, getName, getOutputDataSet, getOutputFiles, getPath, getTags, isDone, process, setTags

 \bold{Methods inherited from Object}:\cr
asThis, $, $<-, [[, [[<-, as.character, attach, attachLocally, clearCache, clone, detach, equals, extend, finalize, gc, getEnvironment, getFields, getInstantiationTime, getStaticInstance, hasField, hashCode, ll, load, objectSize, print, save


 }

 \details{
   For SNPs, the normalization function is estimated based on the total
   chip effects, i.e. the sum of the allele signals.  The normalizing
   is done by rescale the chip effects on the intensity scale such that
   the mean of the total chip effects are the same across samples for
   any given GC content.  For allele-specific estimates, both alleles
   are always rescaled by the same amount.  Thus, when normalizing
   allele-specific chip effects, the total chip effects is change, but not
   the relative allele signal, e.g. the allele B frequency.
 }

 \author{Henrik Bengtsson (\url{http://www.braju.com/R/})}
\keyword{classes}