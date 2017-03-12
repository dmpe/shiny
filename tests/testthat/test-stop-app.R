context("stop-app")

checkAndGetResults <- function(isError, isStopped) {
  stopifnot(shinyV4:::.globals$reterror == isError)
  stopifnot(shinyV4:::.globals$stopped, isStopped)
  shinyV4:::.globals$retval
}

test_that("stopApp records errors and respects visibility", {

  stopApp(10)
  expect_equal(withVisible(10), checkAndGetResults(FALSE, TRUE))

  stopApp(invisible(cars))
  expect_equal(withVisible(invisible(cars)), checkAndGetResults(FALSE, TRUE))

  stopApp(stop("boom", call. = FALSE))
  err <- checkAndGetResults(TRUE, TRUE)
  attr(err, "stack.trace") <- NULL
  expect_identical(simpleError("boom"), err)
})
