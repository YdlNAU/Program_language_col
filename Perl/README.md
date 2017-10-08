# perl_progress_everyday

Record the progress on studying Perl programing

My programming study strategy is following the description below:

* first learn deeply into one language.
* than use this language to understand better the linux OS
* as for perl, it's pretty clear which level you are(camel small middle and big)
* transite to learn other languages

- - -

**Perl 的小文章** 我的简书号是：“沧浪之水v” 因为在简书上创作周期短，而且编辑方便，所以小文章我一般放在那里。http://www.jianshu.com/nb/10284685

Short letters about Perl are in the `Jian Shu` http://www.jianshu.com/nb/10284685 

Welcome your arrival !


# perl important modules

> These modules you most know to have a good command of perl.

1. List::Util : This module inclues the most common functons such as sum,max. You don't need to constrct the repeat wheels. Note: the functions here is modified by the C, so I suppose your code is not run as fast as he.
2. Perl::Tidy : Many people say perl code is really ugly and give is a name "write-only language". OK here you can get a method to customolize your code or others' code to let the codes you interest be much more tidy.
3. Perl::Critic : advice for your code.
4. Smart::Comments : A really smart comments. you can control your code to be the comments or debuging your scripts. It's worthwhile to study it.
5. Data::Dumper : see the complex data structure. An alternative way is to enter the dubug mode (perl -d), than use `x $var` to see the structure. 

Note: **After I read the middle and master perl**, I find it's more worthwhile to know much about the self-attached core modules of the perl version 5.24. So I have create a excel file to store the information of the perl module.

# good perl tutorials 

1. You can go to perl monks
1. I really appreciate a perl programmer : Gabor Szabo. [Perl Maven](https://cn.perlmaven.com/) is an excelent website

# content1: the multiple processes and threads

summary here:

The perl scripts: ithreads.pl and process.pl are the two study tracks for understanding how to use thread and process.

**But in real application you don't need to "Reinvent the Wheel".**

I means you need to understand, but as fot using these tools, you can utilize the more mature and more safe method.

Two packages Parallel::ForkManager and iTheads::Quen could be use !

## learn and use perl to understand the process management 

Tips: use `htop -u user_name` to see the process exchage.

use perl for pipeline: we could use system and \` \` where system() have the return status and \` \` have the return output content;

as for the multi processing: we should use fork() and exec()


## use the multi threads

sometimes we need to use threads for sharing variables

see SHEN WEI'S [BLOG](http://www.tuicool.com/articles/uuaEVzE) as refence.

as for thread, the blog [here](http://blog.csdn.net/fireroll/article/details/8714281) you must not miss.


# content2: Pipeline operation script

## use perl

In the perl your can use the perl function: readdir() to operate the folder and do some repeat and boring work

Here are some template for your reference, if you want to see the full template, please see the my\_template [floder](https://github.com/YdlNAU/perl_progress_everyday/blob/master/my_template/template1.md).

```
opendir FILE, '.' or die "unsucceed ! $!"; # open the current floder

my @fileNames;
while (my $name = readdir FILE){
    next if $name=~/^\./;# (non-dot) file
    next if $name=~/pl$/;
    ###
    #Do sth
    ###
    push @fileNames,$name;

}

closedir FILE;
```

Than you can use system() function or \` \` operator!

## use zsh

install: I first learn form here: http://blog.csdn.net/tiansidehao/article/details/50056779

Than I learn here: http://yijiebuyi.com/blog/b9b5e1ebb719f22475c38c4819ab8151.html


# content3: save the perl template 

I have create the my\_template floder to store the template!


# content4: study the regular expression pattern modifiers

please see the regex floder !

in order for test I just use the HEREDOCUMENT tips to produce the testing materials

# content5: study DBI 

Aim: give a file lish refFlat.txt and give a search item, and than list all the lines that include the key words you are interesting!

I want to be a database engineer: so it's necessary step to learn it.

# content6: little tips

Please the *Tips.pl* file!


# content7: OOP, construct my own module

 Please see the floder create\_my\_distribution/

# content8: Use the already exits perl bio-utils

In the website fo [Bioutils](http://diverge.hunter.cuny.edu/labwiki/Bioutils), we could use this tools for bioinformatics.


# content9: Web Crawler

Please see the web\_crawler folder


**Stuff need to learn**


- [ ] known almost every functions in perl
- [ ] known almost every modules in perl
- [ ] Bio::Perl


# Note of Bio::Perl

The Bio::Perl is really really an important module:

The main module is called BioPerl. Some BioPerl-related distributions such as Bio::Graphics, BioPerl-db, BioPerl-run, BioPerl-gui, corba-server, BioPerl-ext, BioPerl-pipeline, BioPerl-microarray and corba-client packages are installed separately from BioPerl. Please refer to their respective documentation for more information. Note that only the following are supported at this time with the current API:

- BioPerl-db
- BioPerl-network
- BioPerl-run
- BioPerl-pedigree
- Bio::Graphics

