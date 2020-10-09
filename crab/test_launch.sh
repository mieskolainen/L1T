#!/bin/sh
# L1T N-tuple generator launch script
#
# At lxplus:
# dasgoclient --query="file dataset=/Nu_E10-pythia8-gun/Run3Winter20DRPremixMiniAOD-SNB_110X_mcRun3_2021_realistic_v6-v1/GEN-SIM-RAW"
# 
# m.mieskolainen@imperial.ac.uk


ALGOS=('CHUNKY' 'PHIRING')
MCS=('ZtoMuMu' 'Nu')


for ALGO in "${ALGOS[@]}"
do
for MC in "${MCS[@]}"
do

echo 'Executing:' $ALGO $MC

### Create strings

# SETTINGS
SETTINGS=L1TSettingsToCaloParams_2018_v1_3_A_${ALGO}

# MONTECARLO
if [ "$MC" == "ZtoMuMu" ]; then 
MCSAMPLE="/store/mc/Run3Winter20DRPremixMiniAOD/ZToMuMu_M_50_120_TuneCP5_NNPDF31_14TeV-powheg-pythia8/GEN-SIM-RAW/110X_mcRun3_2021_realistic_v6-v2/20000/FA70403E-77CD-0043-80BF-4D666A9EC32C.root"
fi
if [ "$MC" == "Nu" ]; then
MCSAMPLE="/store/mc/Run3Winter20DRPremixMiniAOD/Nu_E10-pythia8-gun/GEN-SIM-RAW/SNB_110X_mcRun3_2021_realistic_v6-v1/10000/36C30C9D-B9A2-964E-8D40-0001A229DFF5.root"
fi

# TAGNAME
TAGNAME=l1NTuple_algo_${ALGO}_mc_${MC}

mkdir $TAGNAME -p
cd $TAGNAME

### Run it

cmsDriver.py \
-n 10 \
-s RAW2DIGI \
--no_output \
--python_filename=mc_$TAGNAME.py \
--era=Run2_2018 \
--mc \
--conditions=110X_mcRun3_2021_realistic_v6 \
--customise=L1Trigger/Configuration/customiseReEmul.L1TReEmulFromRAW \
--customise=L1Trigger/L1TNtuples/customiseL1Ntuple.L1NtupleRAWEMUGEN_MC \
--customise=L1Trigger/Configuration/customiseSettings.$SETTINGS \
--filein=$MCSAMPLE

# Back to main path
cd ..

done
done


#--fileout=$OUTPUT
