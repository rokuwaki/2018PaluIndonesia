import obspy
from obspy.clients.fdsn import Client
client = Client('IRIS')
from obspy import UTCDateTime
import os
import glob
import numpy as np

def fetchSACfromPickedSAC(indir, pickedsacname, outdir, rawsacname):
    tmp = obspy.read(indir + pickedsacname)
    tmp = tmp[0].copy()
    network = tmp.stats['network']
    station = tmp.stats['station']
    location = tmp.stats['location']
    channel = tmp.stats['channel']
    starttime = UTCDateTime(tmp.stats['starttime'])
    endtime = UTCDateTime(tmp.stats['endtime'])
    sacheaders = tmp.stats.sac

    rawsac = client.get_waveforms(network, station, location, channel, starttime, endtime)
    rawsactrace = rawsac[0].copy()
    rawsactrace.stats.sac = obspy.core.AttribDict()
    rawsactrace.stats.sac = sacheaders

    rawsactrace.write(outdir + rawsacname, format='SAC')
    print(outdir + rawsacname)

indir = './sac/'
outdir = './_sac/'
os.makedirs(outdir, exist_ok=True)

for f in glob.glob(indir+'/*.SAC'):
    pickedsacname = os.path.split(f)[1]
    rawsacname = '_'+pickedsacname
    fetchSACfromPickedSAC(indir, pickedsacname, outdir, rawsacname)
print(len(glob.glob(outdir+'/*.SAC')), 'data were donwloaded.')
