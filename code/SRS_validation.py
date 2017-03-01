'''
    Created on December 3, 2015
    
    @author: smurray
    
    Python Version:    2.7.2 (default, Oct  1 2012, 15:56:20)
    Working directory:     /home/smurray/workspace/verification
    
    Description:
    Check if there was a flare or not during forecast period,
    then create some files for verification (True/False,probability)
    This is for the raw stats model output in the SRS.
    
'''

import numpy as np
import datetime as dt

#forecast_file = '/Users/sophie/Dropbox/met_office_folders/ver_files/srs_fcast_issued.txt' #srs_fcast_raw.txt'
#flare_file = '/Users/sophie/Dropbox/met_office_folders/ver_files/mx_list.txt'
##forecast_windows = [1, 2, 3, 4] #days
#DIR = '/Users/sophie/Dropbox/met_office_folders/ver_files/srs_issued_logic/' #srs_raw_logic/

#forecast_file = '/home/somurray/moswoc_flare_verification_data/new_srs_fcast_issued.txt' #srs_fcast_raw.txt'
#flare_file = '/home/somurray/moswoc_flare_verification_data/new_mx_list.txt'
#forecast_windows = [1, 2, 3, 4] #days
#DIR = '/home/somurray/moswoc_flare_verification_data/new_srs_issued_logic/' #srs_raw_logic/

forecast_file = '/Users/sophie/Dropbox/moswoc_paper/data/new_srs_fcast_issued.txt' #srs_fcast_raw.txt'
flare_file = '/Users/sophie/Dropbox/moswoc_paper/data/new_mx_list.txt'
#forecast_windows = [1, 2, 3, 4] #days
DIR = '/Users/sophie/Dropbox/moswoc_paper/data/new_srs_issued_logic/' #srs_raw_logic/


def main():
    """Read file, 
       get time, 
       check if in flare list."""
    # First read observations
    # format: YYYY MM DD start_HHMM peak_HHMM end_HHMM flare_class ARNo
    obs = open(flare_file, 'r').readlines()
    m_obs = []
    x_obs = []
    # separate the M and X flares
    for line in obs:
        if 'M' in line:
            m_obs.append(line)
        elif 'X' in line:
            x_obs.append(line)
        else:
            print 'No M or X flare in ', line
    # grab the observation times
    m_obs_times = []
    for i in range(0, len(m_obs)):
        m_obs_time = dt.datetime.strptime(m_obs[i][0:15], '%Y %m %d %H%M')
        m_obs_times .append(m_obs_time)
    x_obs_times = []
    for i in range(0, len(x_obs)):
        x_obs_time = dt.datetime.strptime(x_obs[i][0:15], '%Y %m %d %H%M')
        x_obs_times.append(x_obs_time)
    # now load the forecasts
    ####forecast = np.loadtxt(forecast_file)
    forecast = open(forecast_file, 'r').readlines()
    # format: YYYY MM DD HHMM M1 X1 Forecaster
    m_probs = []
    for i in range(0, len(forecast)):
        m_prob = forecast[i].split()[4]
        m_probs.append(m_prob)
    x_probs = []
    for i in range(0, len(forecast)):
        x_prob = forecast[i].split()[5]
        x_probs.append(x_prob)
    forecast_times = []
    for i in range (0, len(forecast)):
        forecast_time = dt.datetime.strptime(forecast[i][0:15], '%Y %m %d %H%M')
        forecast_times.append(forecast_time)
    # first lets check the x flares
    i = 1   # since only 24 hour forecast unlike total forecasts
    # have to check times for each forecast window and create logic file for each one
    x_list = check_times(i, x_obs_times, forecast_times, x_probs)
    # then write to a file for verification
    filename = "".join([DIR, 'x_day', str(i), '.dat'])
    outfile = open(filename, 'w')
    for item in x_list:
        outfile.write("%s\n" % item)
    del x_list
    # now do the same for the m flares
    m_list = check_times(i, m_obs_times, forecast_times, m_probs)
    filename = "".join([DIR, 'm_day', str(i), '.dat'])
    outfile = open(filename, 'w')
    for item in m_list:
        outfile.write("%s\n" % item)
    del m_list



def check_times(l, obs_times, forecast_times, probability):
    """check if theres a flare for each forecast time
       """
    flare_logic_list = ['obs,pred']
    for j in range (0, len(forecast_times)):
        flarenoflare = []
        for k in range (0, len(obs_times)):
            lower_limit = forecast_times[j] + dt.timedelta(days =  l - 1)
            upper_limit = forecast_times[j] + dt.timedelta(days = l)
            if lower_limit <= obs_times[k] <= upper_limit:
                #print 'Yes!', forecast_times[j], obs_times[k]
                flarenoflare.append('Flare')
            else:
                flarenoflare.append('None')
        if 'Flare' in flarenoflare:
            new_line = '1' + ',' + str(int(probability[j])/100.)
            flare_logic_list.append(new_line)
        else:
            new_line = '0' + ',' + str(int(probability[j])/100.)
            flare_logic_list.append(new_line)
    return flare_logic_list


if __name__ == '__main__':
    main()
