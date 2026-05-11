lead_snps <- read.csv("data/processed/Independent_Lead_SNPs.csv")

for (i in 1:nrow(lead_snps)) {

  snp <- lead_snps$SNP[i]
  chr <- lead_snps$CHR[i]
  bp <- lead_snps$BP[i]

  start_bp <- bp - 1000000
  end_bp <- bp + 1000000

  plink_command <- paste(
    "plink",
    "--bfile data/reference/1000G_EUR",
    "--chr", chr,
    "--from-bp", start_bp,
    "--to-bp", end_bp,
    "--r2 square",
    "--out results/ld/", snp,
    sep = " "
  )

  system(plink_command)
}
