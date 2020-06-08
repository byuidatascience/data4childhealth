## Child height and weight measurements for all data from three studies at one year of age.

The data is called days_365.

### Description

A subset of measurements from the three studies.

The source of this data is < https://github.com/stefvanbuuren/brokenstick, https://github.com/hafen/hbgd, and https://clinepidb.org/ce/app/record/dataset/DS_5c41b87221 >

### Data format

A data frame with columns:

|variable |class     |description                                                 |
|:--------|:---------|:-----------------------------------------------------------|
|subjid   |character |unique identifyer of each child                             |
|sex      |character |Male or Female                                              |
|htcm     |numeric   |Height in cm                                                |
|wtkg     |numeric   |Weight measurement in kg (0.8-20.5)                         |
|haz      |numeric   |Height for age in SDS relative to WHO child growth standard |
|waz      |numeric   |Weight for age in SDS relative to WHO child growth standard |
|country  |character |Label for the varied countries                              |



## Child height and weight measurements

The data is called childhealth_dutch.

### Description

Longitudinal height and weight measurements during ages 0-2 years for a representative sample of 1,933 Dutch children born in 1988-1989.

The source of this data is < https://github.com/stefvanbuuren/brokenstick >

### Data format

A data frame with columns:

|variable |class     |description                                         |
|:--------|:---------|:---------------------------------------------------|
|subjid   |numeric   |unique identifyer of each child                     |
|sex      |character |Male or Female                                      |
|agedays  |numeric   |Age in days                                         |
|gagebrth |numeric   |Gestational age at birth (days)                     |
|htcm     |numeric   |Length/height in cm (34-102)                        |
|wtkg     |numeric   |Weight measurement in kg (0.8-20.5)                 |
|haz      |numeric   |Height in SDS relative to WHO child growth standard |
|waz      |numeric   |Weight in SDS relative to WHO child growth standard |



## Child height and weight measurements

The data is called childhealth_us.

### Description

Subset of growth data from the collaborative perinatal project (CPP).

The source of this data is < https://github.com/hafen/hbgd >

### Data format

A data frame with columns:

|variable |class     |description                                         |
|:--------|:---------|:---------------------------------------------------|
|subjid   |integer   |unique identifyer of each child                     |
|sex      |character |Male or Female                                      |
|agedays  |integer   |Age in days                                         |
|gagebrth |numeric   |Gestational age at birth (days)                     |
|htcm     |integer   |Length/height in cm (34-102)                        |
|wtkg     |numeric   |Weight measurement in kg (0.8-20.5)                 |
|haz      |numeric   |Height in SDS relative to WHO child growth standard |
|waz      |numeric   |Weight in SDS relative to WHO child growth standard |
|mrace    |character |Race of the mother                                  |
|mage     |integer   |Mother age at child birth                           |
|meducyrs |integer   |Educational years of mother                         |
|ses      |character |Socioeconomic status of mother                      |



## Child height, weight, head circumference measurements

The data is called childhealth_maled.

### Description

Subset of growth data from the Malnutrition and Enteric Disease Study (MAL-ED).

The source of this data is < https://www.fic.nih.gov/About/Staff/Pages/mal-ed.aspx and https://clinepidb.org/ce/app/record/dataset/DS_5c41b87221 >

### Data format

A data frame with columns:

|variable |class     |description                                                              |
|:--------|:---------|:------------------------------------------------------------------------|
|subjid   |character |unique identifyer of each child                                          |
|sex      |character |Male or Female                                                           |
|country  |character |Label for the varied countries                                           |
|agedays  |numeric   |Age in days                                                              |
|wtkg     |numeric   |Weight measurement in kg (0.8-20.5)                                      |
|stcm     |numeric   |Stature either Length or height in cm                                    |
|htcm     |numeric   |Height in cm                                                             |
|lncm     |numeric   |Length in cm                                                             |
|lh_used  |character |Lenght or Height used for stature                                        |
|hccm     |numeric   |Head Circumference in cm                                                 |
|lhaz     |numeric   |Length or Height for age in SDS relative to WHO child growth standard    |
|haz      |numeric   |Height for age in SDS relative to WHO child growth standard              |
|laz      |numeric   |Length for age in SDS relative to WHO child growth standard              |
|waz      |numeric   |Weight for age in SDS relative to WHO child growth standard              |
|hcaz     |numeric   |Head cirumference for age in SDS relative to WHO child growth standard   |
|whz      |numeric   |Weight for height or lenght in SDS relative to WHO child growth standard |



## Child birth data

The data is called birth_us.

### Description

Subset of growth data from the collaborative perinatal project (CPP).

The source of this data is < https://github.com/hafen/hbgd >

### Data format

A data frame with columns:

|variable |class     |description                                                                                                |
|:--------|:---------|:----------------------------------------------------------------------------------------------------------|
|subjid   |integer   |unique identifyer of each child                                                                            |
|sex      |character |Male or Female                                                                                             |
|birthwt  |integer   |Birthweight of the child                                                                                   |
|birthlen |integer   |Birth length of the child                                                                                  |
|apgar1   |integer   |a quick test performed on a baby at 1 minute after birth. https://medlineplus.gov/ency/article/003402.htm  |
|apgar5   |integer   |a quick test performed on a baby at 5 minutes after birth. https://medlineplus.gov/ency/article/003402.htm |
|mrace    |character |Race of the mother                                                                                         |
|mage     |integer   |Mother age at child birth                                                                                  |
|smoked   |integer   |If the mother smoked (1) or didn't smoke (0)                                                               |
|meducyrs |integer   |Educational years of mother                                                                                |
|ses      |character |Socioeconomic status of mother                                                                             |



## Child birth data

The data is called birth_dutch.

### Description

Measurements during ages 0-2 years for a representative sample of 1,933 Dutch children born in 1988-1989

The source of this data is < https://github.com/stefvanbuuren/brokenstick >

### Data format

A data frame with columns:

|variable |class     |description                     |
|:--------|:---------|:-------------------------------|
|subjid   |numeric   |unique identifyer of each child |
|sex      |character |Male or Female                  |
|birthwt  |numeric   |Birthweight of the child        |



## WHO coeficients for weight Z-score calculations

The data is called weight_coef.

### Description

See https://www.cdc.gov/nchs/data/nhsr/nhsr063.pdf for a desciption on how calculations are made.  However, the CDC has different coefficients.

The source of this data is < https://github.com/hafen/growthstandards >

### Data format

A data frame with columns:

|variable |class     |description                                                                                                   |
|:--------|:---------|:-------------------------------------------------------------------------------------------------------------|
|agedays  |numeric   |Age of child in days                                                                                          |
|sex      |character |The gender of the child                                                                                       |
|mean     |numeric   |The mean for a child at agedays                                                                               |
|sd       |numeric   |The standard deviation of weights for children at agedays                                                     |
|cv       |numeric   |The coefficient of variation for children at agedays - https://en.wikipedia.org/wiki/Coefficient_of_variation |
|l        |numeric   |The box-cox tranformation for children at agedays - https://www.cdc.gov/nchs/data/nhsr/nhsr063.pdf            |



## WHO coeficients for height Z-score calculations

The data is called height_coef.

### Description

See https://www.cdc.gov/nchs/data/nhsr/nhsr063.pdf for a desciption on how calculations are made.  However, the CDC has different coefficients.  The l values were all 1 so they were removed

The source of this data is < https://github.com/hafen/growthstandards >

### Data format

A data frame with columns:

|variable |class     |description                                                                                                   |
|:--------|:---------|:-------------------------------------------------------------------------------------------------------------|
|agedays  |numeric   |Age of child in days                                                                                          |
|sex      |character |The gender of the child                                                                                       |
|mean     |numeric   |The mean for a child at agedays                                                                               |
|sd       |numeric   |The standard deviation of weights for children at agedays                                                     |
|cv       |numeric   |The coefficient of variation for children at agedays - https://en.wikipedia.org/wiki/Coefficient_of_variation |
|l        |integer   |The box-cox tranformation for children at agedays - https://www.cdc.gov/nchs/data/nhsr/nhsr063.pdf            |

## Child height and weight HAZ summaries

The data is called childhealth_summary.

### Description

For all data from three studies

The source of this data is < https://github.com/stefvanbuuren/brokenstick, https://github.com/hafen/hbgd, and https://clinepidb.org/ce/app/record/dataset/DS_5c41b87221 >

### Data format

A data frame with columns:

|variable      |class     |description                                              |
|:-------------|:---------|:--------------------------------------------------------|
|subjid        |character |unique identifyer of each child                          |
|sex           |character |Male or Female                                           |
|country       |character |Label for the varied countries                           |
|haz_mean      |numeric   |The average HAZ score over all measurements              |
|waz_mean      |numeric   |The average WAZ score over all measurements              |
|observations  |integer   |Number of observations for that subject                  |
|agedays_last  |numeric   |The age in days for the HAZ and WAZ last variable        |
|agedays_first |numeric   |The age in days for the HAZ and WAZ first variable       |
|haz_last      |numeric   |The first HAZ measurement on the subject for age in days |
|haz_first     |numeric   |The last HAZ measurement on the subject for age in days  |
|waz_first     |numeric   |The first WAZ measurement on the subject for age in days |
|waz_last      |numeric   |The last WAZ measurement on the subject for age in days  |



