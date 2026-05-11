library(clusterProfiler)
library(org.Hs.eg.db)
library(enrichplot)

candidate_genes <- c(
  "CADPS",
  "ASTN2",
  "MAGI2",
  "USP7",
  "DSCAM",
  "MACROD2",
  "RP1L1"
)

gene_ids <- bitr(
  candidate_genes,
  fromType = "SYMBOL",
  toType = "ENTREZID",
  OrgDb = org.Hs.eg.db
)

go_results <- enrichGO(
  gene = gene_ids$ENTREZID,
  OrgDb = org.Hs.eg.db,
  ont = "BP",
  pAdjustMethod = "BH",
  pvalueCutoff = 0.05,
  readable = TRUE
)

png(
  "results/figures/GO_Enrichment_Barplot.png",
  width = 2500,
  height = 1500,
  res = 300
)

print(
  barplot(
    go_results,
    showCategory = 10,
    title = "Gene Ontology Biological Process Enrichment"
  )
)

dev.off()

png(
  "results/figures/GO_Enrichment_Bubbleplot.png",
  width = 2500,
  height = 1500,
  res = 300
)

print(
  dotplot(
    go_results,
    showCategory = 10,
    title = "Functional Enrichment Analysis"
  )
)

dev.off()
