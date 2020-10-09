# Collect status of all CRAB jobs

for i in $(ls -d l1*/crab_projects/*); do eval "crab status -d $i"; done;
