# L1T
L1T


# GRID distributed generation of simulations

## Build cms-l1t-offline
```
source ./scripts/cms-l1t-offline_build.sh
```

## CRAB launch MC simulations {minbias, Z->\mu\mu} x {CHUNKY, PHIRING}

See macros
```
./crab/test_launch.sh
./crab/crabConfig.py
```


# Local analysis of simulations



## Four MC simulations saved under

Minbias (nu-gun)
```
/eos/cms/store/group/dpg_trigger/comm_trigger/L1Trigger/mamiesko/data/l1NTuple_algo_CHUNKY_mc_Nu/crab_projects/crab_mc_l1NTuple_algo_CHUNKY_mc_Nu/results/L1Ntuple_*.root

/eos/cms/store/group/dpg_trigger/comm_trigger/L1Trigger/mamiesko/data/l1NTuple_algo_PHIRING_mc_Nu/crab_projects/crab_mc_l1NTuple_algo_PHIRING_mc_Nu/results/L1Ntuple_*.root
```

Z -> \mu\mu
```
/eos/cms/store/group/dpg_trigger/comm_trigger/L1Trigger/mamiesko/data/l1NTuple_algo_CHUNKY_mc_ZtoMuMu/crab_projects/crab_mc_l1NTuple_algo_CHUNKY_mc_ZtoMuMu/results/L1Ntuple_*.root

/eos/cms/store/group/dpg_trigger/comm_trigger/L1Trigger/mamiesko/data/l1NTuple_algo_PHIRING_mc_ZtoMuMu/crab_projects/crab_mc_l1NTuple_algo_PHIRING_mc_ZtoMuMu/results/L1Ntuple_*.root
```


## Preliminaries:

## Set config file folder
```
CFOLDER=/afs/cern.ch/user/m/mamiesko/public/L1TestNTuples/l1t-analysis/config
```

Set minbias simulation ROOT file paths under
```
nano $CFOLDER/p1JetMet_rates_CHUNKY.yaml
nano $CFOLDER/p1JetMet_rates_PHIRING.yaml
```

Set Z -> \mu\mu simulation ROOT file paths under
```
nano $CFOLDER/p1JetMet_CHUNKY.yaml
nano $CFOLDER/p1JetMet_PHIRING.yaml
```


# Execute

Go under 'cms-l1t-analysis' folder


## Initialize cms-l1t-analysis dependencies
```
git clone https://github.com/<your github user name>/cms-l1t-analysis.git
cd cms-l1t-analysis
git remote add upstream https://github.com/cms-l1t-offline/cms-l1t-analysis.git
git pull --rebase upstream master
source setup.sh
# you will need your grid cert
voms-proxy-init --voms cms
make setup
```


## 1. Produce trigger rates with minimum bias samples
```
cmsl1t -c $CFOLDER/p1JetMet_rates_CHUNKY.yaml
cmsl1t -c $CFOLDER/p1JetMet_rates_PHIRING.yaml
```

### Add the output thresholds manually into files under:
```
nano $CFOLDER/p1JetMet_CHUNKY.yaml
nano $CFOLDER/p1JetMet_PHIRING.yaml
```


## 2. Produce plots
```
cmsl1t -c $CFOLDER/p1JetMet_CHUNKY.yaml
cmsl1t -c $CFOLDER/p1JetMet_PHIRING.yaml
```


## 3. Produce comparison plots

Set these manually first as produced above with "{date}_{sample_name}_{trigger_name}"
```
CHUNKY_OUTPUT=20201009_ZtoMuMu_CHUNKY-v1
PHIRING_OUTPUT=20201009_ZtoMuMu_PHIRING-v1
```

```
cmsl1t \
-c $CFOLDER/p1JetMet_CHUNKY.yaml \
-c $CFOLDER/p1JetMet_PHIRING.yaml \
-cf CHUNKY:output/constant_rate_turnons/$CHUNKY_OUTPUT/jetMet_analyzer_histograms.root \
-cf PHIRING:output/constant_rate_turnons/$PHIRING_OUTPUT/jetMet_analyzer_histograms.root
```

## 4. See results

Under output folder
```

```


m.mieskolainen@imperial.ac.uk, 2020
