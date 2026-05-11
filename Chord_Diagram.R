
library(circlize)

links <- data.frame(
  pathway = c(
    "Axon guidance",
    "Axon guidance",
    "Axon guidance",
    "Synaptic signaling",
    "Synaptic signaling",
    "Synaptic signaling",
    "Cell adhesion",
    "Cell adhesion",
    "Cell adhesion"
  ),
  gene = c(
    "DSCAM",
    "ASTN2",
    "CADPS",
    "CADPS",
    "MAGI2",
    "USP7",
    "DSCAM",
    "MAGI2",
    "RP1L1"
  )
)

grid.col <- c(
  "Axon guidance" = "#E64B35",
  "Synaptic signaling" = "#4DBBD5",
  "Cell adhesion" = "#00A087",
  "DSCAM" = "#3C5488",
  "ASTN2" = "#F39B7F",
  "CADPS" = "#8491B4",
  "MAGI2" = "#91D1C2",
  "USP7" = "#DC0000",
  "RP1L1" = "#7E6148"
)

png(
  "results/figures/ASD_Gene_Pathway_Chord_Diagram.png",
  width = 3200,
  height = 3200,
  res = 350
)

circos.clear()

chordDiagram(
  x = links,
  grid.col = grid.col,
  transparency = 0.25,
  annotationTrack = "grid",
  preAllocateTracks = 1
)

circos.trackPlotRegion(
  track.index = 1,
  panel.fun = function(x, y) {

    sector.name <- get.cell.meta.data("sector.index")

    circos.text(
      x = get.cell.meta.data("xcenter"),
      y = get.cell.meta.data("ylim")[1] + 0.1,
      labels = sector.name,
      facing = "clockwise",
      niceFacing = TRUE,
      adj = c(0, 0.5),
      cex = 1.2
    )
  },
  bg.border = NA
)

title(
  "Gene-Pathway Chord Diagram",
  cex.main = 2.5,
  font.main = 2
)

dev.off()
