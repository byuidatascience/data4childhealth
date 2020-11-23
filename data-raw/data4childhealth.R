pacman::p_load(tidyverse, downloader, fs, glue, rvest)
pacman::p_load_current_gh("byuidss/DataPushR")

# remotes::install_github("ki-tools/growthstandards")
# 

set.seed(150)

## Obfuscate data
# https://clinepidb.org/ce/app/record/dataset/DS_5c41b87221
dat <- read_csv("data/MALED_60m_height_weight_zscores.csv")

childhealth_maled <- dat %>%
  select(subjid = `Participant ID`, sex = Sex, country = Country, agedays = `Age (days)`, 
         wtkg = `Weight (kg)`, stcm = `Stature (cm)`, htcm = `Height (cm)`, 
         lncm = `Recumbent length (cm)`, lh_used = `Recumbent length or height used for stature`,
         hccm = `Head circumference (cm)`, lhaz = `Length- or height-for-age z-score`,
         haz = `Height-for-age z-score`, laz= `Length-for-age z-score`, waz = `Weight-for-age z-score`,
         hcaz = `Head circumference-for-age z-score`, whz = `Weight-for-length or -height z-score`
         )

childhealth_maled_description <- list(subjid = "unique identifyer of each child",
                                      country = "Label for the varied countries",
                                      sex = "Male or Female",
                                      agedays = "Age in days",
                                      wtkg = "Weight measurement in kg (0.8-20.5)",
                                      stcm = "Stature either Length or height in cm", 
                                      htcm = "Height in cm",
                                      lncm = "Length in cm",
                                      lh_used = "Lenght or Height used for stature",
                                      hccm = "Head Circumference in cm",
                                      lhaz = "Length or Height for age in SDS relative to WHO child growth standard",
                                      haz = "Height for age in SDS relative to WHO child growth standard",
                                      laz = "Length for age in SDS relative to WHO child growth standard",
                                      waz = "Weight for age in SDS relative to WHO child growth standard",
                                      hcaz = "Head cirumference for age in SDS relative to WHO child growth standard",
                                      whz = "Weight for height or lenght in SDS relative to WHO child growth standard")
  
# dat_ob %>%
#   ggplot(aes(x = agedays, y = htcm, group = subjid)) +
#   geom_line() +
#   geom_point() +
#   facet_grid(rows = vars(country), cols = vars(sex))


# https://github.com/stefvanbuuren/brokenstick

t.dat <- tempfile()
download("https://github.com/stefvanbuuren/brokenstick/raw/71dc99e62ce57b58d5c1d2a1074fbd4bf394e559/data/smocc_hgtwgt.rda",t.dat, mode = "wb")

load(t.dat)

childhealth_dutch <- smocc_hgtwgt %>%
  select(subjid, sex, agedays, gagebrth, htcm, wtkg, haz, waz)

childhealth_dutch_description <- list(subjid = "unique identifyer of each child",
                                      sex = "Male or Female",
                                      agedays = "Age in days",
                                      gagebrth = "Gestational age at birth (days)",
                                      htcm = "Length/height in cm (34-102)",
                                      wtkg = "Weight measurement in kg (0.8-20.5)",
                                      haz = "Height in SDS relative to WHO child growth standard",
                                      waz = "Weight in SDS relative to WHO child growth standard")

hbgd_temp <- tempfile()
download('https://github.com/HBGDki/hbgd/raw/master/data/cpp.rda', hbgd_temp, mode = 'wb')
load(hbgd_temp)

childhealth_us <- cpp %>%
  select(subjid, sex, agedays, gagebrth, htcm, wtkg, haz, waz, mrace, mage, meducyrs, ses)

childhealth_us_description <- list(subjid = "unique identifyer of each child",
                                   sex = "Male or Female",
                                   agedays = "Age in days",
                                   gagebrth = "Gestational age at birth (days)",
                                   htcm = "Length/height in cm (34-102)",
                                   wtkg = "Weight measurement in kg (0.8-20.5)",
                                   haz = "Height in SDS relative to WHO child growth standard",
                                   waz = "Weight in SDS relative to WHO child growth standard",
                                   mrace = "Race of the mother",
                                   mage = "Mother age at child birth",
                                   meducyrs = "Educational years of mother",
                                   ses = "Socioeconomic status of mother")
                                   

# Birthweight data

birth_dutch <- smocc_hgtwgt %>%
  group_by(subjid) %>%
  summarise(sex = sex[1], birthwt = birthwt[1]) %>%
  ungroup()

birth_us <- cpp %>%
  group_by(subjid) %>%
  summarise(sex = sex[1], birthwt = birthwt[1], birthlen = birthlen[1], 
            apgar1 = apgar1[1], apgar5 = apgar5[1], mrace = mrace[1], 
            mage = mage[1], smoked = smoked[1], meducyrs = meducyrs[1], ses = ses[1]) %>%
  ungroup()

birth_us_description <- list(subjid = "unique identifyer of each child",
                                   sex = "Male or Female",
                                   birthwt = "Birthweight of the child",
                                   birthlen = "Birth length of the child",
                                   apgar1 = "a quick test performed on a baby at 1 minute after birth. https://medlineplus.gov/ency/article/003402.htm",
                                   apgar5 = "a quick test performed on a baby at 5 minutes after birth. https://medlineplus.gov/ency/article/003402.htm",
                                   mrace = "Race of the mother",
                                   mage = "Mother age at child birth",
                                   smoked = "If the mother smoked (1) or didn't smoke (0)",
                                   meducyrs = "Educational years of mother",
                                   ses = "Socioeconomic status of mother") 

birth_dutch_descriptions <- birth_us_description[1:3]

## WHO means and sds

weight_coef <- growthstandards::who_coefs$wtkg_agedays$Male$data %>%
  as_tibble() %>%
  filter(x < 900) %>%
  select(agedays = x, mean = m, cv = s, l = l) %>%
  mutate(sex = "Female") %>%
  bind_rows(
    growthstandards::who_coefs$wtkg_agedays$Female$data %>%
      as_tibble() %>%
      filter(x < 900) %>%
      select(agedays = x, mean = m, cv = s, l = l) %>%
      mutate(sex = "Male")
  ) %>%
  mutate(sd = mean * cv) %>%
  select(agedays, sex, mean, sd, cv, l)


height_coef <- growthstandards::who_coefs$htcm_agedays$Female$data %>%
  as_tibble() %>%
  filter(x < 900) %>%
  select(agedays = x, mean = m, cv = s, l = l) %>%
  mutate(sex = "Female") %>%
  bind_rows(
    growthstandards::who_coefs$htcm_agedays$Male$data %>%
      as_tibble() %>%
      filter(x < 900) %>%
      select(agedays = x, mean = m, cv = s, l = l) %>%
      mutate(sex = "Male")
  ) %>%
  mutate(sd = mean * cv) %>%
  select(agedays, sex, mean, sd, cv, l)

wh_coef_description = list(agedays = "Age of child in days",
                               sex = "The gender of the child",
                               mean = "The mean for a child at agedays",
                               cv = "The coefficient of variation for children at agedays - https://en.wikipedia.org/wiki/Coefficient_of_variation",
                               l = "The box-cox tranformation for children at agedays - https://www.cdc.gov/nchs/data/nhsr/nhsr063.pdf",
                               sd = "The standard deviation of weights for children at agedays")


### 365 days data

days_365 <- bind_rows(
  childhealth_dutch %>%
    filter(agedays %in% c(363:369)) %>%
    select(subjid, sex, htcm, wtkg, haz, waz) %>%
    mutate(country = "Netherlands", subjid = as.character(subjid)),
  
  childhealth_maled %>%
    filter(agedays %in% c(363:369)) %>%
    select(subjid, sex, htcm = stcm, wtkg, lhaz, waz, country) %>%
    rename(haz = lhaz),
  
  childhealth_us %>%
    filter(agedays == 366) %>%
    select(subjid, sex, htcm, wtkg, haz, waz) %>%
    mutate(country = "United States", subjid = as.character(subjid))
) %>%
  as_tibble()

days_365_description <- list(subjid = "unique identifyer of each child",
                             sex = "Male or Female",
                             wtkg = "Weight measurement in kg (0.8-20.5)",
                             htcm = "Height in cm",
                             haz = "Height for age in SDS relative to WHO child growth standard",
                             waz = "Weight for age in SDS relative to WHO child growth standard",
                             country = "Label for the varied countries")


childhealth_summary <- bind_rows(
  childhealth_dutch %>%
    select(subjid, agedays, sex, htcm, wtkg, haz, waz) %>%
    mutate(country = "Netherlands", subjid = as.character(subjid)),
  
  childhealth_maled %>%
    select(subjid, agedays,  sex, htcm = stcm, wtkg, lhaz, waz, country) %>%
    rename(haz = lhaz),
  
  childhealth_us %>%
    select(subjid, agedays, sex, htcm, wtkg, haz, waz) %>%
    mutate(country = "United States", subjid = as.character(subjid))
) %>%
  as_tibble() %>%
  group_by(subjid, sex, country) %>%
  arrange(agedays) %>%
  summarise(haz_mean = mean(haz, na.rm = TRUE), waz_mean = mean(waz), 
            observations = n(), agedays_last = agedays[n()], agedays_first = agedays[1],
            haz_last = haz[n()], haz_first = haz[1], waz_first = waz[1], waz_last = waz[n()]) %>%
  ungroup()

childhealth_summary_description <- list(subjid = "unique identifyer of each child",
                             sex = "Male or Female",
                             country = "Label for the varied countries",
                             haz_mean = "The average HAZ score over all measurements",
                             waz_mean = "The average WAZ score over all measurements",
                             observations = "Number of observations for that subject",
                             agedays_last = "The age in days for the HAZ and WAZ last variable",
                             agedays_first = "The age in days for the HAZ and WAZ first variable",
                             haz_last = "The first HAZ measurement on the subject for age in days",
                             haz_first = "The last HAZ measurement on the subject for age in days",
                             waz_last = "The last WAZ measurement on the subject for age in days",
                             waz_first = "The first WAZ measurement on the subject for age in days"
                             )


  
    
package_name_text <- "data4childhealth"
base_folder <- "../../byuidatascience/"
user <- "byuidatascience"
package_path <- str_c(base_folder, package_name_text)

####  Run to create repo locally and on GitHub.  ######

# github_info <- dpr_create_github(user, package_name_text)
# 
# package_path <- dpr_create_package(list_data = NULL,
#                                     package_name = package_name_text,
#                                     export_folder = base_folder,
#                                     git_remote = github_info$clone_url)

 ##### dpr_delete_github(user, package_name_text) ####
 
####### End create section
github_info <- dpr_info_github(user, package_name_text)
usethis::proj_set(package_path)

dpr_export(childhealth_maled, export_folder = path(package_path, "data-raw"), 
           export_format = c(".csv", ".json", ".xlsx", ".sav", ".dta"))

dpr_export(childhealth_dutch, export_folder = path(package_path, "data-raw"), 
           export_format = c(".csv", ".json", ".xlsx", ".sav", ".dta"))

dpr_export(childhealth_us, export_folder = path(package_path, "data-raw"), 
           export_format = c(".csv", ".json", ".xlsx", ".sav", ".dta"))

dpr_export(birth_us, export_folder = path(package_path, "data-raw"), 
           export_format = c(".csv", ".json", ".xlsx", ".sav", ".dta"))

dpr_export(birth_dutch, export_folder = path(package_path, "data-raw"), 
           export_format = c(".csv", ".json", ".xlsx", ".sav", ".dta"))

dpr_export(height_coef, export_folder = path(package_path, "data-raw"), 
           export_format = c(".csv", ".json", ".xlsx", ".sav", ".dta"))

dpr_export(weight_coef, export_folder = path(package_path, "data-raw"), 
           export_format = c(".csv", ".json", ".xlsx", ".sav", ".dta"))

dpr_export(days_365, export_folder = path(package_path, "data-raw"), 
           export_format = c(".csv", ".json", ".xlsx", ".sav", ".dta"))

dpr_export(childhealth_summary, export_folder = path(package_path, "data-raw"), 
           export_format = c(".csv", ".json", ".xlsx", ".sav", ".dta"))



usethis::use_data(childhealth_dutch, childhealth_us, birth_dutch, 
                  birth_us, childhealth_maled, 
                  height_coef, weight_coef, days_365, childhealth_summary, overwrite = TRUE)

dpr_document(days_365, extension = ".R.md", export_folder = usethis::proj_get(),
             object_name = "days_365", title = "Child height and weight measurements for all data from three studies at one year of age.",
             description = "A subset of measurements from the three studies.",
             source = "https://github.com/stefvanbuuren/brokenstick, https://github.com/hafen/hbgd, and https://clinepidb.org/ce/app/record/dataset/DS_5c41b87221",
             var_details = days_365_description)


dpr_document(childhealth_summary, extension = ".R.md", export_folder = usethis::proj_get(),
             object_name = "childhealth_summary", title = "Child height and weight HAZ summaries",
             description = "For all data from three studies",
             source = "https://github.com/stefvanbuuren/brokenstick, https://github.com/hafen/hbgd, and https://clinepidb.org/ce/app/record/dataset/DS_5c41b87221",
             var_details = childhealth_summary_description)





dpr_document(childhealth_dutch, extension = ".R.md", export_folder = usethis::proj_get(),
             object_name = "childhealth_dutch", title = "Child height and weight measurements",
             description = "Longitudinal height and weight measurements during ages 0-2 years for a representative sample of 1,933 Dutch children born in 1988-1989.",
             source = "https://github.com/stefvanbuuren/brokenstick",
             var_details = childhealth_dutch_description)

dpr_document(childhealth_us, extension = ".R.md", export_folder = usethis::proj_get(),
             object_name = "childhealth_us", title = "Child height and weight measurements",
             description = "Subset of growth data from the collaborative perinatal project (CPP).",
             source = "https://github.com/hafen/hbgd",
             var_details = childhealth_us_description)

dpr_document(childhealth_maled, extension = ".R.md", export_folder = usethis::proj_get(),
             object_name = "childhealth_maled", title = "Child height, weight, head circumference measurements",
             description = "Subset of growth data from the Malnutrition and Enteric Disease Study (MAL-ED).",
             source = "https://www.fic.nih.gov/About/Staff/Pages/mal-ed.aspx and https://clinepidb.org/ce/app/record/dataset/DS_5c41b87221",
             var_details = childhealth_maled_description)


dpr_document(birth_us, extension = ".R.md", export_folder = usethis::proj_get(),
             object_name = "birth_us", title = "Child birth data",
             description = "Subset of growth data from the collaborative perinatal project (CPP).",
             source = "https://github.com/hafen/hbgd",
             var_details = birth_us_description)

dpr_document(birth_dutch, extension = ".R.md", export_folder = usethis::proj_get(),
             object_name = "birth_dutch", title = "Child birth data",
             description = "Measurements during ages 0-2 years for a representative sample of 1,933 Dutch children born in 1988-1989",
             source = "https://github.com/stefvanbuuren/brokenstick",
             var_details = birth_dutch_descriptions)

dpr_document(weight_coef, extension = ".R.md", export_folder = usethis::proj_get(),
             object_name = "weight_coef", title = "WHO coeficients for weight Z-score calculations",
             description = "See https://www.cdc.gov/nchs/data/nhsr/nhsr063.pdf for a desciption on how calculations are made.  However, the CDC has different coefficients.",
             source = "https://github.com/hafen/growthstandards",
             var_details = wh_coef_description)

dpr_document(height_coef, extension = ".R.md", export_folder = usethis::proj_get(),
             object_name = "height_coef", title = "WHO coeficients for height Z-score calculations",
             description = "See https://www.cdc.gov/nchs/data/nhsr/nhsr063.pdf for a desciption on how calculations are made.  However, the CDC has different coefficients.  The l values were all 1 so they were removed",
             source = "https://github.com/hafen/growthstandards",
             var_details = wh_coef_description)

dpr_readme(usethis::proj_get(), package_name_text, user)


dpr_write_script(folder_dir = package_path, r_read = "scripts/childhealth_package.R", 
                 r_folder_write = "data-raw", r_write = str_c(package_name_text, ".R"))
devtools::document(package_path)
dpr_push(folder_dir = package_path, message = "'documentation'", repo_url = NULL)
