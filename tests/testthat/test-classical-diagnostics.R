# Test for Classical Mixed Models Diagnostics
context("Classical Mixed Models Diagnostics")

test_that("LMM Diagnostics - Predicted vs Residuals", {
  options <- jaspTools::analysisOptions("MixedModelsLMM")
  options$dependent <- "rt"
  options$fixedEffects <- list(list(components = "stimulus"))
  options$fixedVariables <- "stimulus"
  
  randomComponents <- list(list(randomSlopes = TRUE, value = "Intercept"))
  options$randomEffects <- list(list(correlations = TRUE, randomComponents = randomComponents, value = "id"))
  options$randomVariables <- "id"
  
  options$diagnosticsPredictedVsResiduals <- TRUE
  
  results <- jaspTools::runAnalysis("MixedModelsLMM", "LMM.csv", options)
  
  # Check that diagnostics container was created
  expect_true("classicalDiagnosticPlots" %in% names(results$results))
  
  # Check that the predicted vs residuals plot was created
  diagnostics <- results$results$classicalDiagnosticPlots
  expect_true("predictedVsResiduals" %in% names(diagnostics))
})

test_that("LMM Diagnostics - Multiple plots", {
  options <- jaspTools::analysisOptions("MixedModelsLMM")
  options$dependent <- "rt"
  options$fixedEffects <- list(list(components = "stimulus"))
  options$fixedVariables <- "stimulus"
  
  randomComponents <- list(list(randomSlopes = TRUE, value = "Intercept"))
  options$randomEffects <- list(list(correlations = TRUE, randomComponents = randomComponents, value = "id"))
  options$randomVariables <- "id"
  
  options$diagnosticsPredictedVsResiduals <- TRUE
  options$diagnosticsHistogramResiduals <- TRUE
  options$diagnosticsQQResiduals <- TRUE
  options$diagnosticsResidualsVsPredictors <- TRUE
  
  results <- jaspTools::runAnalysis("MixedModelsLMM", "LMM.csv", options)
  
  # Check that diagnostics container was created
  expect_true("classicalDiagnosticPlots" %in% names(results$results))
  
  diagnostics <- results$results$classicalDiagnosticPlots
  
  # Check that all requested plots were created
  expect_true("predictedVsResiduals" %in% names(diagnostics))
  expect_true("histogramResiduals" %in% names(diagnostics))
  expect_true("qqResiduals" %in% names(diagnostics))
  expect_true("residualsVsstimulus" %in% names(diagnostics))
})

test_that("GLMM Diagnostics work", {
  options <- jaspTools::analysisOptions("MixedModelsGLMM")
  options$dependent <- "rt"
  options$fixedEffects <- list(list(components = "stimulus"))
  options$fixedVariables <- "stimulus"
  
  randomComponents <- list(list(randomSlopes = TRUE, value = "Intercept"))
  options$randomEffects <- list(list(correlations = TRUE, randomComponents = randomComponents, value = "id"))
  options$randomVariables <- "id"
  
  options$family <- "gaussian"
  options$link <- "identity"
  options$diagnosticsPredictedVsResiduals <- TRUE
  
  results <- jaspTools::runAnalysis("MixedModelsGLMM", "LMM.csv", options)
  
  # Check that diagnostics container was created
  expect_true("classicalDiagnosticPlots" %in% names(results$results))
  
  diagnostics <- results$results$classicalDiagnosticPlots
  expect_true("predictedVsResiduals" %in% names(diagnostics))
})

test_that("Diagnostics are not created when no options are selected", {
  options <- jaspTools::analysisOptions("MixedModelsLMM")
  options$dependent <- "rt"
  options$fixedEffects <- list(list(components = "stimulus"))
  options$fixedVariables <- "stimulus"
  
  randomComponents <- list(list(randomSlopes = TRUE, value = "Intercept"))
  options$randomEffects <- list(list(correlations = TRUE, randomComponents = randomComponents, value = "id"))
  options$randomVariables <- "id"
  
  results <- jaspTools::runAnalysis("MixedModelsLMM", "LMM.csv", options)
  
  # Check that diagnostics container was NOT created
  expect_false("classicalDiagnosticPlots" %in% names(results$results))
})