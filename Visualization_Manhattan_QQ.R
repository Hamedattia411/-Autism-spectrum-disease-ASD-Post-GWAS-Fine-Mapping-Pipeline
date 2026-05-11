library(qqman)
library(ggplot2)
library(dplyr)
library(ggrepel)

meta_gwas <- read.table(
  "data/processed/ASD_MetaGWAS.txt",
  header = TRUE
)

png(
  "results/figures/ASD_QQ_Plot.png",
  width = 1200,
  height = 1200,
  res = 300
)

qq(meta_gwas$P)

dev.off()

manhattan_data <- meta_gwas %>%
  filter(P < 0.05)

p <- ggplot(
  manhattan_data,
  aes(x = BP, y = -log10(P), color = as.factor(CHR))
) +
  geom_point(alpha = 0.8, size = 1.2) +
  geom_hline(yintercept = -log10(5e-8), linetype = "dashed") +
  theme_classic() +
  labs(
    x = "Chromosome Position",
    y = expression(-log[10](P))
  )

ggsave(
  "results/figures/ASD_Manhattan_Plot.png",
  p,
  width = 14,
  height = 6,
  dpi = 300
)
