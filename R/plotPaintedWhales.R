#' @importFrom phytools paintSubTree
#' @importFrom phytools plotSimmap
#' @importFrom utils data
NULL
#' Plotting the whale phylogeny and coloring its clades
#'
#' \code{plotPaintedWhales} plots the phylogeny from Steeman et al (2011), coloring the Dolphins (Delphinidae), porpoises (Phocoenidae), the Mysticetes, the baleen whales (Balaenopteridae), and the Beaked whales (Ziphiidae).
#' @param show.legend Logical indicating if clade legend should be shown.
#' @param direction Phlyogeny plotting direction. Shuould be set to "rightwards" 
#'  (the default) or "leftwards"
#' @param ... other arguments to be passed to \code{phytools::plotSimmap}
#' 
#' @seealso help page from \code{phytools::plotSimmap}
#' 
#' @return A colored phylogeny plot.
#' 
#' @export plotPaintedWhales
#' 
#' @references 
#' 
#'  Steeman, M. E., Hebsgaard, M. B., Fordyce, R. E., Ho, S. Y., Rabosky, D. L., Nielsen, R., ... & Willerslev, E. (2009). Radiation of extant cetaceans driven by restructuring of the oceans. Systematic biology, 58(6), 573-585.
#' 
#'  
#' @author Matheus Januario, Jennifer Auler
#' 
#' @examples
#' plotPaintedWhales()
#' 
plotPaintedWhales<-function(show.legend=TRUE, direction="rightwards", ...){
  
  whale_phylo <- ape::read.tree(text = "((Balaena_mysticetus:8.816019,(Eubalaena_australis:1.622021,(Eubalaena_glacialis:0.347029,Eubalaena_japonica:0.347029):1.274992):7.193998):26.73422309,(Caperea_marginata:26.063016,(Eschrichtius_robustus:17.890655,(((Balaenoptera_acutorostrata:5.278071,Balaenoptera_bonaerensis:5.278071):9.821253,(Balaenoptera_physalus:10.472234,Megaptera_novaeangliae:10.472234):4.62709):0.967361,(Balaenoptera_musculus:12.847395,(Balaenoptera_omurai:11.382958,(Balaenoptera_borealis:5.265325,(Balaenoptera_brydei:4.322022,Balaenoptera_edeni:4.322022):0.943303):6.117633):1.464437):3.21929):1.82397):8.172361):9.487226086,((Physeter_catodon:22.044391,(Kogia_breviceps:8.803018,Kogia_simus:8.803018):13.241373):11.75461257,((Platanista_gangetica:0.28307,Platanista_minor:0.28307):32.10759107,((Tasmacetus_shepherdi:19.19566437,((Berardius_arnuxii:6.28945,Berardius_bairdii:6.28945):11.73396242,(Ziphius_cavirostris:15.66970244,((Indopacetus_pacificus:11.028304,(Hyperoodon_ampullatus:8.100266,Hyperoodon_planifrons:8.100266):2.928038):3.511979536,(Mesoplodon_bidens:13.04286958,(Mesoplodon_traversii:11.07929308,(Mesoplodon_ginkgodens:8.925943091,(Mesoplodon_europaeus:8.2521031,(Mesoplodon_mirus:7.677424111,((Mesoplodon_bowdoini:4.732448,(Mesoplodon_carlhubbsi:4.170968,Mesoplodon_layardii:4.170968):0.56148):2.444232167,(Mesoplodon_hectori:6.3756312,((Mesoplodon_densirostris:4.927159,Mesoplodon_stejnegeri:4.927159):0.8694275,(Mesoplodon_grayi:5.096384,(Mesoplodon_perrini:4.166226,Mesoplodon_peruvianus:4.166226):0.930158):0.7002025):0.5790447):0.8010489667):0.5007439444):0.5746789889):0.6738399909):2.153349992):1.963576494):1.497413959):1.129418905):2.353709975):1.172251958):12.42586492,((Lipotes_vexillifer:24.6982135,(Inia_geoffrensis:18.226419,Pontoporia_blainvillei:18.226419):6.4717945):1.301786655,(((Delphinapterus_leucas:5.466432,Monodon_monoceros:5.466432):8.59512225,((Neophocaena_phocaenoides:4.985876,(Phocoena_phocoena:3.706276,Phocoenoides_dalli:3.706276):1.2796):0.6305045,(Phocoena_sinus:4.94717,(Phocoena_dioptrica:4.045703,Phocoena_spinipinnis:4.045703):0.901467):0.6692105):8.44517375):3.877872495,(Orcinus_orca:10.70277006,((Orcaella_brevirostris:8.209050417,(Grampus_griseus:6.0470305,(Pseudorca_crassidens:5.493241,(Feresa_attenuata:4.45272,(Peponocephala_electra:3.048675,(Globicephala_macrorhynchus:1.470782,Globicephala_melas:1.470782):1.577893):1.404045):1.040521):0.5537895):2.162019917):1.228962922,(Lagenorhynchus_albirostris:8.716038981,((Lagenorhynchus_acutus:6.97518495,((Lissodelphis_borealis:1.361358,Lissodelphis_peronii:1.361358):3.902136937,((Cephalorhynchus_hectori:3.2911635,(Cephalorhynchus_commersonii:1.821239,Cephalorhynchus_eutropia:1.821239):1.4699245):1.279729333,(Lagenorhynchus_obscurus:3.791853,(Lagenorhynchus_obliquidens:2.919779,(Cephalorhynchus_heavisidii:2.096219,(Lagenorhynchus_australis:1.570433,Lagenorhynchus_cruciger:1.570433):0.525786):0.82356):0.872074):0.7790398333):0.6926021042):1.711690013):1.167873005,((Steno_bredanensis:5.897506,(Sotalia_fluviatilis:3.212561,Sotalia_guianensis:3.212561):2.684945):1.616888,((Lagenodelphis_hosei:3.44536,Stenella_longirostris:3.44536):0.910357,((Stenella_attenuata:3.07917,(Tursiops_aduncus:2.194413,Tursiops_truncatus:2.194413):0.884757):0.546945,(Sousa_chinensis:2.83298,(Stenella_clymene:1.934812,((Stenella_coeruleoalba:1.011163,Stenella_frontalis:1.011163):0.495574,(Delphinus_tropicalis:1.268114,(Delphinus_capensis:0.924862,Delphinus_delphis:0.924862):0.343252):0.238623):0.428075):0.898168):0.793135):0.729602):3.158677):0.6286639545):0.5729810262):0.7219743579):1.26475672):7.236656686):8.06057341):5.621529137):0.7691317752):1.408342498):1.751238521);")
  
  painted<-paintSubTree(whale_phylo,89,"Other mysticetes","1")
  painted<-paintSubTree(painted,109,"Beaked whales", "0")
  painted<-paintSubTree(painted,134,"Belugas and narwhals","0")
  painted<-paintSubTree(painted,135,"Porpoises")
  painted<-paintSubTree(painted,94,"Baleen whales",)
  painted<-paintSubTree(painted,140,"Dolphins")
  
  plotSimmap(painted,lwd=3, ...)
  
  if(show.legend){
    if(direction=="rightwards"){
      leg.placement="topleft"
    }else if(direction=="leftwards"){
      leg.placement="topright"
    }else{
      stop("direction should be equal to rightwards OR leftwards")
    }
    
    legend(x=leg.placement,legend=c(
      "other odontocetes",
      "Baleen whales",
      "Beaked whales",
      "Belugas and narwhals",
      "Dolphins",
      "Other mysticetes","Porpoises"
    ),
    pch=21,pt.cex=1.5,pt.bg=c("black","#DF536B","#61D04F","#2297E6","#28E2E5","#CD0BBC","#F5C710"),bty="n") 
  }
  
}
