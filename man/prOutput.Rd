% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/output.R
\name{prBmp}
\alias{prBmp}
\alias{prJpeg}
\alias{prPng}
\alias{prTiff}
\alias{prPdf}
\alias{prSvg}
\alias{prCairoPdf}
\alias{prCairoPs}
\title{Save plots as image files}
\usage{
prBmp(name, ..., replace = FALSE)

prJpeg(name, ..., replace = FALSE)

prPng(name, ..., replace = FALSE)

prTiff(name, ..., replace = FALSE)

prPdf(name, ..., replace = FALSE)

prSvg(name, ..., replace = FALSE)

prCairoPdf(name, ..., replace = FALSE)

prCairoPs(name, ..., replace = FALSE)
}
\arguments{
\item{name}{Name of the output file, without extension. One can also specify
subdirectory where to save the file.}

\item{...}{parameters passed to the corresponding base R function. For
instance, for \code{prPng}, these parameters will be passed to function
\code{\link[grDevices]{png}}}

\item{replace}{If the file already exists, should it be overwritten ?}
}
\value{
These functions are used to open a plot device. Nothing is returned.
}
\description{
These functions can be used in place of their corresponding base R functions
to save plots as image files.
}
\details{
These functions has three advantages over the base functions:
\itemize{
\item Files are automatically created in the output folder of the project
even if the working directory has changed. Subdirectories are automatically
created if they do not exist.
\item By default, these functions do not erase an existing file. This avoids
accidents.
\item The default values of the parameters (width, height, etc.) can be
modified with function \code{\link{prOutputDefaults}}.
}
}
\examples{
projectPath <- file.path(tempdir(), "test")
prInit(projectPath)

prPng("test")
plot(rnorm(100))
dev.off()
# The plot is saved in "output/test.png"
list.files(projectPath, recursive = TRUE, include.dirs = TRUE)

prPng("mysubdirectory/test")
plot(rnorm(100))
dev.off()
# The plot is saved in "output/mysubdirectory/test.png"
list.files(projectPath, recursive = TRUE, include.dirs = TRUE)

}
\author{
Francois Guillem
}
