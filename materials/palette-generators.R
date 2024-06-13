library(ggthemes)

# the original function from the first session
sample_canva <- function(seed = NULL) {
  if(!is.null(seed)) set.seed(seed)
  sample(ggthemes::canva_palettes, 1)[[1]]
}

# the extended function used in later sessions
sample_canva2 <- function(seed = NULL, n = 4) {
  if(!is.null(seed)) set.seed(seed)
  sample(ggthemes::canva_palettes, 1)[[1]] |>
    (\(x) colorRampPalette(x)(n))()  
}

show_col(sample_canva(seed = 22))
polar_art(seed = 3, n = 150, palette = sample_canva(seed = 22))
