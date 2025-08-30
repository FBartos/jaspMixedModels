Generalized Linear Mixed Models
===

Generalized Linear Mixed Models allow you to model a linear relationship between one or more explanatory variable(s) and a continuous dependent variable in cases where the observations are not independent, but clustered given one or several random effects grouping factors (e.g., repeated measures across participants or items, children within schools). They are generalization of Linear Mixed Models and allow to model response variables that are not continous using a different likelihoods and link functions.

### Assumptions
- Linearity and additivity: The response variable is related to all predictors according to the link function and the effects of the predictors are additive on the linear scale.
- Independence of errors: The errors are uncorrelated with each other after taking the model (i.e., fixed effects and random effects structure) into account.
- Homoscedasticity: The error variance of each predictor is constant across all values of that predictor.
- Distribution of errors: The errors are distributed according to the distributional family.

The analysis uses sum contrast encoding for categorical (nominal and ordinal) predictors (R uses dummy encoding by default). This scheme is used for better interpretability of models with interactions. However, the fixed and random effects estimates will differ from those obtained from R with default settings. We advise using the 'Estimated marginal means' section for obtaining mean estimates at individual factor levels. For comparing the mean estimates, use the contrasts option. To change the contrast enconding for the analysis use `Factor contrast` dropdown in the Options section.

The analysis uses a long data format.

### Input

#### Assignment Box
  - Dependent variable: Dependent (response) variable.
  - Number of trials: Number of trials, only applicable if `Binomial (aggregated)` family is selected.
  - Fixed effects variables: Variables used as the fixed effects predictors (the model terms can be specified under `Model` section). These are usually the variables of primary scientific interest.
  - Random effects grouping factors: Categorical variable(s) specifying clusters of observations (i.e., several observations per level of a random effects grouping factor). These are typically variables, such as participant or item, one wants to generalize over. Factors with very few levels (i.e., less then five or six levels) should not be used as random effects grouping factors and the number of levels of the random effects grouping factors determines the power of the test of the fixed effects (Westfall, Kenny, & Judd, 2014). The random effect structure (i.e., random intercepts, random slopes, and correlations among random effects parameters) can be specified under `Model` - `Random effects`. The default random effects structure is the automatically determined "maximal random effects structure justified by the design" (Barr, Levy, Scheepers, & Tily, 2013).


#### Family
  - Distribution function which likelihood will be used for the dependent variable.

#### Link
  - Link function that will be used to model the mean parameter of the selected distribution function.

#### Run Analysis 
Press the button to run the analysis. Model relevant changes in the settings will not be applied until the button is pressed.


### Output
  - ANOVA summary: Output table containing test statistics relevant to the fixed effects terms (summary regarding fixed effect coefficients and random effect coefficients can be obtained in `Options` section).
    - Effects: This column contains the independent variables or their interaction.
    - df: Degrees of freedom of the model.
    - F: The value of the F-statistic.
    - p: The p-value.
    - VS-MPR: Vovk-Sellke Maximum p-ratio (needs to be selected in `Options` section).

### Model
- Components and model terms: 
    - Model components: All the fixed effects variables that can be included in the model. 
    - Fixed effects: The independent variables in the model. By default, all the main effects of the specified independent variables and their interactions are included in the model. To include interactions, click multiple variables (e.g., by holding the ctrl/cmd button on your keyboard while clicking) and drag those into the `Fixed effects` box.
    - Random effects: The random effects organized by random effects grouping factors. By default, all of the random effects corresponding to the fixed effects are included and JASP internally checks and removes non-estimable random effects. That is, the default corresponds to the "maximal random effects structure justified by the design" (Barr, Levy, Scheepers, & Tily, 2013). Unticking the boxes on the left of the variable names removes the random effect from corresponding random effects grouping factor.
     - Correlations: Whether the correlations between the random effects parameters within each random effects grouping factor should be estimated. 


### Options
- Sum of Squares: There are different types of the sum of squares. The choice of the type is important when there are multiple factors and when the data are unbalanced. In an unbalanced design, the different levels of the independent variable do not contain an equal number of observations (e.g., one group contains more observations than another group). In this scenario, the sum of squares type can influence the results. 
  - Type II: Hierarchical/partially sequential sum of squares. It is the reduction of error when each factor is added to the model that includes all the other factors, except the factors where the added factor is a part of, such as interactions containing that factor. Langsrud (2003) advises to apply this type for an ANOVA with unbalanced data.
  - Type III: Partial sum of squares. It is the reduction of error when each factor is added to the model that includes all the other factors, including interactions with this factor. This type is often selected, because it takes interactions into account (Langsrud, 2003). This type is selected by default and recommended for designs in which the imbalance is not a consequence of imbalance in the population, but random.
- Test method: Methods for obtaining p-values for the ANOVA summary.
  - No. samples: Number of samples for the parametric bootstrap.
- Factor contrast: Specifies factor encoding for categorical variables. 
- Repeatability: Gives the option to set a seed for your analysis. Setting a seed will exclude random processes influencing an analysis. Affects only parametric bootstrap and jitter in plots.
- Test intercept: Whether the model intercept should be tested.
- Fixed effects estimates: Shows the estimated fixed effect coefficients.
- Variance/correlation estimates: Shows the estimated residual variances and variances/correlations of random effects coefficients.
- Vovk-Selke maximum p-ratio: The bound 1/(-e p log(p)) is derived from the shape of the p-value distribution. Under the null hypothesis (H<sub>0</sub>) it is uniform (0,1), and under the alternative (H<sub>1</sub>) it is decreasing in p, e.g., a beta (α, 1) distribution, where 0 < α < 1. The Vovk-Sellke MPR is obtained by choosing the shape α of the distribution under H1 such that the obtained p-value is maximally diagnostic. The value is then the ratio of the densities at point p under H<sub>0</sub> and H<sub>1</sub>. For example, if the two-sided p-value equals .05, the Vovk-Sellke MPR equals 2.46, indicating that this p-value is at most 2.46 times more likely to occur under H1 than under H<sub>0</sub>. More information can be found in this <a href="https://jasp-stats.org/2017/06/12/mysterious-vs-mpr/">blogpost</a>. 


### Diagnostics
The Diagnostics section provides comprehensive model assumption checking and performance evaluation for generalized linear mixed models, helping assess model validity and quality.

#### Model assumptions
- Normality of residuals: Performs Shapiro-Wilk test on deviance residuals to check distributional assumptions. Note that for non-normal families (binomial, Poisson, etc.), residuals may not be expected to be normally distributed.
- Homoscedasticity: Tests for constant error variance using the Breusch-Pagan test on deviance residuals. This test is most meaningful for Gaussian GLMMs.
- Outliers: Detection of observations that deviate substantially from the model predictions (implementation pending).
- Influential observations: Identification of observations that have disproportionate influence on model parameters (implementation pending).

#### Multicollinearity
- Variance inflation factors (VIF): Calculates VIF values for all fixed effect predictors to detect multicollinearity. VIF quantifies how much the variance of regression coefficients increases due to collinearity.
  - VIF threshold: Set the threshold above which VIF values are considered problematic (default: 3.0). Values above 3 indicate moderate multicollinearity, values above 5 indicate high multicollinearity.
  - Show warnings for high VIF: Displays warnings when predictors exceed the VIF threshold, with recommendations for variable removal.
- Tolerance values (1/VIF) are also provided, with values below 0.33 (corresponding to VIF > 3) indicating potential problems.

#### Model performance
- R-squared values: 
  - R² (marginal): Proportion of variance explained by fixed effects only on the linear predictor scale.
  - For non-Gaussian families, interpretation of R² values requires caution as variance explained on the link scale may not translate directly to the response scale.
- Intraclass correlation coefficient (ICC): Proportion of total variance attributable to clustering/grouping factors (implementation pending).
- Root mean square error (RMSE): Measure of average prediction error calculated on the response scale.
- Model comparison metrics: AIC, BIC, and log-likelihood values for model comparison and selection. These are particularly useful for GLMMs as they account for different distributional families.

#### Residual plots
- Residuals vs fitted values: Scatterplot of deviance residuals vs fitted values to check for non-linear patterns and heteroscedasticity.
- Q-Q plot of residuals: Quantile-quantile plot of deviance residuals. For non-Gaussian families, deviations from normality may be expected.
- Scale-location plot: Shows square root of standardized deviance residuals vs fitted values (implementation pending).
- Leverage plot: Identifies observations with high leverage that may influence model fit (implementation pending).

For GLMMs, residual analysis is more complex than for linear models due to the non-linear link functions and non-normal error distributions. The diagnostics should be interpreted in the context of the chosen distributional family.


### Plots
- Model factors: Categorical or ordinal fixed effects variables that can be used for visualization.
  - Horizontal axis: Variables that will be plotted on the horizontal axis.
  - Separate lines: Variables that will be plotted "inside" the plot as different traces/lines.
  - Separate plots: Variables which levels will be split across different plots.
- Random effect grouping factors: Random effect grouping factors that can be used for data aggregation of data shown in the background.
  - Background data show: The level of aggregation for the response variable. I.e., if participants are selected, the individual data points in the background are their averages across the combinations of levels of fixed effect factors selected in the `Horizontal axis`, `Separate lines`, and `Separate plots`.
 - Confidence interval method: Type of standard error on which the error bars will be based. Default is "model", which plots model-based standard errors.
 - Confidence interval: The width of the confidence interval.
 - Background geom: Geom that will be used to display the aggregated response variable.
  - Transparency: Transparency of the geom.
  - Jitter width: Width of the jitter.
  - Jitter height: Height of the jitter.
  - Geom width: Width of the geoms.
  - Dodge: Spacing between the geoms.
- Distinguish factor levels: How the factor levels should be distinguished.
  - Color
  - Shape
  - Linetype
  - Fill
- Theme: A theme of the plots.
- Legend position: Whether and where should be the legend plotted.
- Color background data: Color of the aggregated response variable.
- Relative size text: Relative size of the plotted text.
- Relative size foreground data: Relative size of the foreground data (confidence interval bars, etc...).
- Estimates table: Display numerical summary of the plotted objects.


### Estimated marginal means
- Model variables: Fixed effects variables that can be used for computing estimated marginal means.
- Selected variables: Variables for which the estimated marginal means will be computed.
- Confidence interval: Width of the confidence interval.
- Estimate df: Method of estimating degrees of freedom. Note that `Kenward-Roger` approximation for degrees of freedom can be very RAM and time consuming with larger datasets.
  - Force df estimation: JASP automatically uses `Asymptotic` degrees of freedom in cases with a large dataset. This can be disabled by ticking this checkbox.
- SD factor covariates: What should be the "levels" of continuous variables (expressed in standard deviations) for which are the estimated marginal means computed.
- Compare marginal means to: Value to which will be the estimated marginal means compared.
- Specify contrasts: Creates a table for specifying contrasts based on the estimated marginal means.
- Response scale: Whether the estimated marginal means should be computed on the response scale or untransformed linear scale. The response scale is selected by default.
- P-value adjustment: To correct for multiple comparison testing and avoid Type I errors, different methods for correcting the p-value are available:
  - Holm: This method is also called sequential Bonferroni, and considered less conservative than the Bonferroni method.
  - Multivariate-t: TODO: add some text?
  - Scheffe: Adjusting significance levels in a linear regression, to account for multiple comparisons. This method is considered to be quite conservative.
  - Tukey: Compare all possible pairs of group means. This correction can be used when the groups of the independent variable have an equal sample size and variance.
  - None: No adjustment is conducted.
  - Bonferroni: This correction is considered conservative. The risk of Type I error is reduced, however the statistical power decreases as well. 
  - Hommel: TODO: add some text?
- Contrasts: A table created by checking `Specify contrasts` checkbox. 
  - The first column contains indices of rows corresponding to the estimated marginal means output table. 
  - Columns with variable names contain the combinations of variables level for each estimated marginal mean.
  - Columns named Contrast `x` are used for specifying the contrasts. To set a contrast between two marginal means, enter -1 and 1 to the corresponding rows. Interactions can be tested by specifying differences between the changes in marginal means of one variable across levels of another variable.


### Estimated trends/conditional slopes
- Continuous variables: Continuous fixed effects variables that can be used for estimating the conditional slopes.
- Trend variable: Variables for which the estimated conditional slopes will be computed.
- Model variables: Fixed effects variables over which the conditional slopes can be computed.
- Selected variables: Variables over which the the conditional slopes will be computed.
- Confidence interval: Width of the confidence interval.
- Estimate df: Method of estimating degrees of freedom. Note that `Kenward-Roger` approximation for degrees of freedom can be very RAM and time consuming with larger datasets.
  - Force df estimation: JASP automatically uses `Asymptotic` degrees of freedom in cases with a large dataset. This can be disabled by ticking this checkbox.
- SD factor covariates: What should be the "levels" of continuous variables (expressed in standard deviations) over which the conditional slopes are computed.
- Compare trends to: Value to which will be the estimated conditional slopes compared.
- Specify contrasts: Creates a table for specifying contrasts based on the estimated conditional slopes.
- Response scale: Whether the estimated conditional slopes should be computed on the response scale or untransformed linear scale. The response scale is selected by default.
- P-value adjustment: To correct for multiple comparison testing and avoid Type I errors, different methods for correcting the p-value are available:
  - Holm: This method is also called sequential Bonferroni, and considered less conservative than the Bonferroni method.
  - Multivariate-t: TODO: add some text?
  - Scheffe: Adjusting significance levels in a linear regression, to account for multiple comparisons. This method is considered to be quite conservative.
  - Tukey: Compare all possible pairs of group means. This correction can be used when the groups of the independent variable have an equal sample size and variance.
  - None: No adjustment is conducted.
  - Bonferroni: This correction is considered conservative. The risk of Type I error is reduced, however the statistical power decreases as well. 
  - Hommel: TODO: add some text?
- Contrasts: A table created by checking `Specify contrasts` checkbox. 
  - The first column contains indices of rows corresponding to the estimated conditional slopes output table. 
  - Columns with variable names contain the combinations of variables level for each estimated conditional slope.
  - Columns named Contrast `x` are used for specifying the contrasts. To set a contrast between two conditional slopes, enter -1 and 1 to the corresponding rows. Interactions can be tested by specifying differences between the changes in conditional slopes of one variable across levels of another variable.


### References
---
- Barr, D. J., Levy, R., Scheepers, C., & Tily, H. J. (2013). Random effects structure for confirmatory hypothesis testing: Keep it maximal. *Journal of Memory and Language*, 68(3), 255–278. https://doi.org/10.1016/j.jml.2012.11.001
- Singmann, H., & Kellen, D. (2019). An Introduction to Mixed Models for Experimental Psychology. In D. H. Spieler & E. Schumacher (Eds.), *New Methods in Cognitive Psychology* (pp. 4–31). Psychology Press. http://singmann.org/download/publications/singmann_kellen-introduction-mixed-models.pdf
- Westfall, J., Kenny, D. A., & Judd, C. M. (2014). Statistical power and optimal design in experiments in which samples of participants respond to samples of stimuli. *Journal of Experimental Psychology: General*, 143(5), 2020–2045. https://doi.org/10.1037/xge0000014


### R Packages
---
- afex
- glmer
- lme4
- emmeans
- ggplot2
- stats
