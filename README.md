# -Autism-spectrum-disease-ASD-Post-GWAS-Fine-Mapping-Pipeline
Pipeline Workflow
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
Repository Structure
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
└── Materials_and_Methods.docx
