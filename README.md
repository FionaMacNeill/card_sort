<h1>From MySQL to Card Sort</h1>

<p xmlns:dct="http://purl.org/dc/terms/" xmlns:cc="http://creativecommons.org/ns#" class="license-text"><a rel="cc:attributionURL" property="dct:title" href="https://github.com/FionaMacNeill/card_sort">From MySQL to Card Sort</a> by <a rel="cc:attributionURL dct:creator" property="cc:attributionName" href="https://github.com/FionaMacNeill">Fiona MacNeill</a> is licensed under <a rel="license" href="https://creativecommons.org/licenses/by-sa/4.0">CC BY-SA 4.0
<br>
<img style="height:5px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/cc.svg?ref=chooser-v1" /><img style="height:5px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/by.svg?ref=chooser-v1" /><img style="height:5px!important;margin-left:3px;vertical-align:text-bottom;" src="https://mirrors.creativecommons.org/presskit/icons/sa.svg?ref=chooser-v1" /></a></p>

<hr>

<h2>Pre-requisites:</h2> 
This tutorial assumes that you already have R, RStudio and the dplyr package installed. All these are available free. To get R and RStudio installed follow the steps on this <a href="https://rstudio.com/products/rstudio/download/#download" target="_blank">page from RStudio</a>. You should also have an export of MySQL database table/s to hand in CSV format. If you need help with that more information is provided below.<br>

**Read the tutorial here:** [../master/cardsort.md](../master/cardsort.md)<br>
Estimated time (not including pre-requisites): 10mins

**Download the R Markdown file to use with your own data here:** [../master/cardsort.Rmd](../master/cardsort.Rmd)

<h1>Prior to using the tutorial: export your MySQL Data</h1>

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

<h1>Check the Preferences in the RStudio software</h1>

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
 
