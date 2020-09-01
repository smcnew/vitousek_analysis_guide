###
# I always start my scripts with a header giving a brief description of the purpose of the script.
# In this case, the goal is to make a template for new analyses in the lab and to describe why
# parts of the project folder are organized the way they are.
#
# Written by: Sabrina McNew & Conor Taff
# Last updated: 9/1/2020
# Run under R Studio 1.1.463 on Mac OSX 10.11.6
# See markdown file for saving session info. If you aren't working in markdown it is also 
# good practice to record package versions here.

# Load packages ----
  # Ending the line above with four dashes of four hashtags puts the chunk into your outline below. 
  # This makes it a lot easier to find things later in a long script.

  # I like to load all packages up front using 'pacman'. This way you can see right at the beginning
  # what is required and you are less likely to break your code when modifying it by moving a line
  # up to before the required package was loaded. I have a few packages I almost always load, but most
  # of these would change each time depending on the project. Just remember to add packages to the list
  # up here when you want to use them.
    pacman::p_load(tidyverse, here)
      # 'here' is useful for refering to relative path names in your project directory.

# Load data ----
  # here is where I would load any raw data that you have added to the project
    