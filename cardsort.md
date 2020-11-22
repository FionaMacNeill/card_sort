<h1 class="title toc-ignore">From MySQL to Card Sort</h1>
<h4 class="author">Fiona MacNeill</h4>
<h4 class="date">22/11/2020</h4>


<div id="setup-your-workspace" class="section level2">
<h2>1. Setup your workspace</h2>
<p>Check the preferences in RStudio to make sure that your default working directory is set to a logical place on your computer. This is important as the final exported csv file will be saved there. In the code segment below we load the library for the dplyr package <a href="https://dplyr.tidyverse.org" class="uri">https://dplyr.tidyverse.org</a> - a free package that is part of Hadley Wickham’s Tidyverse <a href="https://www.tidyverse.org/" class="uri">https://www.tidyverse.org/</a>. This tutorial is based on an export of MySQL database tables for a WordPress blog <a href="https://wordpress.org" class="uri">https://wordpress.org</a>. However, the same principles can be applied to most CMS platforms. This could be used for sorting out taxonomies of blog posts or pages. In this example it is being used for blog pages.</p>
<p>Load the library for dplyr.</p>
<pre class="r"><code>library(&quot;dplyr&quot;) # Load the dplyr library</code></pre>
<pre><code>## 
## Attaching package: &#39;dplyr&#39;</code></pre>
<pre><code>## The following objects are masked from &#39;package:stats&#39;:
## 
##     filter, lag</code></pre>
<pre><code>## The following objects are masked from &#39;package:base&#39;:
## 
##     intersect, setdiff, setequal, union</code></pre>
</div>
<div id="create-your-data-frame" class="section level2">
<h2>2. Create your data frame</h2>
<p>Your data frame is a container for the data that you exported from your MySQL database. We are bringing the MySQL data into RStudio so that we can clean it up with the dplyr package.</p>
<pre class="r"><code>orig&lt;- read.csv(&quot;~/RMarkdown/card_sort/db_wp.csv&quot;) #Load your CSV file here. Replace &#39;db_wp.csv&#39; with your own filename.

names(orig) # Find out the column names as we will use these to manipulate the data</code></pre>
<pre><code>##  [1] &quot;ID&quot;                    &quot;post_author&quot;           &quot;post_date&quot;            
##  [4] &quot;post_date_gmt&quot;         &quot;post_content&quot;          &quot;post_title&quot;           
##  [7] &quot;post_excerpt&quot;          &quot;post_status&quot;           &quot;comment_status&quot;       
## [10] &quot;ping_status&quot;           &quot;post_password&quot;         &quot;post_name&quot;            
## [13] &quot;to_ping&quot;               &quot;pinged&quot;                &quot;post_modified&quot;        
## [16] &quot;post_modified_gmt&quot;     &quot;post_content_filtered&quot; &quot;post_parent&quot;          
## [19] &quot;guid&quot;                  &quot;menu_order&quot;            &quot;post_type&quot;            
## [22] &quot;post_mime_type&quot;        &quot;comment_count&quot;</code></pre>
</div>
<div id="create-a-data-frame-with-only-the-interesting-bits" class="section level2">
<h2>3. Create a data frame with only the interesting bits</h2>
<p>You can use the inspection tools in the ‘Environment’ tab within RStudio to take a look at the data in each column. This will help you to figure out which columns you want. For instance, the unassuming ‘guid’ column for a WordPress database contains the Page URL.</p>
<pre class="r"><code>orig &lt;- select(orig, post_title, post_status, post_type, guid) 
# We are using the &#39;select&#39; function within dplyr to subset the columns.</code></pre>
</div>
<div id="cleaning-up-the-data-a-bit-more" class="section level2">
<h2>4. Cleaning up the data a bit more</h2>
<p>So now we have four variables (columns) for our data set. This is a helpful subset and we can export it later as a .csv (comma separated values; compatible with MS Excel or HTML editors) if needed. For our card sort we still have some clean-up to do.</p>
<p>In this example, I am only interested in blog pages that are published (as in publicly visible), I don’t want any pages that do no have titles and I do not want any pages which do not have URLs.</p>
<pre class="r"><code># My new data frame is called &#39;pages&#39; as I would like to have an exportable list of pages with their URLs.

pages &lt;- filter(orig, post_type==&quot;page&quot;, post_status==&quot;publish&quot;)</code></pre>
<p>I also want to check if there are any posts with empty titles or empty URLs.</p>
<pre class="r"><code>pages %&gt;% summarise(count = sum(post_title==&quot;&quot; | guid==&quot;&quot;)) </code></pre>
<pre><code>##   count
## 1     0</code></pre>
<pre class="r"><code># It is useful to use sum and the OR (|) operator to find out if there are any pages without titles or URLs (the &#39;guid&#39; column)</code></pre>
<p>If there are, you can use filter to remove these from the ‘pages’ data frame.</p>
<pre class="r"><code>pages &lt;- filter(pages, post_title !=&quot;&quot;)
pages &lt;- filter(pages, guid !=&quot;&quot;)</code></pre>
<p>At this point it may be useful to export some of your data frames so that you have them for reference purposes. Take out the ‘#’ at the beginning of the lines starting in ‘write…’ if you want to run this code.</p>
<pre class="r"><code>#write.csv(pages, file = &quot;orig.csv&quot;) 
#Gives you the filtered data based on the original MySQL warts and all. Could be useful for finding duplicate pages and posts, including dead links.

#write.csv(pages, file = &quot;pages.csv&quot;) 
#Gives you a list of only published pages and their URLs again this could be helpful for finding duplicate pages.</code></pre>
</div>
<div id="a-super-clean-text-file-for-creating-my-card-for-sorting" class="section level2">
<h2>5. A super clean text file for creating my card for sorting</h2>
<p>In this example I used ‘Proven By Users’ <a href="https://www.provenbyusers.com" class="uri">https://www.provenbyusers.com</a> for card sorting. There are several other card sorting applications available and two export options are included in the next block to account for your needs. These export files will go to your home directory as the default if you have not changed this in the RStudio preferences.</p>
<pre class="r"><code>pages_cards &lt;- distinct(pages, post_title) # This is a new data frame for the purposes of making cards for the sort only. The &#39;distinct&#39; function removes any duplicates pages from the list.

#If you are are asked to copy and paste in the data use this option. Check your home folder/directory on your computer if you cannot find the export.
write.table(pages_cards, file = &quot;pages_cards.txt&quot;, row.names=FALSE, sep=&quot;\t&quot;, quote = FALSE)

#If you are asked to upload a csv of the data use this option. Beware of page titles featuring commas with this method!
write.csv(pages_cards, file = &quot;pages.csv&quot;, row.names=FALSE, quote = FALSE)</code></pre>
</div>
<div id="open-or-import-your-exported-file" class="section level2">
<h2>6. Open or import your exported file</h2>
<p>All done. Now you either need to open your text file and copy and paste in the information OR check the .csv file and then import it (based on the stipulations of the card sorting application you are using).</p>
<p>Thanks for using this tutorial!</p>
</div>
