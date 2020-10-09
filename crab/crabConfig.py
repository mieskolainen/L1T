# L1T N-tuple crabConfig.py
#
# m.mieskolainen@imperial.ac.uk

from WMCore.Configuration import Configuration
config = Configuration()

# Set these manually here

mc   = 'Nu'
#mc   = 'ZtoMuMu'

algo = 'CHUNKY'
#algo = 'PHIRING'

# -------------------------------------------------------

if mc == 'ZtoMuMu':
  dataset = '/ZToMuMu_M_50_120_TuneCP5_NNPDF31_14TeV-powheg-pythia8/Run3Winter20DRPremixMiniAOD-110X_mcRun3_2021_realistic_v6-v2/GEN-SIM-RAW'

if mc == 'Nu':
  dataset = '/Nu_E10-pythia8-gun/Run3Winter20DRPremixMiniAOD-SNB_110X_mcRun3_2021_realistic_v6-v1/GEN-SIM-RAW'

name = 'mc_l1NTuple' + '_algo_' + algo + '_mc_' + mc

# -------------------------------------------------------

config.section_("General")
config.General.requestName     = name
config.General.workArea        = 'crab_projects'
config.General.transferOutputs = True

config.section_("JobType")
config.JobType.pluginName      = 'Analysis'
config.JobType.psetName        = name + '.py'
config.JobType.allowUndistributedCMSSW = True

config.section_("Data")
config.Data.inputDataset       = dataset
config.Data.inputDBS           = 'global'
config.Data.splitting          = 'FileBased'
#config.Data.splitting         = 'EventBased'
config.Data.unitsPerJob        = 10

#NJOBS = 10
#config.Data.totalUnits = config.Data.unitsPerJob * NJOBS
config.Data.publication        = True
config.Data.outputDatasetTag   = name

config.section_("Site")
config.Site.storageSite        = 'T2_UK_London_IC'
