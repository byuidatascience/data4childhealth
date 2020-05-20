#'
#' @title Child height and weight measurements for all data from three studies at one year of age.
#' @description A subset of measurements from the three studies.
#' @format A data frame with columns:
#' \describe{
#'  \item{subjid}{The variable is character. unique identifyer of each child}
#'  \item{sex}{The variable is character. Male or Female}
#'  \item{htcm}{The variable is numeric. Height in cm}
#'  \item{wtkg}{The variable is numeric. Weight measurement in kg (0.8-20.5)}
#'  \item{haz}{The variable is numeric. Height for age in SDS relative to WHO child growth standard}
#'  \item{waz}{The variable is numeric. Weight for age in SDS relative to WHO child growth standard}
#'  \item{country}{The variable is character. Label for the varied countries}
#' }
#' @source \url{https://github.com/stefvanbuuren/brokenstick, https://github.com/hafen/hbgd, and https://clinepidb.org/ce/app/record/dataset/DS_5c41b87221}
#' @examples
#' \dontrun{
#' days_365
#'}
'days_365'



#'
#' @title Child height and weight measurements
#' @description Longitudinal height and weight measurements during ages 0-2 years for a representative sample of 1,933 Dutch children born in 1988-1989.
#' @format A data frame with columns:
#' \describe{
#'  \item{subjid}{The variable is numeric. unique identifyer of each child}
#'  \item{sex}{The variable is character. Male or Female}
#'  \item{agedays}{The variable is numeric. Age in days}
#'  \item{gagebrth}{The variable is numeric. Gestational age at birth (days)}
#'  \item{htcm}{The variable is numeric. Length/height in cm (34-102)}
#'  \item{wtkg}{The variable is numeric. Weight measurement in kg (0.8-20.5)}
#'  \item{haz}{The variable is numeric. Height in SDS relative to WHO child growth standard}
#'  \item{waz}{The variable is numeric. Weight in SDS relative to WHO child growth standard}
#' }
#' @source \url{https://github.com/stefvanbuuren/brokenstick}
#' @examples
#' \dontrun{
#' childhealth_dutch
#'}
'childhealth_dutch'



#'
#' @title Child height and weight measurements
#' @description Subset of growth data from the collaborative perinatal project (CPP).
#' @format A data frame with columns:
#' \describe{
#'  \item{subjid}{The variable is integer. unique identifyer of each child}
#'  \item{sex}{The variable is character. Male or Female}
#'  \item{agedays}{The variable is integer. Age in days}
#'  \item{gagebrth}{The variable is numeric. Gestational age at birth (days)}
#'  \item{htcm}{The variable is integer. Length/height in cm (34-102)}
#'  \item{wtkg}{The variable is numeric. Weight measurement in kg (0.8-20.5)}
#'  \item{haz}{The variable is numeric. Height in SDS relative to WHO child growth standard}
#'  \item{waz}{The variable is numeric. Weight in SDS relative to WHO child growth standard}
#'  \item{mrace}{The variable is character. Race of the mother}
#'  \item{mage}{The variable is integer. Mother age at child birth}
#'  \item{meducyrs}{The variable is integer. Educational years of mother}
#'  \item{ses}{The variable is character. Socioeconomic status of mother}
#' }
#' @source \url{https://github.com/hafen/hbgd}
#' @examples
#' \dontrun{
#' childhealth_us
#'}
'childhealth_us'



#'
#' @title Child height, weight, head circumference measurements
#' @description Subset of growth data from the Malnutrition and Enteric Disease Study (MAL-ED).
#' @format A data frame with columns:
#' \describe{
#'  \item{subjid}{The variable is character. unique identifyer of each child}
#'  \item{sex}{The variable is character. Male or Female}
#'  \item{country}{The variable is character. Label for the varied countries}
#'  \item{agedays}{The variable is numeric. Age in days}
#'  \item{wtkg}{The variable is numeric. Weight measurement in kg (0.8-20.5)}
#'  \item{stcm}{The variable is numeric. Stature either Length or height in cm}
#'  \item{htcm}{The variable is numeric. Height in cm}
#'  \item{lncm}{The variable is numeric. Length in cm}
#'  \item{lh_used}{The variable is character. Lenght or Height used for stature}
#'  \item{hccm}{The variable is numeric. Head Circumference in cm}
#'  \item{lhaz}{The variable is numeric. Length or Height for age in SDS relative to WHO child growth standard}
#'  \item{haz}{The variable is numeric. Height for age in SDS relative to WHO child growth standard}
#'  \item{laz}{The variable is numeric. Length for age in SDS relative to WHO child growth standard}
#'  \item{waz}{The variable is numeric. Weight for age in SDS relative to WHO child growth standard}
#'  \item{hcaz}{The variable is numeric. Head cirumference for age in SDS relative to WHO child growth standard}
#'  \item{whz}{The variable is numeric. Weight for height or lenght in SDS relative to WHO child growth standard}
#' }
#' @source \url{https://www.fic.nih.gov/About/Staff/Pages/mal-ed.aspx and https://clinepidb.org/ce/app/record/dataset/DS_5c41b87221}
#' @examples
#' \dontrun{
#' childhealth_maled
#'}
'childhealth_maled'



#'
#' @title Child birth data
#' @description Subset of growth data from the collaborative perinatal project (CPP).
#' @format A data frame with columns:
#' \describe{
#'  \item{subjid}{The variable is integer. unique identifyer of each child}
#'  \item{sex}{The variable is character. Male or Female}
#'  \item{birthwt}{The variable is integer. Birthweight of the child}
#'  \item{birthlen}{The variable is integer. Birth length of the child}
#'  \item{apgar1}{The variable is integer. a quick test performed on a baby at 1 minute after birth. https://medlineplus.gov/ency/article/003402.htm}
#'  \item{apgar5}{The variable is integer. a quick test performed on a baby at 5 minutes after birth. https://medlineplus.gov/ency/article/003402.htm}
#'  \item{mrace}{The variable is character. Race of the mother}
#'  \item{mage}{The variable is integer. Mother age at child birth}
#'  \item{smoked}{The variable is integer. If the mother smoked (1) or didn't smoke (0)}
#'  \item{meducyrs}{The variable is integer. Educational years of mother}
#'  \item{ses}{The variable is character. Socioeconomic status of mother}
#' }
#' @source \url{https://github.com/hafen/hbgd}
#' @examples
#' \dontrun{
#' birth_us
#'}
'birth_us'



#'
#' @title Child birth data
#' @description Measurements during ages 0-2 years for a representative sample of 1,933 Dutch children born in 1988-1989
#' @format A data frame with columns:
#' \describe{
#'  \item{subjid}{The variable is numeric. unique identifyer of each child}
#'  \item{sex}{The variable is character. Male or Female}
#'  \item{birthwt}{The variable is numeric. Birthweight of the child}
#' }
#' @source \url{https://github.com/stefvanbuuren/brokenstick}
#' @examples
#' \dontrun{
#' birth_dutch
#'}
'birth_dutch'



#'
#' @title WHO coeficients for weight Z-score calculations
#' @description See https://www.cdc.gov/nchs/data/nhsr/nhsr063.pdf for a desciption on how calculations are made.  However, the CDC has different coefficients.
#' @format A data frame with columns:
#' \describe{
#'  \item{agedays}{The variable is numeric. Age of child in days}
#'  \item{sex}{The variable is character. The gender of the child}
#'  \item{mean}{The variable is numeric. The mean for a child at agedays}
#'  \item{sd}{The variable is numeric. The standard deviation of weights for children at agedays}
#'  \item{cv}{The variable is numeric. The coefficient of variation for children at agedays - https://en.wikipedia.org/wiki/Coefficient_of_variation}
#'  \item{l}{The variable is numeric. The box-cox tranformation for children at agedays - https://www.cdc.gov/nchs/data/nhsr/nhsr063.pdf}
#' }
#' @source \url{https://github.com/hafen/growthstandards}
#' @examples
#' \dontrun{
#' weight_coef
#'}
'weight_coef'



#'
#' @title WHO coeficients for height Z-score calculations
#' @description See https://www.cdc.gov/nchs/data/nhsr/nhsr063.pdf for a desciption on how calculations are made.  However, the CDC has different coefficients.  The l values were all 1 so they were removed
#' @format A data frame with columns:
#' \describe{
#'  \item{agedays}{The variable is numeric. Age of child in days}
#'  \item{sex}{The variable is character. The gender of the child}
#'  \item{mean}{The variable is numeric. The mean for a child at agedays}
#'  \item{sd}{The variable is numeric. The standard deviation of weights for children at agedays}
#'  \item{cv}{The variable is numeric. The coefficient of variation for children at agedays - https://en.wikipedia.org/wiki/Coefficient_of_variation}
#'  \item{l}{The variable is integer. The box-cox tranformation for children at agedays - https://www.cdc.gov/nchs/data/nhsr/nhsr063.pdf}
#' }
#' @source \url{https://github.com/hafen/growthstandards}
#' @examples
#' \dontrun{
#' height_coef
#'}
'height_coef'



