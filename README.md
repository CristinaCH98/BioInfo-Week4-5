# Week 4 + 5: Genome annotation
# LLM used for this task

ChatGPT 4o mini.  

I used ChatGPT to address specific questions while developing a basic script. Initially, I created a simple version; then, I asked ChatGPT to improve it or make it more efficient to ensure the output was correct. This process helped refine the code and enhance its functionality.

# Step 1. 

## Install Biopython 
pip install biopython  
> Successfully installed biopython-1.84 numpy-2.0.2

# Step 2. 

## Initialize git repository 
mkdir Week_4    
cd Week_4    
git remote add origin https://github.com/CristinaCH98/BioInfo-Week4-5.git  
git init   
git branch -m master main  
git status # check point  

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
## Script to run Prodigal on all downloaded genomes - Prodigal.sh 
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

# Save on Git Repository
 
git push -u origin main
