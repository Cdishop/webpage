library(ggplot2)
library(imager)
library(dplyr)

fname <- "https://classroomclipart.com/images/gallery/Clipart/Black_and_White_Clipart/Animals/gorilla-waving-cartoon-black-white-outline-clipart-914.jpg"
gorilla <- load.image(fname)


img <- cannyEdges(gorilla) %>%
  .[, , 1, 1] %>%
  which(arr.ind = TRUE) %>%
  as.data.frame() %>%
  mutate(col = -col) %>%
  rename(x = row, y = col)
#> Warning in cannyEdges(gorilla): Running Canny detector on luminance channel

sub_img <- img %>%
  sample_n(6000)

ggplot(sub_img, aes(x, y)) + 
  theme(axis.text = element_blank(),
        axis.ticks = element_blank())


g1 <- ggplot(sub_img, aes(x, y)) + 
  theme(axis.text = element_blank(),
        axis.ticks = element_blank())

ggsave('Desktop/one.pdf', g1, width = 6, height = 6)
