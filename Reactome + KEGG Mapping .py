import requests, pandas as pd, time

genes=df["Gene"].dropna().unique().tolist()

# Reactome
react=[]
for g in genes:
    r=requests.get(f"https://reactome.org/ContentService/data/mapping/UniProt/{g}/pathways")
    if r.ok:
        paths=[x.get("displayName") for x in r.json()]
        react.append({"Gene":g,"Reactome":";".join(set(paths))})

# KEGG
kegg=[]
for g in genes:
    r=requests.get(f"https://rest.kegg.jp/find/hsa/{g}")
    if r.ok:
        kid=r.text.split("\n")[0].split("\t")[0]
        r2=requests.get(f"https://rest.kegg.jp/link/pathway/{kid}")
        kegg.append({"Gene":g,"KEGG":r2.text})

pd.DataFrame(react).to_csv("data/processed/Reactome.csv")
pd.DataFrame(kegg).to_csv("data/processed/KEGG.csv")
