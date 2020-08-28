#!/bin/sh
# Before running this script, the pdb reference should be pre-prepared using module splitpdb from SPORES
# These variables below should be adapted
PLANTS="/home/ubuntu/programs/PLANTS64/PLANTS1.2"
ligand="ligand_HUX803_0"
radius="5"
# From this point, the script will run smoothly if the dependencies are complete #
cp $ligand.mol2 ligand_ref.mol2
$PLANTS --mode bind ligand_ref.mol2 $radius protein.mol2
echo "proteins protein.mol2" > genref-config-nobb.txt
echo "ligands ligand_ref.mol2" >> genref-config-nobb.txt
echo "outfile ref-results-all.txt" >> genref-config-nobb.txt
echo "output_mode full full_nobb simplified" >> genref-config-nobb.txt
echo "residue_number `grep CA PLANTSactiveSiteResidues.mol2 | awk '{print $7}' | paste -s -d" "`" >> genref-config-nobb.txt
echo "residue_name `grep CA PLANTSactiveSiteResidues.mol2 | awk '{print $8}' | paste -s -d" "`" >> genref-config-nobb.txt
