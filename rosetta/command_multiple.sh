#!/bin/bash

# Define the list of mutations
mutations=("LIST" "OF" "MUTATIONS" "NUMBER" "CHAIN" "3 LETTER CODE OF AA" "49A_SER")

# Design or control for protocol
protocol="design"
outdir="output"
nstruct=20

# structures and symfile
inputpdb = input.pdb
inputsym = input.symm

# Create the output directory if it doesn't exist
mkdir -p ${outdir}

# Loop through each mutation
for mut in "${mutations[@]}"; do
    # Split the mutation string into position and amino acid
    mutpos=${mut%_*}
    mutaa=${mut#*_}

    # Run the command
    /PATH/TO/YOUR/ROSETTA/main/source/bin/rosetta_scripts.static.linuxgccrelease \
        -parser:protocol design.v02.xml \
        -parser:script_vars mutpos=${mutpos} mut_aa=${mutaa} protocol=${protocol} symfile=${inputpdb} \
        -in:file:s ${inputsym} \
        -corrections:beta_nov16 \
        -out:path:all ${outdir} \
        -overwrite \
        -out:suffix _design_${mutpos}_${mutaa} \
        -nstruct ${nstruct}
done
