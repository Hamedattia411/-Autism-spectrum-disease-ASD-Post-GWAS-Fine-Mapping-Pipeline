library(ggplot2)
library(dplyr)
library(ggrepel)

meta_gwas <- read.table(
  "data/processed/ASD_MetaGWAS.txt",
  header = TRUE
)

lead_snps <- read.csv(
  "data/processed/Independent_Lead_SNPs.csv"
)

for (i in 1:nrow(lead_snps)) {

  current_snp <- lead_snps$SNP[i]
  current_chr <- lead_snps$CHR[i]
  current_bp <- lead_snps$BP[i]

  regional_data <- meta_gwas %>%
    filter(
      CHR == current_chr &
      BP >= (current_bp - 1000000) &
      BP <= (current_bp + 1000000)
    )

  lead_data <- regional_data %>%
    filter(SNP == current_snp)

  p <- ggplot(
    regional_data,
    aes(x = BP / 1e6, y = -log10(P))
  ) +
    geom_point(color = "grey50", alpha = 0.7) +
    geom_point(data = lead_data, color = "red", size = 4) +
    geom_text_repel(
      data = lead_data,
      aes(label = SNP)
    ) +
    geom_hline(
      yintercept = -log10(5e-8),
      linetype = "dashed"
    ) +
    theme_classic() +
    labs(
      title = paste("Regional Association Plot:", current_snp),
      x = paste("Chromosome", current_chr, "Position (Mb)"),
      y = expression(-log[10](P))
    )

  ggsave(
    paste0(
      "results/figures/Regional_",
      current_snp,
      ".png"
    ),
    p,
    width = 10,
    height = 6,
    dpi = 300
  )
}
