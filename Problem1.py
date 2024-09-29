
aaSeq = "KVRMFTSELDIMLSVNGPADQIKYFCRHWT*"

# Number of aa (excluding stop codon)
num_aa = len(aaSeq) - 1 

# Calculate the number of bases in the open reading frame
num_bases = (num_aa + 1) * 3  # +1 to include stop codon

print(f"Number of amino acids: {num_aa}")
print(f"Number of bases in the open reading frame: {num_bases}")


