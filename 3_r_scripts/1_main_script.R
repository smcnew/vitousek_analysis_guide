###
# I always start my scripts with a header giving a brief description of the purpose of the script.
# In this case, the goal is to make a template for new analyses in the lab and to describe why
# parts of the project folder are organized the way they are.
#
# Written by: Sabrina McNew & Conor Taff
# Last updated: 10/13/2020
# Run under R Studio 1.1.463 on Mac OSX 10.11.6
# See markdown file for saving session info. If you aren't working in markdown it is also 
# good practice to record package versions here.

# Load packages ----
  # Ending the line above with four dashes or four hashtags puts the chunk into your outline below. 
  # This makes it a lot easier to find things later in a long script. Another way to create sections 
  # is with "command + shift + R" in Rstudio. 

  # I like to load all packages up front using 'pacman'. This way you can see right at the beginning
  # what is required and you are less likely to break your code when modifying it by moving a line
  # up to before the required package was loaded. I have a few packages I almost always load, but most
  # of these would change each time depending on the project. Just remember to add packages to the list
  # up here when you want to use them. You'll get an error if these packages aren't installed on your local
  # machine yet and will need to run install.packages(xxx)
    pacman::p_load(tidyverse, here, plyr, sjPlot)
      # 'here' is useful for referring to relative path names in your project directory.

# Load data ----
  # here is where I would load any raw data that you have added to the project
  # I'm reading in two files from
    #https://knowledge.domo.com/Training/Self-Service_Training/Onboarding_Resources/Fun_Sample_Datasets
    d_hero <- read.delim(here::here("1_raw_data/raw_hero_data.txt"))      #super hero attributes
    d_power <- read.delim(here::here("1_raw_data/raw_hero_power.txt"))    #super hero powers

# Clean up data
    # Make any kind of exclusions you want here and document them well. Apply transformations to columns or 
    # standardize them in some way.
    # You might change column names here too (though maybe that should be done when you make the files). 
      colnames(d_power)[1] <- "name"    #I changed this to match the other data file.
        
# Set values ----
    
    # Any values that you are setting that will be used through the script should go here. For example
    # if you have a control and treatment group, you can set plotting colors for them here. Then everywhere
    # you plot below you can refer to these objects. That way changing the color for all treatment plots can
    # be done by changing one line of code here. The same logic applies to any values that you might want to change
    # later on. This is a LOT easier than finding every place in the code where you might want to change things later.
    
        control_color <- "slateblue"
        treatment_color <- "orange"
        
# Make some new data ----
        
  # If you'll need to join or modify data that will be used throughout, it's good to do that at the beginning here.
        full_hero_data <- join(d_hero, d_power, "name", "left", "first")
        
    
  # In this case the object made is small and fast, but if you made something that took a lot of computation time you
        # can save here here by writing it to your folders
          write.table(full_hero_data, here::here("2_modified_data/full_hero_data.txt"), sep = "\t")
        
        # You could also save the thing you made as an r object instead that you can load again later. This is 
          # especially useful for things like large models etc that can't be written to a plain column. For microbiome
          # or diet analyses, after running the full pipeline you can save the final objects and then just reload
          # them to pickup where you left off rather than having to run the full pipeline again.
          saveRDS(full_hero_data, here::here("5_other_outputs/full_hero_data.rds"))
          full_hero_data <- readRDS(here::here("5_other_outputs/full_hero_data.rds"))
    
# Analysis and figures ----
    # Carry on with sections for all your different analyses and figures. If you have a lot of separate sections,
        # you can split them into separate scripts.
          hero_fig <- full_hero_data %>%
            filter(Height > 1, Weight > 1, Alignment != "-", Gender != "-") %>%
            ggplot(aes(x = Height, y = Weight, color = Alignment)) +
            geom_point() + facet_wrap(~ Gender)
          
        # save here if you want to include in your markdown summary  
          # note that if your markdown output is html, saving as a pdf doesn't work well
          ggsave(here::here("3_r_scripts/hero_figure.png"), device = "png", width = 8, height = 4.5, units = "in")
        # save here if you want to just keep the figure to add into a manuscript, etc, later
          ggsave(here::here("4_output_figures/hero_figure.pdf"), device = "pdf") 
          
          
    # Fit a simple model and save the table
          fhd2 <- subset(full_hero_data, full_hero_data$Alignment == "good" |
                           full_hero_data$Alignment == "bad" |
                           full_hero_data$Alignment == "neutral")
          fhd2 <- subset(fhd2, fhd2$Gender == "Female" | fhd2$Gender == "Male")
          m <- glm(Height ~ Alignment + Gender, data = fhd2, na.action = na.exclude)
          m2 <- glm(Weight ~ Alignment + Gender, data = fhd2, na.action = na.exclude)
          save_table <- tab_model(m, m2, 
                    pred.labels = c("Intercept (align evil; female)", "Alignment Good", "Alignment Neutral", "Gender (male)"))
          saveRDS(save_table, here::here("5_other_outputs/hero_table.rds"))
    