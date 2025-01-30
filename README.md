# Bodylight-notebooks
Jupyter interactive notebooks demonstrating Bodylight and related technologies in order to do data science with models of medical physiology.

# Usage in cloud computing service - MyBinder
Some of the notebooks can be interactively launched via MyBinder: 
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/creative-connections/Bodylight-notebooks/master)

# Usage in local installation
Install JUPYTER - e.g. as part as [Anaconda](https://www.anaconda.com/products/individual) (~700MB) or [Miniconda](https://docs.conda.io/en/latest/miniconda.html) (60MB) distribution. Then install `fmpy` and `pyfmi` by 

```conda install -c conda-forge fmpy pyfmi```

start Jupyter notebook
```jupyter notebook```

and open notebook, for beginners start with `BasicDemos` and `Seminar11GlucoseInsulinIdentification\ModelicaIdentification`.

# Usage in local virtual machine
use Bodylight-VirtualMachine - where preconfigured Jupyter notebook and depended environment is installed
```bash
git clone https://github.com/creative-connections/Bodylight-notebooks
git clone https://github.com/creative-connections/Bodylight-VirtualMachine
cd Bodylight-VirtualMachine 
vagrant up
```
Then the VM is configured to have shared directory `/vagrant_data` should be mapped to parent directory of Bodylight-VirtualMachine. http://localhost:8080/jupyter should show this `vagrant_data`directory 
