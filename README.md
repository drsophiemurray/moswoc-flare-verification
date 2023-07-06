# moswoc-flare-verification
Data and example code used for work on the paper 'Flare forecasting at the Met Office Space Weather Operations Centre' by Murray, S. A., et al in the Space Weather Journal (doi: 10.1002/2016SW001579). Please reference this repository as 

[![DOI](https://zenodo.org/badge/83428014.svg)](https://zenodo.org/badge/latestdoi/83428014)

The post-print of the paper is freely available on [arxiv](https://arxiv.org/abs/1703.06754), and ADS BibTex entry is below for convenience:

    @ARTICLE{2017SpWea..15..577M,
        author = {{Murray}, S.~A. and {Bingham}, S. and {Sharpe}, M. and {Jackson}, D.~R.},
        title = "{Flare forecasting at the Met Office Space Weather Operations Centre}",
        journal = {Space Weather},
        keywords = {space weather, solar physics, solar flares, operational forecasting, Astrophysics - Solar and Stellar Astrophysics, Physics -                     Data Analysis, Statistics and Probability, Physics - Space Physics},
        year = 2017,
        month = apr,
        volume = {15},
        number = {4},
        pages = {577-588},
        doi = {10.1002/2016SW001579},
        archivePrefix = {arXiv},
        eprint = {1703.06754},
        primaryClass = {astro-ph.SR},
        adsurl = {https://ui.adsabs.harvard.edu/abs/2017SpWea..15..577M},
       adsnote = {Provided by the SAO/NASA Astrophysics Data System}


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

License
-------

The content of this project is licensed under the [Creative Commons Attribution 4.0 license](https://creativecommons.org/licenses/by/4.0/), and the underlying source code used to format and display that content is licensed under the [MIT license](https://opensource.org/licenses/mit-license.php).


