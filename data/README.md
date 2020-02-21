- `model_%y%m%d%H%M%S`  
Model parameters  
- `sac`  
SAC-formatted data used for all the models. Manually picked *P* phase is added as `AMARKER` in each file.   
Alternatively, all the data can be downloaded from IRIS DMC by executing [`fetchSAC.py`](./fetchSAC.py).  
- `Belleir2006Tectono_PKF_MF_traced.txt`  
Traces of Palu-Koro and Matano faults presented in [Bellier et al., 2006, Tectonophys.](https://doi.org/10.1016/j.tecto.2005.10.036)  
- `EST.txt`, `MF.txt`, `NST.txt`, `PB2002_BS.txt`, `PKF.txt`  
Selected plate boundaries from [Bird, 2003, G3](https://doi.org/10.1029/2001GC000252)  
- `epicenter.dat`  
Initial rupture point used for inversion. Epicentral information is from [USGS NEIC](https://earthquake.usgs.gov/earthquakes/eventpage/us1000h3p4/executive).  
- `modellist.txt`  
List of models
