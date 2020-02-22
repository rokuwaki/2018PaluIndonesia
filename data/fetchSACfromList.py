import obspy
from obspy.clients.fdsn import Client
client = Client('IRIS')
from obspy import UTCDateTime
import os
import glob
import csv

outdir = './__sac/'
os.makedirs(outdir, exist_ok=True)
with open('stationlist.csv') as f:
    reader = csv.reader(f)
    for row in reader:
        network, station, location, channel, starttime, endtime, amarker = \
        row[0], row[1], row[2], row[3], UTCDateTime(row[4]), UTCDateTime(row[5]), row[6]
        rawsac = client.get_waveforms(network, station, location, channel, starttime, endtime)
        rawsactrace = rawsac[0].copy()
        rawsactrace.stats.sac = obspy.core.AttribDict()
        rawsactrace.stats.sac.a = amarker
        rawsacname = network+'_'+station+'_'+location+'_'+channel+'_'+\
                        str(starttime)+'_'+str(endtime)+'.SAC'
        print(outdir + rawsacname)
        rawsactrace.write(outdir + rawsacname, format='SAC')
f.close()
print(len(glob.glob(outdir+'/*.SAC')), 'data were donwloaded.')
