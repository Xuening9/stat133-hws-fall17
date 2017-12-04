post2-xuening-hu
================
Xuening Hu

> -   The Importance of LaTex and how the reporting tools benefit Statistics
> -   The general introduction of the LaTex and reporting tools.
> -   How reporting tools affect modern statistics.
> -   A few examples of LaTex.

------------------------------------------------------------------------

### Seting wd

``` r
setwd("/Users/Xuening/STAT133/stat133-hws-fall17/post2")
```

Introduction
============

-   When we were a child we were always upset because it was very hard to
    understand the complex symbol in the mathematics textbook from the very beginning,
    such as the division, trigonometry functions, integration formulas, Taylor series
    and so on. I can even remember the very first day that I met parenthesis that
    has a priority operational order, which had made me struggle for a long time.
    Even the finest format operation expression could make us easily lost in calculation.
    Could you imagine how confused when you face to a bunch of unformatted expression?
    Have you ever think about how beautiful the typesetted document shown on our
    textbook, but we could not type it by our own? Have you experienced how hard
    to type an equation in google search box when you met a complex one? To sum up,
    the formatted mathematics formula is significant valued during the process of
    learning statistics.

> LaTeX is a document preparation system that is written in
> \[Plain text\] as opposed to the formatted text found in WYSIWYG
> word processors like Microsoft Word, which meaning you only have focus on the
> contents of your document and the computer will take care of the formatting.
> The writer uses markup tagging conventions to define the general structure of
> a document (such as article, book, and letter), to stylise text throughout a
> document (such as bold and italics), and to add citations and cross-references.
> Instead of spacing out text on a page to control formatting, as with Microsoft
> Word or LibreOffice Writer, users can enter plain text and let LaTeX take care
> of the rest.

[Reference from this website](https://www.sharelatex.com/learn/Learn_LaTeX_in_30_minutes/)
[And this](https://en.wikipedia.org/wiki/LaTeX/)
But how to use it and why is it better than other tools? Let we figure it out
together.

### Image(who created LaTex)

![Leslie Lamport](https://upload.wikimedia.org/wikipedia/commons/5/50/Leslie_Lamport.jpg)
![LaTex symbol](https://blogs.kent.ac.uk/smsas-web-author/files/2015/08/LaTeX_logo.png)

Figure 2: This picture shows the right content format for LaTex symbol if it possible to write.
If not, LaTex is ok but not written in Latex or latex.

Content
=======

-   LaTeX was originally written in the early 1980s by Leslie Lamport at SRI
    International. It simply said as same as R scrip when you generate a formatting
    document. But the formatting rules are distinct to each other.
    I find some special and useful ones to share with you.

### Adding a title, author and date

``` r
#\documentclass[12pt, letterpaper, twoside]{article} \
#\usepackage[utf8]{inputenc} \
```

This is the encoding for the document. It can be omitted or changed to
another encoding but utf-8 is recommended. Unless you specifically need
another encoding, or if you are unsure about it, add this line to the preamble.

``` r
#\title{First document} \
#\author{Hubert Farnsworth \thanks{funded by the ShareLaTeX team}} \
#\date{February 2017} \
```

![Title](https://www.sharelatex.com/learn-scripts/images/e/e9/Learnlatex1.PNG)

### Captions, labels and references

``` r
#\begin{figure}[h] \
#    \centering \
#    \includegraphics[width=0.25\textwidth]{mesh} \
#    \caption{a nice plot} \
#    \label{fig:mesh1} \
#\end{figure} \
```

![Figure](https://www.sharelatex.com/learn-scripts/images/2/25/InsertingImages.PNG)

The most interesting part of LaTex is adding the math. LaTeX allows two writing
modes for mathematical expressions: the inline mode and the display mode.
We use

``` r
#“$...$”, “$$...$$” 
#or “\( ... \)”, ”\[…\]” \
#or “\begin{math} ... \end{math}”, “\begin{equation} ... \end{equation}” \
```

to cite the math equations in context. The previous one is used in inline mode,
the other one is used in display mode. For example:

### inline mode

I am writing an equation with variable *a* = 0.

### display mode

I am writing an equation as follow: ![sum series](https://raw.githubusercontent.com/ucb-stat133/stat133-fall-2017/master/labs/lab08-images/sum_series1.png)
$$
\\sum\_{k=0}^{n} \\frac{1}{2^k} = 1 + \\frac{1}{2} + \\frac{1}{4} + \\frac{1}{8} + \\dots + \\frac{1}{2^n}
$$

(From this equation you can see how convenience to read a formatted equation)

LaTex does really good job on the separation of content and style which defines
how different elements within your document should look (like Cascading Style
Sheets defining styles in HTML pages). Its portability, flexibility, and
stability have great performance among its users (Andrew Roberts). So somebody
would ask that why don’t we choose Microsoft Word as a format builder?
What are the advantages of LaTex compared with Microsoft Word?

Conclusion
----------

-   Microsoft Word is for general purpose documentation. As against that LaTex is
    a strongly typed language engineered for technical documentation. In crude
    sense some of the advantages of using LaTex is the programming kinda approach
    to putting your stuff in place. Various packages help in creating a sharp and
    nicely written articles, reports, etc. There are certain commands for many
    mathematical building blocks. For graphics again we have packages and some
    more commands. But once you get to know these commands, writing and creating
    high quality documents becomes extremely easy. Microsoft words does have many
    facilities, but the format and the way one uses it is very dis-ordered and
    not so sturdy. Across different versions, many basic properties like alignment,
    are found to be varying giving one a not so uniform rendering.

Code
----

The example I choose is using the LaTex format to compute mathematics formulas to show you both unformatted and formatted so that you can see the difference and significance of reporting tools. But it's hard to show the LaTex content in R studio, I wrote them in comment format and linked the outputs as pictures

Funny video
-----------

[Writing equations in Latex (Interation,Differenciation)](https://www.youtube.com/watch?v=juTbT-gyxCA/)

Take-home message
-----------------

> The only new thing in the world is the history you don’t know. —Harry S Truman

-   All the creatures during the advance in Statistics benefit the students  like us who just step into the statistics field. The fruits from the previous people let the process of learning becomes more vivid and clear. They share their work to the whold world generously which inspire me that studying does not only benefit ourselves but also the whole human society.

Source
------

-   [A Brief introduction and tutorial](https://www.sharelatex.com/learn/Mathematical_expressions)
-   [Andrew Roberts. "Benefits of LaTeX typesetting""](http://www.andy-roberts.net/writing/latex/benefits/)
-   “Detailed Reference for Taking TeX to the Web.” is attached in the file,  please check it if you are interested

### Works Cited

-   Dyson,Pete. “Detailed Reference for Taking TeX to the Web.” Seybold Report on Interrnet Publishing,
    vol. 4, Sep 2017, pp. 26.1/4p.  
-   Dickinson,John,Oman,Paul. "Tex/LaTex: Anatural for technical publishing."  IEEE Software, vol. 6, Sep 2015, pp. 97. 4p.
