# -Autism-spectrum-disease-ASD-Post-GWAS-Fine-Mapping-Pipeline
Project Overview
This repository contains the complete analytical workflow for a post-GWAS fine-mapping study of Autism Spectrum Disorder (ASD). The pipeline integrates GWAS summary statistics harmonization, meta-analysis, linkage disequilibrium (LD) estimation, Bayesian fine-mapping using SuSiE, functional enrichment analyses, tissue-specific enrichment profiling, and publication-quality genomic visualizations.
# Data Sources
•	Psychiatric Genomics Consortium (PGC) ASD GWAS (2015)
•	iPSYCH-PGC ASD GWAS (2017)
•	1000 Genomes Project Phase 3 EUR reference panel
# Analytical Workflow
1.	Data harmonization and preprocessing
2.	Meta-analysis integration
3.	Independent lead SNP identification
4.	Linkage disequilibrium estimation
5.	Bayesian fine-mapping with SuSiE
6.	Functional enrichment analysis
7.	Tissue-specific enrichment analysis
8.	Publication-quality visualization
#   Pipeline Workflow
GWAS
↓
Meta-analysis
↓
LD structure
↓
SuSiE (PIP causal inference)
↓
VEP annotation (SNP function)
↓
Gene mapping
↓
Reactome + KEGG
↓
Integrated functional matrix
↓
GO enrichment
↓
Visualization + Network biology
# Repository Structure
ASD_PostGWAS_Finemapping/
│
├── README.md
├── LICENSE
├── sessionInfo.txt
│
├── data/
│ ├── raw/
│ │ ├── PGC_ASD_2015.txt.gz
│ │ └── iPSYCH_PGC_ASD_2017.gz
│ │
│ ├── processed/
│ │ ├── ASD_MetaGWAS.txt
│ │ ├── Independent_Lead_SNPs.csv
│ │ ├── Significant_ASD_SNPs.csv
│ │ ├── SNP_annotations.csv
│ │ ├── Gene_Pathways_Reactome.csv
│ │ ├── KEGG_Pathways.csv
│ │ └── Integrated_Functional_Table.csv
│ │
│ └── reference/
│ └── 1000G_EUR/
│
├── scripts/
│ ├── 01_Data_Harmonization_and_MetaGWAS.R
│ ├── 02_Lead_SNP_Identification.R
│ ├── 03_LD_Calculation_PLINK.R
│ ├── 04_SuSiE_Finemapping.R
│
│ ├── 05A_SNP_Functional_Annotation_VEP.py # NEW
│ ├── 05B_Pathway_Mapping_Reactome_KEGG.py # NEW
│ ├── 05C_Functional_Integration_Table.R # NEW
│
│ ├── 06_Functional_Enrichment.R
│ ├── 07_Visualization_Manhattan_QQ.R
│ ├── 08_Regional_Association_Plots.R
│ ├── 09_Volcano_and_Heatmap.R
│ └── 10_Chord_Diagram.R
│
├── results/
│ ├── figures/
│ └── tables/
│
└── docs/
└── Materials_and_Methods.docx________________________________________

# Software Requirements
•	R >= 4.4.3
•	PLINK v1.90b
# Main R Packages
•	susieR
•	clusterProfiler
•	enrichplot
•	ggplot2
•	ggrepel
•	pheatmap
•	circlize
•	GOplot
•	data.table
•	dplyr


# - Authors 
  - Khaled Sabry El-Basha
  - Ahmed Hamed Ahmed
  - Moazz Ahmed Nassar
