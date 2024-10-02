#!/bin/bash
#SBATCH --job-name=ash_script
#SBATCH --output=ash.out
#SBATCH --error=ash.err
#SBATCH --time=1:00:00

OUTPUT_FILE="/home/chuyascm/Week_5/PRODIGAL_OUTPUT.fna"
RESULTS_FILE="/home/chuyascm/Week_5/PRODIGAL_results.txt"
ALL_COUNTS_FILE="/home/chuyascm/Week_5/ALL_genome_counts_prodigal.txt"

MAX_GENES=0
MAX_GENOME=""

for genome in $(find /home/chuyascm/ncbi_dataset/data -type f -name "*GCF*.fna"); do

    prodigal -i "$genome" -d "$OUTPUT_FILE"
    if [ $? -ne 0 ]; then
        echo "Error processing $genome" >> "$RESULTS_FILE"
        continue
    fi
    
    gene_count=$(grep ">" -c "$OUTPUT_FILE")
    echo "$genome: $gene_count" >> "$ALL_COUNTS_FILE"

    if [ "$gene_count" -gt "$MAX_GENES" ]; then
        MAX_GENES=$gene_count
        MAX_GENOME=$genome
    fi
done

result="Genome with the highest number of genes:\nFile: $MAX_GENOME\nNumber of genes: $MAX_GENES"
echo -e "$result"
echo -e "$result" > "$RESULTS_FILE"

if [ -f "$OUTPUT_FILE" ]; then
    rm "$OUTPUT_FILE"
fi

