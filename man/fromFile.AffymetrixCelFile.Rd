%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Do not modify this file since it was automatically generated from:
% 
%  AffymetrixCelFile.R
% 
% by the Rdoc compiler part of the R.oo package.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\name{AffymetrixCelFile$fromFile}
\alias{AffymetrixCelFile$fromFile}
\alias{fromFile.AffymetrixCelFile}
\alias{AffymetrixCelFile.fromFile}
\alias{fromFile,AffymetrixCelFile-method}

\title{Defines an AffymetrixCelFile object from a CEL file}

\description{
 Defines an AffymetrixCelFile object from a CEL file.
}

\usage{
## Static method (use this):
## AffymetrixCelFile$fromFile(filename, path=NULL, ..., verbose=FALSE, .checkArgs=TRUE)

## Don't use the below:
\method{fromFile}{AffymetrixCelFile}(static, filename, path=NULL, ..., verbose=FALSE, .checkArgs=TRUE)
}

\arguments{
 \item{filename}{The filename of to the file.}
 \item{path}{The path to the file.}
 \item{...}{Not used.}
}

\value{
 Returns an \code{\link{AffymetrixCelFile}} object.
 If the file is not found or if it is of the wrong file format, an
 error is thrown.
}

\author{Henrik Bengtsson}

\seealso{
  For more information see \code{\link{AffymetrixCelFile}}.
}



\keyword{internal}
\keyword{methods}
\keyword{IO}
\keyword{programming}
