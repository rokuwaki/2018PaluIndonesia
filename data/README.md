- `model_%y%m%d%H%M%S`  
Model parameters  
- `sac`  
SAC-formatted data used for all the models. Manually picked *P* phase is added as `AMARKER` in each file.   
https://ds.iris.edu/wilber3/find_stations/10953070  
- `Belleir2006Tectono_PKF_MF_traced.txt`  
Traces of Palu-Koro and Matano faults presented in [Bellier et al., 2006, Tectonophys.](https://doi.org/10.1016/j.tecto.2005.10.036)  
    ```bibtex
    @article{Bellier2006,
    author = {Bellier, Olivier and S{\'{e}}brier, Michel and Seward, Diane and Beaudouin, Thierry and Villeneuve, Michel and Putranto, Eka},
    doi = {10.1016/j.tecto.2005.10.036},
    journal = {Tectonophysics},
    month = {feb},
    number = {3-4},
    pages = {201--220},
    title = {{Fission track and fault kinematics analyses for new insight into the Late Cenozoic tectonic regime changes in West-Central Sulawesi (Indonesia)}},
    url = {https://linkinghub.elsevier.com/retrieve/pii/S0040195105005391},
    volume = {413},
    year = {2006}
    }
    ```  
- `EST.txt`, `MF.txt`, `NST.txt`, `PB2002_BS.txt`, `PKF.txt`  
Selected plate boundaries from [Bird, 2003, G3](https://doi.org/10.1029/2001GC000252)  
    ```bibtex
    @article{Bird2003,
    author = {Bird, Peter},
    doi = {10.1029/2001GC000252},
    journal = {Geochemistry, Geophys. Geosystems},
    month = {mar},
    number = {3},
    title = {{An updated digital model of plate boundaries}},
    url = {http://doi.wiley.com/10.1029/2001GC000252},
    volume = {4},
    year = {2003}
    }
    ```  
- `epicenter.dat`  
Initial rupture point used for inversion. Epicentral information is from [USGS NEIC](https://earthquake.usgs.gov/earthquakes/eventpage/us1000h3p4/executive).  
- `modellist.txt`  
List of models
