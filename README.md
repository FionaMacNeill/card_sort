<h1>From MySQL to Card Sort - V2.0 (currently in the process of being edited)</h1>

<p xmlns:dct="http://purl.org/dc/terms/" xmlns:cc="http://creativecommons.org/ns#" class="license-text"><a rel="cc:attributionURL" property="dct:title" href="https://github.com/FionaMacNeill/card_sort">From MySQL to Card Sort</a> by <a rel="cc:attributionURL dct:creator" property="cc:attributionName" href="https://github.com/FionaMacNeill">Fiona MacNeill</a> is licensed under <a rel="license" href="https://creativecommons.org/licenses/by-sa/4.0">CC BY-SA 4.0
<br>
<img style="height:5px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/cc.svg?ref=chooser-v1" /><img style="height:5px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/by.svg?ref=chooser-v1" /><img style="height:5px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/sa.svg?ref=chooser-v1" /></a></p>

<hr>

This is a tutorial for UX designers and web developers who are new to using R and RStudio.

<h1>Goal</h1>
By the end of this tutorial you will have cleaned-up a MySQL export file listing 'pages' and 'posts' for a blog. The file starts with 328 rows and 23 columns and by the end of the tutorial there will be 11 rows and 4 columns.

Estimated time (not including work environment setup): 15mins

<h1>First time using R and RStudio? Start here.</h1>
<h1>Step 1: Setting up your work environment</h1> 

To briefly explain the relationship between R and RStudio. R is a language and environment for statistical computing and graphics, RStudio is a user interface for R making it easier for us to write code, test it, debug it and then view outputs visually within one software application. The following steps, 1-6 only need to be completed when you use R and RStudio for the first time.

1. Before you can use RStudio you need to install R. At the time of writing RStudio requires R version 3.0.1+. <a href="https://cran.rstudio.com/" target="_blank">Get the installer for R from the R CRAN</a>.
2. R is open source software, so it best practice for the safety of your computer to review the MD5 checksum. This is to ensure that the downloaded file has not been tampered with by any third-parties. 

On a Mac:
To check the MD5 checksum open the terminal application and type in:
<code>openssl sha1</code> then drag and drop the downloaded .pkg file onto the terminal window. This will automatically provide you with the directory path.
You will be shown a long string featuring letters and numbers and you want to compare it to the SHA1 shown next the package on the R CRAN website.

Add image here...

On Windows:
To check the MD5 checksum you need to install an application to do this - the interface-based option is [MD5Summer](http://www.md5summer.org/)

3. Once you have confirmed that the MD5 checksum matches, complete the installation of the R package/executable.
4. Install RStudio from the [RStudio.com site](https://rstudio.com/products/rstudio/download/#download).
4. Before completing installation check the SHA256 check sum. This follows the same principles as above.

e.g. On a Mac:
<code>openssl sha256</code>
then drag and drop the downloaded .pkg file onto the terminal window. Compare the string shown to the one on the RStudio website.

Add image here...

5. Once you have confirmed that the SHA256 checksum matches, complete the installation of RStudio.

<h1>Step 2: Getting started with R and RStudio</h1> 

This tutorial has been created using an RMarkdown file. This is a type of file that includes both written descriptions and chunks of code. Each chunk of code can be run seperately and in sequence. This allows you to see how things work and test out incremental changes without re-running all of your code from the beginning. We recommend completing the entire tutorial within RStudio itself, by working through the RMarkdown file.

The tutorial uses two free RStudio packages, we will take you through how to install these:
* [Dplyr](https://dplyr.tidyverse.org/) - a package for data transformations. Helpful for filtering and taming wild and complex datasets.
* [Knitr](https://yihui.org/knitr/) - a package for knitting together and processing the RMarkdown format of the tutorial file.

'Packages' are essentially reusable units of R code and typically include a series of reuseable functions for specific statistical purposes [https://r-pkgs.org/index.html](Wickham and Bryan, 2019).


**Download the R Markdown file to use with your own data here:** [../master/cardsort.Rmd](../master/cardsort.Rmd)


<h1>Add this to the MardDown file Check the Preferences in the RStudio software</h1>

**Next,** create a folder on your computer for your RStudio projects and subfolder for this particular project. Before you start working, check the RStudio > Preferences to make sure that the software is using your preferred home directory (screenshot from the Mac version of RStudio is included below for reference).

<img src="../master/rstudioprefs.png" alt="A screenshot showing the General preferences in RStudio. Specifically highlights the working directory" />

<h1>When you have finished the tutorial</h1>

I used ['ProvenByUsers'](https://www.provenbyusers.com/) for my card sort (other card sorting applications are available). I am not sponsored by any card sorting software vendors.

You can find the import option under 'Cards' > 'Card List' > 'Import It Now'.
<img src="../master/01cardImport.png" alt="Screenshot of the 'card' options in ProvenByUsers software. The cursor is shown pointing to the 'Import It Now' link in the 'Card List' section" />

Then copy and paste in the text file export that you created by working through the RStudio tutorial.
<img src="../master/02cardImport.png" alt="Screenshot of pasted page names in the ProvenByUsers' card import tool" />

Your cards will now be available for use.
<img src="../master/03cardImport.png" alt="Screenshot of imported card titles ready to sort in the ProvenByUsers' card import tool" />

<h1>Appendix 1: Export your own MySQL Data</h1>

This tutorial is based on an export of MySQL database tables for a WordPress Blog. The recommended settings below are based on WordPress, if you are using a different CMS the tables may differ. The interface for phpMyAdmin is shown in the screenshot linked below, but you can achieve similar results with the terminal or command line. You can also export the 'wp_posts' table directly from that section of the database, but I just want to show this from the full database to demonstrate the options, as you may wish to export other tables at the same time such as 'wp_terms'.

1. Select the database that you want from the list on the left.
2. Select the 'Export' option from the tabs along the top.
3. Select the 'Custom - display all possible options' radio button.
4. Select the CSV from the dropdown options for format.
5. Untick all the checkboxes except those tables that you want, so in this case we are only interested in 'wp_posts'. The table 'wp_posts' includes all posts and pages.
6. **Important:** Tick the box to 'Put columns names in the first row'. This will make your data much easier to work with in RStudio.
7. Click on 'Go' to export and download the file.

<a href="../master/mySQLexportSettings.png"><img src="../master/mySQLexportSettings.png" width="300px" alt="Annotated screenshot of the phpMyAdmin export settings"></a>
<caption>Click on the image to view it at full size.</caption>
 
