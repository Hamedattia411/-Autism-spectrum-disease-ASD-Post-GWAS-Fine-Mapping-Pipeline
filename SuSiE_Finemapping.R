library(susieR)
library(data.table)

lead_snps <- fread("data/processed/Independent_Lead_SNPs.csv")
meta_gwas <- fread("data/processed/ASD_MetaGWAS.txt")

for (i in 1:nrow(lead_snps)) {

  current_snp <- lead_snps$SNP[i]
  current_chr <- lead_snps$CHR[i]
  current_bp <- lead_snps$BP[i]

  locus_data <- meta_gwas[
    CHR == current_chr &
    BP >= (current_bp - 1000000) &
    BP <= (current_bp + 1000000)
  ]

  z_scores <- locus_data$BETA / locus_data$SE

  ld_matrix <- as.matrix(
    fread(paste0("results/ld/", current_snp, ".ld"))
  )

  susie_fit <- susie_rss(
    z = z_scores,
    R = ld_matrix,
    n = 100487,
    L = 5,
    max_iter = 500
  )

  pip_results <- data.frame(
    SNP = locus_data$SNP,
    PIP = susie_fit$pip,
    P = locus_data$P
  )

  causal_variants <- pip_results %>%
    filter(P < 5e-8 & PIP == 1)

  write.csv(
    causal_variants,
    paste0("results/tables/", current_snp, "_causal_variants.csv"),
    row.names = FALSE
  )
}
