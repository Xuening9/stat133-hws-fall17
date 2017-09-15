up02-xuening-hu
================

``` r
#load the objects
load("nba2017-salary-points.RData")
```

SUMMARY
=======

For all numeric vectors
-----------------------

### experience

``` r
summary(experience)
```

    ##    Length     Class      Mode 
    ##       441 character character

### salary

``` r
summary(salary)
```

    ##     Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
    ##     5145  1286160  3500000  6187014  9250000 30963450

### points

``` r
summary(points)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##     0.0   156.0   432.0   546.6   780.0  2558.0

``` r
summary(points1)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##    0.00   21.00   58.00   92.47  120.00  746.00

``` r
summary(points2)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##     0.0    39.0   111.0   152.5   213.0   730.0

``` r
summary(points3)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##    0.00    3.00   32.00   49.71   78.00  324.00

What are the typical values in each vector?
===========================================

-   mean
-   standard deviation
-   minimum value
-   maximum value
-   median
-   1st and 3rd quartiles

Standard Deviation
------------------

``` r
sd(salary)
```

    ## [1] 6571890

``` r
sd(points)
```

    ## [1] 489.0156

``` r
sd(points1)
```

    ## [1] 109.7949

``` r
sd(points2)
```

    ## [1] 143.6984

``` r
sd(points3)
```

    ## [1] 55.9721

What's the spread in each vector?
=================================

-   the salary has a large standard deviation which means it has a large difference between the content numbers.
-   the points3 has the smallest standard deviation among points, which means the content numbers are closed to the average and evenly.

Graph
=====

``` r
hist(salary)
```

![](up02-xuening-hu_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-6-1.png)

``` r
boxplot(salary)
```

![](up02-xuening-hu_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-6-2.png) \#frequency table

``` r
table(team)
```

    ## team
    ## ATL BOS BRK CHI CHO CLE DAL DEN DET GSW HOU IND LAC LAL MEM MIA MIL MIN 
    ##  14  15  15  15  15  15  15  15  15  15  14  14  15  15  15  14  14  14 
    ## NOP NYK OKC ORL PHI PHO POR SAC SAS TOR UTA WAS 
    ##  14  15  15  15  15  15  14  15  15  15  15  14

relative frequency table
========================

``` r
f.table=table(team)
rf.table=f.table/length(team)
```

frequency Graph
===============

``` r
barplot(f.table)
```

![](up02-xuening-hu_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-9-1.png)

``` r
barplot(rf.table)
```

![](up02-xuening-hu_files/figure-markdown_github-ascii_identifiers/unnamed-chunk-9-2.png) \#description of the graph \#\#What is the overall shape? - the graph of the frequency of salary goes all way down. - the graph of the frequency of team has the same shape with the relative frequency table. \#\#What is the typical center?

Overall range, along with an interval of typical measurements.
--------------------------------------------------------------

R Markdown
----------

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

``` r
summary(cars)
```

    ##      speed           dist       
    ##  Min.   : 4.0   Min.   :  2.00  
    ##  1st Qu.:12.0   1st Qu.: 26.00  
    ##  Median :15.0   Median : 36.00  
    ##  Mean   :15.4   Mean   : 42.98  
    ##  3rd Qu.:19.0   3rd Qu.: 56.00  
    ##  Max.   :25.0   Max.   :120.00

Including Plots
---------------

You can also embed plots, for example:

![](up02-xuening-hu_files/figure-markdown_github-ascii_identifiers/pressure-1.png)

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
