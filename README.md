# vitousek_analysis_guide

This will be our read-me document to outline the purpose of this repository 

This repository is meant to accomplish two things:

1. Serve as a blank template that can be copied to start a new project. The idea is that you can copy the entire repository structure and repurpose it for your own project with your own data and scripts etc, but keep the overall structure in terms of file organization and coding the same.

2. Compile a bunch of recommendations on suggested practices and tips for things that work well in our lab with links to additional information.


## FAQs: 

1. How do I download this to my computer? 
- In the top right corner of the github repository page there is a button that says "fork." Click on this to make a copy of it into your own Github page. 
- Then, click the green "code" button in *your* repository and copy the https:// path to the repository. 
- Open R Studio, and create a new project using the "Version Control" option. Choose "Git" and then paste the https:// path into the URL field. 
(If you have trouble with connecting Github and your RStudio project, or if none of the above makes any sense, refer to Jenny Bryan's guide https://happygitwithr.com/)

2. What do all these "git" words mean? 
- "Repository" - a place to organize all your files and documents for a project. In addition to keeping everything in one organized place, git repositories also provide a backup and version control. 
- "Commit" - Saving your changes to your local respository. Each time you commit you have to add a little note explaining what changes you made. 
- "Push" - Synchronizing the changes you made to the remote repository. I.e. if you make changes in your local computer and commit them, you need to push those changes to change the version that's stored on Github. If you're the only one working on your respository commit + push are usually done in one step. If you're collaborating with another user, sometimes there'll be conflicts between the "master" version and yours that need to be resolved. 
-"Fork" - Copy a version of the master repository that you will modify and then merge back to the original. Adds an extra layer of scrutiny to make sure you don't change anything important. This is important when you're working on someone else's code, or working collaboritvely on code. 

3. How do I make or suggest changes to our analysis guide? 
- Easy: Start a new issue where you can make suggestions or point out a problem. 
- Harder: If you want full editing access ask to be a "collaborator" where you'll be able to make changes and start pull requests to the master branch. 
