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


