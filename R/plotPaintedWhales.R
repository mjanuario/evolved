#' @importFrom utils data
NULL
#' Plotting the whale phylogeny and coloring its clades
#'
#' \code{plotPaintedWhales} plots the phylogeny from Steeman et al (2011), coloring the Dolphins (Delphinidae), porpoises (Phocoenidae), the Mysticetes, the baleen whales (Balaenopteridae), and the Beaked whales (Ziphiidae).
#' @param show.legend Logical indicating if clade legend should be shown.
#' @param direction Phylogeny plotting direction. Should be set to "rightwards"
#' @param knitr Logical indicating if plot is intended to show up in RMarkdown files made by the \code{Knitr} R package.
#'  (the default) or "leftwards".
#' @param ... other arguments to be passed to \code{phytools::plotSimmap}
#' 
#' @seealso help page from \code{phytools::plotSimmap}
#' 
#' @return The whale phylogeny, with branch lengths being colored by a major 
#' whale taxonomic group.
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
#' plotPaintedWhales(knitr = TRUE)
#' 
plotPaintedWhales<-function(show.legend=TRUE, direction="rightwards", knitr=FALSE, ...){
  
  #checking input:
  if(!is.logical(show.legend)){
    stop("\n show.legend must be a logical")
  }
  
  whale_phylo <- ape::read.tree(text = "(((Balaena_mysticetus:8.816019,(Eubalaena_australis:1.622021,(Eubalaena_glacialis:0.347029,Eubalaena_japonica:0.347029):1.274992):7.193998):19.183981,(Caperea_marginata:26.063016,(Eschrichtius_robustus:17.890655,(((Balaenoptera_acutorostrata:5.278071,Balaenoptera_bonaerensis:5.278071):9.821253,(Balaenoptera_physalus:10.472234,Megaptera_novaeangliae:10.472234):4.62709):0.967361,(Balaenoptera_musculus:12.847395,(Balaenoptera_omurai:11.382958,(Balaenoptera_borealis:5.265325,(Balaenoptera_brydei:4.322022,Balaenoptera_edeni:4.322022):0.943303):6.117633):1.464437):3.21929):1.82397):8.172361):1.936984):7.857844,((Physeter_catodon:22.044391,(Kogia_breviceps:8.803018,Kogia_simus:8.803018):13.241373):11.754612,((Platanista_gangetica:0.28307,Platanista_minor:0.28307):32.107591,((Tasmacetus_shepherdi:19.195664,((Berardius_arnuxii:6.28945,Berardius_bairdii:6.28945):11.733962,(Ziphius_cavirostris:15.669702,((Indopacetus_pacificus:11.028304,(Hyperoodon_ampullatus:8.100266,Hyperoodon_planifrons:8.100266):2.928038):3.511979,(Mesoplodon_bidens:13.042869,(Mesoplodon_traversii:11.079293,(Mesoplodon_ginkgodens:8.925943,(Mesoplodon_europaeus:8.252103,(Mesoplodon_mirus:7.677424,((Mesoplodon_bowdoini:4.732448,(Mesoplodon_carlhubbsi:4.170968,Mesoplodon_layardii:4.170968):0.56148):2.444232,(Mesoplodon_hectori:6.375631,((Mesoplodon_densirostris:4.927159,Mesoplodon_stejnegeri:4.927159):0.869428,(Mesoplodon_grayi:5.096384,(Mesoplodon_perrini:4.166226,Mesoplodon_peruvianus:4.166226):0.930158):0.700202):0.579045):0.801049):0.500744):0.574679):0.67384):2.15335):1.963577):1.497414):1.129419):2.35371):1.172252):12.425865,((Lipotes_vexillifer:24.698214,(Inia_geoffrensis:18.226419,Pontoporia_blainvillei:18.226419):6.471794):1.301786,(((Delphinapterus_leucas:5.466432,Monodon_monoceros:5.466432):8.595122,((Neophocaena_phocaenoides:4.985876,(Phocoena_phocoena:3.706276,Phocoenoides_dalli:3.706276):1.2796):0.630505,(Phocoena_sinus:4.94717,(Phocoena_dioptrica:4.045703,Phocoena_spinipinnis:4.045703):0.901467):0.66921):8.445174):3.877872,(Orcinus_orca:10.70277,((Orcaella_brevirostris:8.20905,(Grampus_griseus:6.04703,(Pseudorca_crassidens:5.493241,(Feresa_attenuata:4.45272,(Peponocephala_electra:3.048675,(Globicephala_macrorhynchus:1.470782,Globicephala_melas:1.470782):1.577893):1.404045):1.040521):0.55379):2.16202):1.228963,(Lagenorhynchus_albirostris:8.716039,((Lagenorhynchus_acutus:6.975185,((Lissodelphis_borealis:1.361358,Lissodelphis_peronii:1.361358):3.902137,((Cephalorhynchus_hectori:3.291163,(Cephalorhynchus_commersonii:1.821239,Cephalorhynchus_eutropia:1.821239):1.469925):1.279729,(Lagenorhynchus_obscurus:3.791853,(Lagenorhynchus_obliquidens:2.919779,(Cephalorhynchus_heavisidii:2.096219,(Lagenorhynchus_australis:1.570433,Lagenorhynchus_cruciger:1.570433):0.525786):0.82356):0.872074):0.77904):0.692602):1.71169):1.167873,((Steno_bredanensis:5.897506,(Sotalia_fluviatilis:3.212561,Sotalia_guianensis:3.212561):2.684945):1.616888,((Lagenodelphis_hosei:3.44536,Stenella_longirostris:3.44536):0.910357,((Stenella_attenuata:3.07917,(Tursiops_aduncus:2.194413,Tursiops_truncatus:2.194413):0.884757):0.546945,(Sousa_chinensis:2.83298,(Stenella_clymene:1.934812,((Stenella_coeruleoalba:1.011163,Stenella_frontalis:1.011163):0.495574,(Delphinus_tropicalis:1.268114,(Delphinus_capensis:0.924862,Delphinus_delphis:0.924862):0.343252):0.238623):0.428075):0.898168):0.793135):0.729602):3.158677):0.628664):0.572981):0.721974):1.264757):7.236657):8.060574):5.621528):0.769132):1.408343):2.058841);")
  
  ############################################
  # Be sure to not change user's par() configs:
  oldpar <- par(no.readonly = TRUE) 
  on.exit(par(oldpar)) 
  ############################################
  
  if(!knitr){
    dev.new()
  }
  par(cex = 0.6)
  painted<-phytools::paintSubTree(whale_phylo,89,"Other mysticetes","1")
  painted<-phytools::paintSubTree(painted,109,"Beaked whales", "0")
  painted<-phytools::paintSubTree(painted,134,"Belugas and narwhals","0")
  painted<-phytools::paintSubTree(painted,135,"Porpoises")
  painted<-phytools::paintSubTree(painted,94,"Baleen whales",)
  painted<-phytools::paintSubTree(painted,140,"Dolphins")
  
  phytools::plotSimmap(painted,lwd=3, ...)
  
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
