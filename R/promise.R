#' promise
#' A data package for promise.
#' @docType package
#' @aliases promise-package
#' @title Package Title
#' @name promise
#' @description A description of the data package
#' \describe{
#'    \item{MRN}{Duke Medical Record Number}
#'    \item{Echo.date}{Echo exam date Date}
#'    \item{EF}{Ejection fraction (text)}
#'    \item{EF.x}{Ejection fraction (numeric) (\%)}
#'    \item{AS.severity}{Aortic valve stenosis severity (Text)}
#'    \item{MS.severity}{Mitral valve stenosis severity (Text)}
#'    \item{AR.severity}{Atrial regurgiation severity (Text)}
#'    \item{MR.severity}{Mitral regurgiation severity (Text)}
#'    \item{PAP.mm.hg}{Pulmonary arterial pressure (mm Hg)}
#'    \item{ECGDate}{ECG date}
#'    \item{PRInterval}{PR interval (ms)}
#'    \item{QRSDur}{QRS duration (ms)}
#'    \item{QTCorrected}{QT interval corrected (ms)}
#'    \item{AXIS}{R axis}
#'    \item{filepath}{relative path to ecg xml file}
#'    \item{Normal_conduction}{Normal conduciton 1/0 = yes/no}
#'    \item{Sinus_rhytm}{Sinus rhythm 1/0 = yes/no}
#'    \item{SVT}{Supra ventricular tachycardia 1/0 = yes/no}
#'    \item{Junctional_rhythm}{Junctional rhythm 1/0 = yes/no}
#'    \item{LBBB}{Left bundle branch block 1/0 = yes/no}
#'    \item{RBBB}{Right bundle branch block 1/0 = yes/no}
#'    \item{RBBB_LAFB}{Right bundle branch block + Left anterior fasicular block 1/0 = yes/no}
#'    \item{RBBB_LPFB}{Right bundle branch block + Left posterior fasicular block 1/0 = yes/no}
#'    \item{IVCD}{Intraventricular conduction delay 1/0 = yes/no}
#'    \item{LAFB}{Left anterior fascicular block 1/0 = yes/no}
#'    \item{LPFB}{Left posterior fascicular block 1/0 = yes/no}
#'    \item{AFIB}{Atrial fibrillation or flutter 1/0 = yes/no}
#'    \item{PACE}{Paced ECG rhythm 1/0 = yes/no}
#'    \item{WPW}{Wolf Parkinsson White 1/0 = yes/no}
#'    \item{Exclude}{Exclusion pattern 1/0 = yes/no}
#'    \item{Gender}{MALE/FEMALE}
#'    \item{Race}{Race multiple}
#'    \item{DOB}{Date of birth Date}
#'    \item{Age.at.ECG}{Age at ECG exam Years}
#'    \item{Death.index}{Dead or Alive ALIVE/DECEASED}
#'    \item{DOD}{Date of death Date}
#'    \item{AF.Code}{ICD Code}
#'    \item{AF.Date}{Date of diagnosis Date}
#'    \item{AF}{1/0 = yes/no}
#'    \item{CAD.Code}{Coronary artery disease ICD Code}
#'    \item{CAD.Date}{Coronary artery disease Date of diagnosis Date}
#'    \item{CAD}{Coronary artery disease 1/0 = yes/no}
#'    \item{CHD.Code}{Chronic heart disease ICD Code}
#'    \item{CHD.Date}{Chronic heart disease Date of diagnosis Date}
#'    \item{CHD}{Chronic heart disease 1/0 = yes/no}
#'    \item{COPD.Code}{Chronic obstructive pulmonary disease ICD Code}
#'    \item{COPD.Date}{Chronic obstructive pulmonary disease Date of diagnosis Date}
#'    \item{COPD}{Chronic obstructive pulmonary disease 1/0 = yes/no}
#'    \item{ICD.CPT.Code}{Cardiac resynchronization therapy ICD Code}
#'    \item{CRT.Date}{Cardiac resynchronization therapy Date of implantation Date}
#'    \item{CRT}{Cardiac resynchronization therapy 1/0 = yes/no}
#'    \item{Censor}{Considered Censor 1/0 = yes/no}
#'    \item{DM.Code}{Diabetes mellitus ICD Code}
#'    \item{DM.Date}{Diabetes mellitus Date of diagnosis Date}
#'    \item{DM}{Diabetes mellitus 1/0 = yes/no}
#'    \item{HF.Code}{Heart failure ICD Code}
#'    \item{HF.Date}{Heart failure Date of diagnosis Date}
#'    \item{HF}{Heart failure 1/0 = yes/no}
#'    \item{HTN.Code}{Hypertension ICD Code}
#'    \item{HTN.Date}{Hypertension Date}
#'    \item{HTN}{Hypertension 1/0 = yes/no}
#'    \item{HTx.Code}{Heart transplantation ICD Code}
#'    \item{HTx.Date}{Heart transplantation Date of transplantation Date}
#'    \item{HTx}{Heart transplantation 1/0 = yes/no}
#'    \item{LVAD.Code}{Left ventricular assist device ICD Code}
#'    \item{LVAD.Date}{Left ventricular assist device Date of implantation Date}
#'    \item{LVAD}{Left ventricular assist device 1/0 = yes/no}
#'    \item{OSA.Code}{Obstructive sleep apnea ICD Code}
#'    \item{OSA.Date}{Obstructive sleep apnea Date of diagnosis Date}
#'    \item{OSA}{Obstructive sleep apnea 1/0 = yes/no}
#'    \item{ClassIII.Rx.Name}{Class III antiarrythmia Name}
#'    \item{ClassIII.Rx.Start}{Class III antiarrythmia Start date}
#'    \item{ClassIII.Rx.End}{Class III antiarrythmia End date}
#'    \item{ClassIII.Rx}{Class III antiarrythmia 1/0 = yes/no}
#'    \item{ClassIII.Rx.OMR.Name}{Class III antiarrythmia Outpatient medication Name}
#'    \item{ClassIII.Rx.OMR.Date}{Class III antiarrythmia Outpatient medication Date}
#'    \item{ClassIc.Rx.Name}{Class Ic antiarrythmia Name}
#'    \item{ClassIc.Rx.Start}{Class Ic antiarrythmia Start date}
#'    \item{ClassIc.Rx.End}{Class Ic antiarrythmia End date}
#'    \item{ClassIc.Rx}{Class Ic antiarrythmia 1/0 = yes/no}
#'    \item{ClassIc.Rx.OMR.Name}{Class Ic antiarrythmia Outpatient medication Name}
#'    \item{ClassIc.Rx.OMR.Date}{Class Ic antiarrythmia Outpatient medication Date}
#'    \item{ACEI.Rx.Name}{ACE Inhibitor Name}
#'    \item{ACEI.Rx.Start}{ACE Inhibitor Start date}
#'    \item{ACEI.Rx.End}{ACE Inhibitor End date}
#'    \item{ACEI.Rx}{ACE Inhibitor 1/0 = yes/no}
#'    \item{ACEI.Rx.OMR.Name}{ACE Inhibitor  Outpatient medication Name}
#'    \item{ACEI.Rx.OMR.Date}{ACE Inhibitor  Outpatient medication Date}
#'    \item{Amiodarone.Rx.Name}{Amiodarone Name}
#'    \item{Amiodarone.Rx.Start}{Amiodarone Start date}
#'    \item{Amiodarone.Rx.End}{Amiodarone End date}
#'    \item{Amiodarone.Rx}{Amiodarone 1/0 = yes/no}
#'    \item{Amiodarone.Rx.OMR.Name}{Amiodarone Outpatient medication Name}
#'    \item{Amiodarone.Rx.OMR.Date}{Amiodarone Outpatient medication Date}
#'    \item{BB.Rx.Name}{Beta blocker Name}
#'    \item{BB.Rx.Start}{Beta blocker Start date}
#'    \item{BB.Rx.End}{Beta blocker End date}
#'    \item{BB.Rx}{Beta blocker 1/0 = yes/no}
#'    \item{BB.Rx.OMR.Name}{Beta blocker Outpatient medication Name}
#'    \item{BB.Rx.OMR.Date}{Beta blocker Outpatient medication Date}
#'    \item{Na.lab.Date}{Natrium blood Date}
#'    \item{Na.lab.Value}{Natrium blood text}
#'    \item{Na.lab.Value.x}{Natrium blood mmol/L}
#'    \item{K.lab.Date}{Potassium blood Date}
#'    \item{K.lab.Value}{Potassium blood text}
#'    \item{K.lab.Value.x}{Potassium blood mmol/L}
#'    \item{BNP.lab.Date}{Brain natriuretic peptide Date}
#'    \item{BNP.lab.Value}{Brain natriuretic peptide text}
#'    \item{BNP.lab.Value.x}{Brain natriuretic peptide}
#'    \item{ProBNP.lab.Date}{Pro - Brain natriuretic peptide Date}
#'    \item{ProBNP.lab.Value}{Pro - Brain natriuretic peptide text}
#'    \item{ProBNP.lab.Value.x}{Pro - Brain natriuretic peptide}
#'    \item{GFR.lab.Date}{Glomerular filtration rate Date}
#'    \item{GFR.lab.Value}{Glomerular filtration rate text}
#'    \item{GFR.lab.Value.x}{Glomerular filtration rate}
#' }
#'  @details
#'  \describe{
#'  \item{SVT}{= 1 if ecg statement contained:
#'    \itemize{
#'      \item{Atrial reentry tachycardia}
#'      \item{SVT}
#'      \item{Flutter}
#'      \item{Supra ventricular tachycardia}
#'      \item{Atrial tachycardia}
#'      }}
#'  \item{Exclude}{= 1 if ecg statement contained:
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
#' @details Use \code{data(package='promise')$results[, 3]} tosee a list of availabledata sets in this data package
#'     and/or DataPackageR::load_all
#' _datasets() to load them.
#' @seealso
#' \link{promise}
NULL