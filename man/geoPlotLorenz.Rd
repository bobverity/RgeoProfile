% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotting.R
\name{geoPlotLorenz}
\alias{geoPlotLorenz}
\title{Produce Lorenz Plot}
\usage{
geoPlotLorenz(hit_scores, crimeNumbers = NULL, suspects_col = "red",
  crimes_col = "blue")
}
\arguments{
\item{hit_scores}{object in the format defined by geoReportHitscores().}

\item{crimeNumbers}{optional vector with numbers of crimes per suspect site.}

\item{suspects_col}{colour to plot curve for sources.}

\item{crimes_col}{colour to plot curve for crimes if crimeNumbers is supplied.}
}
\description{
Produces a Lorenz plot showing the proportion of suspect sites or cimes identified as a function of area and calculates
the corresponding Gini coefficient using trapezoid rule.
Also allows an optional vector called crimeNumbers with numbers of crimes per suspect site; the length of this vector
should equal the number of suspect sites. If this is present, the function calculates and returns the Gini coefficient 
based on the number of crimes; otherwise, this is calculated based on the number of suspect sites.
}
\examples{
# London example data
d <- LondonExample_crimes
s <- LondonExample_sources
p <- geoParams(data = d, sigma_mean = 1.0, sigma_squared_shape = 2)
m <- geoMCMC(data = d, params = p)
hs <- geoReportHitscores(params = p, source = s, surface = m$geoProfile)
hs 
# Lorenz plot on sources
geoPlotLorenz(hs)
# Lorenz plot on sources and crimes
# extract numbers of crimes allocated per source as a proxy
cn <- as.vector(table(m$bestGrouping))
geoPlotLorenz(hs, crimeNumbers = cn)
}
