'''
    Created on September 21, 2016
    
    @author: somurray
    
    Python Version:    Python 2.7.12 |Anaconda 4.1.1 (64-bit)| (default, Jul  2 2016, 17:42:40) 
    Working directory:     grian:~/home/somurray/Dropbox/moswoc_paper/code
    
    Description:
    Check if there was a flare or not during forecast period,
    then create some files for verification (True/False,probability)
    
'''
import numpy as np
import datetime as dt

forecast_file = '/home/somurray/Dropbox/moswoc_paper/data/swpc_fcast.txt'
flare_file = '/home/somurray/Dropbox/moswoc_paper/data/new_mx_list.txt'
forecast_windows = [1, 2, 3] #days
DIR = '/home/somurray/Dropbox/moswoc_paper/data/swpc_logic/'


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
        x_obs_times .append(x_obs_time)
    # now load the forecasts
    forecast = np.loadtxt(forecast_file)
    # format: YYYY MM DD HH MM M1 M2 M3 M4 X1 X2 X3 X4
    forecast_times = []
    for i in range (0, len(forecast)):
        forecast_time = dt.datetime(int(forecast[i, 0]), int(forecast[i,1]), int(forecast[i,2]),
                                          int(forecast[i, 3]), int(forecast[i, 4]))
        forecast_times.append(forecast_time)
    # first lets check the x flares
    for i in range(1, 4):
        print 'Day', i
        # have to check times for each forecast window and create logic file for each one
        x_list = check_times(i, x_obs_times, forecast_times, forecast[:, 7 + i])
        # then write to a file for verification
        filename = "".join([DIR, 'x_day', str(i), '.dat'])
        outfile = open(filename, 'w')
        for item in x_list:
            outfile.write("%s\n" % item)
        del x_list
        # now do the same for the m flares
        m_list = check_times(i, m_obs_times, forecast_times, forecast[:, 4 + i])
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
            new_line = '1' + ',' + str(probability[j]/100.)
            flare_logic_list.append(new_line)
        else:
            new_line = '0' + ',' + str(probability[j]/100.)
            flare_logic_list.append(new_line)
    return flare_logic_list


if __name__ == '__main__':
    main()

