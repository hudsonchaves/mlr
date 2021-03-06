% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getConfMatrix.R
\name{getConfMatrix}
\alias{getConfMatrix}
\title{Confusion matrix.}
\usage{
getConfMatrix(pred, relative = FALSE)
}
\arguments{
\item{pred}{[\code{\link{Prediction}}]\cr
Prediction object.}

\item{relative}{[\code{logical(1)}]\cr
If \code{TRUE} rows are normalized to show relative frequencies.
Default is \code{FALSE}.}
}
\value{
[\code{matrix}]. A confusion matrix.
}
\description{
Calculates confusion matrix for (possibly resampled) prediction.
Rows indicate true classes, columns predicted classes.

The marginal elements count the number of classification
errors for the respective row or column, i.e., the number of errors
when you condition on the corresponding true (rows) or predicted
(columns) class. The last element in the margin diagonal
displays the total amount of errors.
}
\examples{
# get confusion matrix after simple manual prediction
allinds = 1:150
train = sample(allinds, 75)
test = setdiff(allinds, train)
mod = train("classif.lda", iris.task, subset = train)
pred = predict(mod, iris.task, subset = test)
print(getConfMatrix(pred))
print(getConfMatrix(pred, relative = TRUE))

# now after cross-validation
r = crossval("classif.lda", iris.task, iters = 2L)
print(getConfMatrix(r$pred))
}
\seealso{
\code{\link{predict.WrappedModel}}
}

