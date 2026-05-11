import requests, pandas as pd, time

candidate_snps = ["rs7844805","rs3808604","rs7820334"] # change it according to your SNPs


def annotate(rsid):
    url=f"https://rest.ensembl.org/vep/human/id/{rsid}?"
    r=requests.get(url,headers={"Content-Type":"application/json"})
    if not r.ok: return {"SNP":rsid,"Error":True}

    d=r.json()[0]

    gene="NA"
    if d.get("transcript_consequences"):
        gene=d["transcript_consequences"][0].get("gene_symbol","NA")

    return {
        "SNP":rsid,
        "CHR":d.get("seq_region_name"),
        "POS":d.get("start"),
        "Gene":gene,
        "Consequence":d.get("most_severe_consequence")
    }

res=[]
for s in candidate_snps:
    res.append(annotate(s))
    time.sleep(0.2)

df=pd.DataFrame(res)
df.to_csv("data/processed/SNP_annotations.csv",index=False)
