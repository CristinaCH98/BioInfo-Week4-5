# Problem 1  
## Amino Acid Sequence Count
touch Problem1.py 
nano Problem1.py   
> python Problem1.py  
OUTPUT   
> Number of amino acids: 30  
>Number of bases in the open reading frame: 93

# Problem 2
## Running Prodigal on a genome to count number of genes  

cp /home/chuyascm/Ecoli.fna .  
module load prodigal  
prodigal -i Ecoli.fna -o Ecoli.gbk -d Ecoli_genes.fna  
grep ">" Ecoli_genes.fna -c > gene_count.txt  

OUTPUT: gene_count.txt (4161)

# Problem 3
## Script to run Prodigal on all downloaded genomes
touch Prodigal_Problem3.sh  
nano Prodigal_Problem3.sh  
chmod +x Prodigal_Problem3.sh  
sbatch Prodigal_Problem3.sh  

OUTPUT: prodigal_results.txt  

# Problem 4
## Script to run Prokka on all downloaded genomes

module load prokka    

touch Problem4_Prokka.sh   
nano  Problem4_Prokka.sh  
chmod +x Problem4_Prokka.sh  
sbatch  Problem4_Prokka.sh  
> OUTPUT: Prokka_CDS_counts.txt  

# Problem 5
## Extract and list all unique gene names annotated by Prokka using shell commands

grep -h "gene=" /home/chuyascm/Week_5/prokka_output/*/*.gff | sed 's/.*gene=//; s/;.*//' | sort -u > unique_gene_names.txt
head -n 5 unique_gene_names.txt

 OUTPUT: 
[chuyascm@login509-02-r prokka_output]$ head -n 5 unique_gene_names.txt
aaaT
aaeA
aaeA_1
aaeA_2
aaeB
