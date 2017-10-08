The collection of my own function
====================================

This is my practice of <<Intermediate Perl>>

I really really appreciate the author for contributing such a easily understandable, glace and perfect masterpicce


# First try

`module-starter --module=ydl --author="yudalang" --email=yudalang1994@gmail.com --verbose`

```
Created ydl
Created ydl/lib
Created ydl/lib/ydl.pm
Created ydl/t
Created ydl/t/pod.t
Created ydl/t/pod-coverage.t
Created ydl/t/00-load.t
Created ydl/t/manifest.t
Created ydl/xt
Created ydl/xt/boilerplate.t
Created ydl/ignore.txt
Created ydl/Makefile.PL
Created ydl/Changes
Created ydl/README
Added to MANIFEST: Changes
Added to MANIFEST: ignore.txt
Added to MANIFEST: lib/ydl.pm
Added to MANIFEST: Makefile.PL
Added to MANIFEST: MANIFEST
Added to MANIFEST: README
Added to MANIFEST: t/00-load.t
Added to MANIFEST: t/manifest.t
Added to MANIFEST: t/pod-coverage.t
Added to MANIFEST: t/pod.t
Added to MANIFEST: xt/boilerplate.t
Created ydl/MANIFEST
Created starter directories and files
```

As for add the PM file.

`module-starter --module=maxvkai --dist=.`

and we need to change the ~/.module-starter/config to 

so we could just need to type `module-starter --module=ABC`

```
author: yudalang
email: yudalang1994@gmail.com
builder: Module::Build
verbose: 1
plugins: Module::Starter::AddModule

```


# Lightly change the PM file

The PM file is ultra important, so we just change this is enough.

## we need to get the import method

```
package Package::Name
use Exporter qw/import/;

our @EXPORT =qw /   /;
our @EXPORT = qw /  /;

our $VERSION = v0.0.1;

```


# My plan for the distribution

Combine the function in the three tasks in the li-yang-lab and the functions in the project eular.

Create a numeric class that have these method:

- $num-> is_prime;
- $num-> is_coprime(3);

By the way, the PCC and SPCC can also be employed.

