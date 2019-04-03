#' promise
#' A data package for the PROMISE database.
#' @docType package
#' @aliases promise-package
#' @title Package Title
#' @author Daniel Loewenstein, \email{loewenstein.daniel@gmail.com}, Karin Johansson, \email{karin.g.johansson@gmail.com}
#' @name promise
#' @description Datapackage for demographics and ecg data derived from Duke University Hospital 2002-2017.
#' @details Use \code{data(package='promise')$results[, 3]} to see a list of available data sets in this data package
#'     and/or DataPackageR::load_all
#' _datasets() to load them.
#' @seealso
#' \link{promiseData}
#' \link{ecg}
NULL


#' @name ecg
#' @docType data
#' @title PROMISE ECG data
#' @keywords datasets
#' @format a \code{data.table} with 125462 observations on the following 23 variables:
#' \describe{
#' \item{\code{MRN}}{character Medical record number}
#' \item{\code{ECGDate}}{POSIXct ECG exam date, YYYY-MM-DD HH:MM:SS}
#' \item{\code{PRInterval}}{numeric Interval between start of P wave and start QRS, ms}
#' \item{\code{QRSDur}}{numeric Duration of the QRS-complex, ms}
#' \item{\code{QTCorrected}}{numeric Corrected QT-interval according to Bazzet's formula, ms}
#' \item{\code{AXIS}}{numeric R wave axis, degree}
#' \item{\code{original_ecg_statement}}{character Original diagnosis statement in raw ECG XML}
#' \item{\code{filepath}}{character Name of the raw ECG XML file}
#' \item{\code{Normal_conduction}}{logical}
#' \item{\code{Sinus_rhytm}}{numeric}
#' \item{\code{SVT}}{numeric Supraventricular tachycardia (see details)}
#' \item{\code{Junctional_rhythm}}{numeric Rythm originating from AV node or His Bundle}
#' \item{\code{LBBB}}{numeric Left Bundle Branch Block, conventional criteria}
#' \item{\code{RBBB}}{numeric Right Bundle Branch Block}
#' \item{\code{RBBB_LAFB}}{logical Bifascicular Block, RBBB + LAFB}
#' \item{\code{RBBB_LPFB}}{logical Bifascicular Block, RBBB + LPFB}
#' \item{\code{IVCD}}{numeric Non-specific Intraventricular Conduction Delay}
#' \item{\code{LAFB}}{numeric Left Anterior Fascicular Block}
#' \item{\code{LPFB}}{numeric Left Posterior Fascicular Block}
#' \item{\code{AFIB}}{numeric Atrial Fibrillation}
#' \item{\code{PACE}}{numeric Paced rhytm, eg. pacemaker}
#' \item{\code{WPW}}{numeric Wolf-Parkinson White, prexcitation}
#' \item{\code{Exclude}}{numeric Diagnosis statement indicative for exclusion, (see details)}
#' }
#' @details
#' Date of data extraction 2017-03-31
#'  \describe{
#'  \item{Normal_conduction}{See end \code{vignette("promise", package = "promise")} for logic}
#'  \item{SVT}{= 1 if ecg diagnosis statement during parsing contained:
#'    \itemize{
#'      \item{Atrial reentry tachycardia}
#'      \item{SVT}
#'      \item{Flutter}
#'      \item{Supra ventricular tachycardia}
#'      \item{Atrial tachycardia}
#'      }}
#'  \item{Exclude}{= 1 if ecg diagnosis statement during parsing contained:
#'    \itemize{
#'      \item{strip}
#'      \item{lvad}
#'      \item{idioventricular rhythm}
#'      \item{ventricular tach}
#'      \item{isorhyth}
#'      \item{ventricular escape}
#'      \item{asys}
#'      \item{ventricular rhyt}
#'      \item{atrial lead}
#'      \item{stemi}
#'      }
#'  }
#'  }
#' @source The data comes from Duke University Hospital, Durham, NC, USA
#' @author Daniel Loewenstein, \email{loewenstein.daniel@gmail.com}
#' @seealso
#' \link{promise}
#' \link{promiseData}
"ecg"


#' @name promiseData
#' @docType data
#' @title Merged Echo and ECG data within 30days
#' @author Daniel Loewenstein, \email{loewenstein.daniel@gmail.com}, Karin Johansson, \email{karin.g.johansson@gmail.com}
#' @keywords datasets
#' @format a \code{tbl_df} with 93118 observations on the following 111 variables.:
#'\describe{
#' \item{\code{MRN}}{character Medical record number}
#' \item{\code{Echo.date}}{POSIXct Echo exam date, YYYY-MM-DD HH:MM:SS}
#' \item{\code{EF}}{character Ejection Fraction incl < or > signs}
#' \item{\code{EF.x}}{numeric Ejection Fraction, percentage units}
#' \item{\code{AS.severity}}{a factor with levels \code{AUTOGRAFT} \code{BIOPROSTHETIC AoV} \code{HOMOGRAFT} \code{INDETERMINATE FOR AS} \code{MECH PROSTHETIC AoV} \code{MILD AS} \code{MODERATE AS} \code{No AS} \code{OTHER PROSTHETIC AoV} \code{PROSTHETIC AoV} \code{SEVERE AS} \code{TRIVIAL AS}}
#' \item{\code{MS.severity}}{a factor with levels \code{BIOPROSTHETIC MV} \code{INDETERMINATE FOR MS} \code{MECH PROSTHETIC MV} \code{MILD MS} \code{MODERATE MS} \code{No MS} \code{PROSTHETIC MV RING} \code{SEVERE MS} \code{TRIVIAL MS} \code{VALVE CLIP}}
#' \item{\code{AR.severity}}{a factor with levels \code{INDETERMINATE FOR AR} \code{MILD AR} \code{MODERATE AR} \code{No AI} \code{No AR} \code{SEVERE AR} \code{TRIVIAL AR}}
#' \item{\code{MR.severity}}{a factor with levels \code{INDETERMINATE FOR MR} \code{MILD MR} \code{MODERATE MR} \code{No MR} \code{SEVERE MR} \code{TRIVIAL MR}}
#' \item{\code{PAP.mm.hg}}{numeric Estimated Right Ventricular Systolic Pressure from Echo, mmHg}
#' \item{\code{echo_indication}}{character Indication for Echo exam grouped in reasonable headings}
#' \item{\code{ECGDate}}{POSIXct ECG exam date, YYYY-MM-DD HH:MM:SS}
#' \item{\code{PRInterval}}{numeric Interval between start of P wave and start QRS, ms}
#' \item{\code{QRSDur}}{numeric Duration of the QRS-complex, ms}
#' \item{\code{QTCorrected}}{numeric Corrected QT-interval according to Bazzet's formula, ms}
#' \item{\code{AXIS}}{numeric R wave axis, degree}
#' \item{\code{original_ecg_statement}}{character Original diagnosis statement in raw ECG XML}
#' \item{\code{filepath}}{character Name of the raw ECG XML file}
#' \item{\code{Normal_conduction}}{logical}
#' \item{\code{Sinus_rhytm}}{numeric}
#' \item{\code{SVT}}{numeric Supraventricular tachycardia (see details)}
#' \item{\code{Junctional_rhythm}}{numeric Rythm originating from AV node or His Bundle}
#' \item{\code{LBBB}}{numeric Left Bundle Branch Block, conventional criteria}
#' \item{\code{RBBB}}{numeric Right Bundle Branch Block}
#' \item{\code{RBBB_LAFB}}{logical Bifascicular Block, RBBB + LAFB}
#' \item{\code{RBBB_LPFB}}{logical Bifascicular Block, RBBB + LPFB}
#' \item{\code{IVCD}}{numeric Non-specific Intraventricular Conduction Delay}
#' \item{\code{LAFB}}{numeric Left Anterior Fascicular Block}
#' \item{\code{LPFB}}{numeric Left Posterior Fascicular Block}
#' \item{\code{AFIB}}{numeric Atrial Fibrillation}
#' \item{\code{PACE}}{numeric Paced rhytm, eg. pacemaker}
#' \item{\code{WPW}}{numeric Wolf-Parkinson White, prexcitation}
#' \item{\code{Exclude}}{numeric Diagnosis statement indicative for exclusion, (see details)}
#' \item{\code{Gender}}{a factor with levels \code{FEMALE} \code{MALE}}
#' \item{\code{Race}}{a factor with levels \code{Mix} \code{American.native} \code{Native.hawaiian.or.other.pacific.islander} \code{Caucasian} \code{African.american} \code{NA} \code{Asian} \code{Other}}
#' \item{\code{DOB}}{POSIXct Date Of Birth, YYYY-MM-DD HH:MM:SS}
#' \item{\code{Age.at.ECG}}{numeric Age at time of ECG exam, years}
#' \item{\code{Death.index}}{a factor with levels \code{ALIVE} \code{DECEASED}}
#' \item{\code{DOD}}{POSIXct Date Of Death, YYYY-MM-DD HH:MM:SS}
#' \item{\code{AF.Code}}{numeric ICD-code}
#' \item{\code{AF.Date}}{POSIXct Date of diagnosis, YYYY-MM-DD HH:MM:SS}
#' \item{\code{AF}}{numeric Atrial Fibrillation/Flutter}
#' \item{\code{CAD.Code}}{numeric ICD-code}
#' \item{\code{CAD.Date}}{POSIXct Date of diagnosis, YYYY-MM-DD HH:MM:SS}
#' \item{\code{CAD}}{numeric Coronary Atery Disease}
#' \item{\code{CHD.Code}}{numeric ICD-code}
#' \item{\code{CHD.Date}}{POSIXct Date of diagnosis, YYYY-MM-DD HH:MM:SS}
#' \item{\code{CHD}}{numeric Congenital Heart Disease}
#' \item{\code{COPD.Code}}{numeric ICD-code}
#' \item{\code{COPD.Date}}{POSIXct Date of diagnosis, YYYY-MM-DD HH:MM:SS}
#' \item{\code{COPD}}{numeric Chronic Obstructive Pulmonary Disorder}
#' \item{\code{DM.Code}}{numeric ICD-code}
#' \item{\code{DM.Date}}{POSIXct Date of diagnosis, YYYY-MM-DD HH:MM:SS}
#' \item{\code{DM}}{numeric Diabetes Mellitus}
#' \item{\code{HF.Code}}{numeric ICD-code}
#' \item{\code{HF.Date}}{POSIXct Date of diagnosis, YYYY-MM-DD HH:MM:SS}
#' \item{\code{HF}}{numeric Heart Failure}
#' \item{\code{HTN.Code}}{numeric ICD-code}
#' \item{\code{HTN.Date}}{POSIXct Date of diagnosis, YYYY-MM-DD HH:MM:SS}
#' \item{\code{HTN}}{numeric Hypertension}
#' \item{\code{OSA.Code}}{numeric ICD-code}
#' \item{\code{OSA.Date}}{POSIXct Date of diagnosis, YYYY-MM-DD HH:MM:SS}
#' \item{\code{OSA}}{numeric Obstructive Sleep Apnea}
#' \item{\code{ICD.CPT.Code}}{character ICD-code for device}
#' \item{\code{CRT.Date}}{POSIXct Date of diagnosis, YYYY-MM-DD HH:MM:SS}
#' \item{\code{CRT}}{numeric Cardiac Resynchronization Therapy}
#' \item{\code{LVAD.Code}}{character ICD-code}
#' \item{\code{LVAD.Date}}{POSIXct Date of diagnosis, YYYY-MM-DD HH:MM:SS}
#' \item{\code{LVAD}}{numeric Left Ventricular Assist Device}
#' \item{\code{HTx.Code}}{character ICD-code}
#' \item{\code{HTx.Date}}{POSIXct Date of diagnosis, YYYY-MM-DD HH:MM:SS}
#' \item{\code{HTx}}{numeric Heart Transplantation}
#' \item{\code{ClassIII.Rx.Name}}{character ClassIII Antiarrythmica, Drug name +/- dosage}
#' \item{\code{ClassIII.Rx.Start}}{POSIXct Start of prescription}
#' \item{\code{ClassIII.Rx.End}}{POSIXct End of prescription}
#' \item{\code{ClassIc.Rx.Name}}{character ClassIc Antiarrythmica, Drug name +/- dosage}
#' \item{\code{ClassIc.Rx.Start}}{POSIXct Start of prescription}
#' \item{\code{ClassIc.Rx.End}}{POSIXct End of prescription}
#' \item{\code{ACEI.Rx.Name}}{character Angiotensin converting Enzyme Inhibitor, Drug name +/- dosage}
#' \item{\code{ACEI.Rx.Start}}{POSIXct Start of prescription}
#' \item{\code{ACEI.Rx.End}}{POSIXct End of prescription}
#' \item{\code{Amiodarone.Rx.Name}}{character Amiodarone Antiarrythmica, Drug name +/- dosage}
#' \item{\code{Amiodarone.Rx.Start}}{POSIXct Start of prescription}
#' \item{\code{Amiodarone.Rx.End}}{POSIXct End of prescription}
#' \item{\code{BB.Rx.Name}}{character Beta-Blocker, Drug name +/- dosage}
#' \item{\code{BB.Rx.Start}}{POSIXct Start of prescription}
#' \item{\code{BB.Rx.End}}{POSIXct End of prescription}
#' \item{\code{ClassIII.Rx.OMR.Name}}{character Outpatient medication, see previous}
#' \item{\code{ClassIII.Rx.OMR.Date}}{POSIXct Date of prescription}
#' \item{\code{ClassIc.Rx.OMR.Name}}{character Outpatient medication, see previous}
#' \item{\code{ClassIc.Rx.OMR.Date}}{POSIXct Date of prescription}
#' \item{\code{ACEI.Rx.OMR.Name}}{character Outpatient medication, see previous}
#' \item{\code{ACEI.Rx.OMR.Date}}{POSIXct Date of prescription}
#' \item{\code{Amiodarone.Rx.OMR.Name}}{character Outpatient medication, see previous}
#' \item{\code{Amiodarone.Rx.OMR.Date}}{POSIXct Date of prescription}
#' \item{\code{BB.Rx.OMR.Name}}{character Outpatient medication, see previous}
#' \item{\code{BB.Rx.OMR.Date}}{POSIXct Date of prescription}
#' \item{\code{ClassIII.Rx}}{numeric ClassIII Antiarrythmica indicator}
#' \item{\code{ClassIc.Rx}}{numeric ClassIc Antiarrythmica indicator}
#' \item{\code{ACEI.Rx}}{numeric Angiotensin Converting Enzyme Inhibitor indicator}
#' \item{\code{Amiodarone.Rx}}{numeric Amiodarone Antiarrythmica indicator}
#' \item{\code{BB.Rx}}{numeric Beta-Blocker indicator}
#' \item{\code{Na.lab.Date}}{POSIXct Date of Lab test, YYYY-MM-DD HH:MM:SS}
#' \item{\code{Na.lab.Value}}{numeric Sodium value, mmol/L}
#' \item{\code{K.lab.Date}}{POSIXct Date of Lab test, YYYY-MM-DD HH:MM:SS}
#' \item{\code{K.lab.Value}}{numeric Potassium value, mmol/L}
#' \item{\code{BNP.lab.Date}}{POSIXct Date of Lab test, YYYY-MM-DD HH:MM:SS}
#' \item{\code{BNP.lab.Value}}{numeric B-type Natriuretic Peptide value, pg/mL}
#' \item{\code{ProBNP.lab.Date}}{POSIXct Date of Lab test, YYYY-MM-DD HH:MM:SS}
#' \item{\code{ProBNP.lab.Value}}{numeric N-terminal (NT)-pro hormone BNP value, pg/mL}
#' \item{\code{GFR.lab.Date}}{POSIXct Date of Lab test, YYYY-MM-DD HH:MM:SS}
#' \item{\code{GFR.lab.Value}}{numeric Glomerular Filtration Rate, ml/min/1.73m2}
#'  }
#' @details
#' Date of data extraction 2017-03-31
#' 
#'  \describe{
#'  \item{Normal_conduction}{See end \code{vignette("promise", package = "promise")} for logic}
#'  \item{SVT}{= 1 if ecg diagnosis statement during parsing contained:
#'    \itemize{
#'      \item{Atrial reentry tachycardia}
#'      \item{SVT}
#'      \item{Flutter}
#'      \item{Supra ventricular tachycardia}
#'      \item{Atrial tachycardia}
#'      }}
#'  \item{Exclude}{= 1 if ecg diagnosis statement during parsing contained:
#'    \itemize{
#'      \item{strip}
#'      \item{lvad}
#'      \item{idioventricular rhythm}
#'      \item{ventricular tach}
#'      \item{isorhyth}
#'      \item{ventricular escape}
#'      \item{asys}
#'      \item{ventricular rhyt}
#'      \item{atrial lead}
#'      \item{stemi}
#'      }
#'  }
#'  }
#' @source The data comes from Duke University Hospital, Durham, NC, USA.
#' @seealso
#' \link{promise}
#' \link{ecg}
"promiseData"
