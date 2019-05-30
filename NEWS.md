# promise 0.1.4

DataVersion: 0.1.5
=======================

- Added new ECG variables:
    - VentricularRate, AtrialRate, QTInterval, PAxis, TAxis, QRSCount,
    QOnset, QOffset, POnset, POffset, TOffset, QRcFrederica
- Updated promiseData:
    - new data regarding death indicator and date of death pulled from 
    DEDUCE
- Fixed typo in set_data_path() example

# promise 0.1.3

## DataVersion: 0.1.4

* Added: ecg
* Changed: promise
Added ecg data available via `data(ecg)`

## DataVersion: 0.1.3

Added original ECG diagnosis statement

# promise 0.1.2

## DataVersion: 0.1.2

When multiple lab values for the same date script now returns mean. 
Removed `,` as thousand marker for correct coercion to numeric values.
Prettified terminal output and added more informative messages.

## DataVersion: 0.1.1

Updated and modernized the script, removed censor and endpoint since this might not be used by all.

## DataVersion: 0.1.0

First version of promise datapackage

