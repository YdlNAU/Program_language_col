About the Epistemology of the web crawel
================================================

# when we browse the web 

> This is the from the http://python.jobbole.com/81334/

## the browse process

在用户浏览网页的过程中，我们可能会看到许多好看的图片，比如 http://image.baidu.com/ ，我们会看到几张的图片以及百度搜索框，这个过程其实就是用户输入网址之后，经过DNS服务器，找到服务器主机，向服务器发出一个**请求**，服务器经过解析之后，发送给用户的浏览器 HTML、JS、CSS 等文件，浏览器解析出来，用户便可以看到形形色色的图片了。

因此，用户看到的网页实质是由 HTML 代码构成的，爬虫爬来的便是这些内容，通过分析和过滤这些 HTML 代码，实现对图片、文字等资源的获取。

## the meaning of URL

URL，即统一资源定位符，也就是我们说的网址，统一资源定位符是对可以从互联网上得到的资源的位置和访问方法的一种简洁的表示，是互联网上标准资源的地址。互联网上的每个文件都有一个唯一的URL，它包含的信息指出文件的位置以及浏览器应该怎么处理它。


# the modules for craweling

- LWPs
- HTTPs
- Mojo
- WWW
- Web::Scraper

# awosome tutorial


