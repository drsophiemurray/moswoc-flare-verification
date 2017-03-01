# moswoc-flare-verification
Data and code used for MOSWOC Flare Verification Paper

Data
----

* ``SRS_raw_fcast.txt`` includes the Poisson model forecasts for the MOSWOC Sunspot Region Summaries, in the format
  *  YYYY mm dd HHMM M-class% X-class% Forecaster_ID

* ``SRS_issued_fcast.txt`` includes the human-edited forecasts for the MOSWOC Sunspot Region Summaries, in the format
  *  YYYY mm dd HHMM M-class% X-class% Forecaster_ID

* ``IFF_fcast.txt`` includes the issued forecasts from the Space Weather Guidance Documents, in the format
  *  YYYY mm dd HH MM M_day1% M_day2% M_day3% M_day4% X_day1% X_day2% X_day3% X_day4%

* ``SWPC_fcast.txt`` includes the issued forecasts from SWPC for the same time period as ``IFF_fcast.txt``, in the format
  *  YYYY mm dd HH MM M_day1% M_day2% M_day3% M_day4% X_day1% X_day2% X_day3% X_day4%

* ``MX_list.txt`` includes the M- and X- class flares from the SWPC flare list, in the format
  *  YYYY mm dd start(HHMM) peak(HHMM) end(HHMM) flare_class_magnitude NOAA_active_region_number

Code
----

* ``IFF_validation.py`` is an example of how the forecasts were analysed to find out whether flares actually occurred or not during each 24-hour forecast window. The output data was then verified using the below R code.

* ``MOSWOC_validation.R`` shows examples of how the verification analysis was undertaken, e.g., making ROC curves and reliability diagrams.

Licence
-------

The content of this project is licensed under the [Creative Commons Attribution 4.0 license](https://creativecommons.org/licenses/by/4.0/), and the underlying source code used to format and display that content is licensed under the MIT license.