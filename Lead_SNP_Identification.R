library(data.table)
library(dplyr)

meta_gwas <- fread("data/processed/ASD_MetaGWAS.txt")

significant_snps <- meta_gwas %>%
  filter(P < 5e-8) %>%
  arrange(CHR, BP)

lead_snps <- significant_snps %>%
  group_by(CHR) %>%
  mutate(distance = BP - lag(BP, default = first(BP))) %>%
  mutate(locus = cumsum(distance > 250000)) %>%
  group_by(CHR, locus) %>%
  slice_min(order_by = P, n = 1) %>%
  ungroup()

write.csv(
  lead_snps,
  "data/processed/Independent_Lead_SNPs.csv",
  row.names = FALSE
)
