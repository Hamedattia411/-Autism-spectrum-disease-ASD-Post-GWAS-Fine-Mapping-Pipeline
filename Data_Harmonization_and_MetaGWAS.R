library(data.table)
library(dplyr)

pgc <- fread("data/raw/PGC_ASD_2015.txt.gz")
ipsych <- fread("data/raw/iPSYCH_PGC_ASD_2017.gz")

pgc$BETA <- log(pgc$OR)
ipsych$BETA <- log(ipsych$OR)

pgc <- pgc %>%
  distinct(SNP, .keep_all = TRUE)

ipsych <- ipsych %>%
  distinct(SNP, .keep_all = TRUE)

ambiguous_pairs <- c("AT", "TA", "CG", "GC")

pgc <- pgc %>%
  filter(!paste0(A1, A2) %in% ambiguous_pairs)

ipsych <- ipsych %>%
  filter(!paste0(A1, A2) %in% ambiguous_pairs)

merged <- inner_join(
  pgc,
  ipsych,
  by = "SNP",
  suffix = c("_PGC", "_iPSYCH")
)

flip_idx <- merged$A1_PGC != merged$A1_iPSYCH
merged$BETA_iPSYCH[flip_idx] <- -merged$BETA_iPSYCH[flip_idx]

meta_gwas <- merged %>%
  filter(
    !is.na(CHR_PGC),
    !is.na(BP_PGC),
    !is.na(P_PGC),
    P_PGC > 0,
    P_PGC <= 1
  )

write.table(
  meta_gwas,
  "data/processed/ASD_MetaGWAS.txt",
  sep = "\t",
  row.names = FALSE,
  quote = FALSE
)
