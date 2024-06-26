polar_art <- function(seed, n, palette) {
  
  # set the state of the random number generator
  set.seed(seed)
  
  # data frame containing random values for 
  # aesthetics we might want to use in the art
  dat <- tibble(
    x0 = runif(n),
    y0 = runif(n),
    x1 = x0 + runif(n, min = -4, max = 4),
    y1 = y0 + runif(n, min = -4, max = 4),
    shade = runif(n), 
    size = runif(n)
  )
  
  # plot segments in various colours, using 
  # polar coordinates and a gradient palette
  dat %>% 
    ggplot(aes(
      x = x0,
      y = y0,
      xend = x1,
      yend = y1,
      colour = shade,
      linewidth = 1,
    )) +
    geom_segment(show.legend = FALSE) +
    coord_polar() +
    scale_y_continuous(expand = c(4, 4)) +
    scale_x_continuous(expand = c(0, 0)) + 
    scale_colour_gradientn(colours = palette) + 
    scale_size(range = c(0, 0)) + 
    theme_void()
}

polar_art(
  seed = 25, 
  n = 100, 
  palette = c("lavender", "cornflowerblue", "pink")
)
