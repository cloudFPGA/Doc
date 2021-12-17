![Banner for cF](./imgs/banner.png)

# About the cloudFPGA documentation

[![Build Status](https://travis.ibm.com/cloudFPGA/Doc.svg?token=8sgWzx3xuqu53CzFUy8K&branch=master)](https://travis.ibm.com/cloudFPGA/Doc)  [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![Python 3.6+](https://img.shields.io/badge/python-3.6+-blue.svg)](https://www.python.org/downloads/release/python-360/) [![made-with-sphinx-doc](https://img.shields.io/badge/Made%20with-Sphinx-1f425f.svg)](https://www.sphinx-doc.org/) [![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.ibm.com/cloudFPGA/Doc/pulse)

The cloudFPFA documentation is available as *GitHub* pages at:

|             |
|:----------: | 
| **https://cloudfpga.github.io/Doc/** |

These pages are generated automatically from three sources:
* the so-called [**Organization Documentation**](#documenting-the-organization) provided by this `README.md` and the `Markdown` 
  files located in the `./docsrc/pages/` folders of this repository,
* the so-called [**cF Repository Documentation**](#documenting-the-cf-repositories) provided by the `README.md` and the `Markdown` 
  files located in each cF repository,
* the so-called [**cF Source Code Documentation**](#documenting-the-cf-source-codes) retrieved from the declarations and documentation 
  comments in the software source files of the cF repositories.
  
We adopt the following tools for automating this documentation:
* [Sphinx](https://www.sphinx-doc.org/en/master/) is a tool that makes it easy to create 
intelligent and beautiful documentation.
* [Read the Docs (sphinx_rtd_theme)](https://readthedocs.org/) is a sphinx theme designed to look 
modern and be mobile-friendly.
* [Travis CI](https://travis-ci.org/) is a hosted continuous integration service used to build and 
test software projects hosted at *GitHub* (both on our public and IBM enterprise repositories).

# Table of Contents

1. [Documenting the Organization](#1-documenting-the-organization)  
    1.1 [How to automatically compile the documentation](#11-how-to-automatically-compile-the-documentation)  
    1.2 [How to manually compile the documentation](#12-how-to-manually-compile-the-documentation)        
2. [Documenting the cF Repositories](#2-documenting-the-cf-repositories)  
3. [Documenting the cF Source Codes](#3-documenting-the-cf-source-codes)  

## 1. Documenting the Organization

The current `Doc` repository defines the top-level structure of the cloudFPGA documentation.
It acts as a building pipeline of tasks that assembles the cloudFPGA documentation as a global 
set of *HTML* pages compiled from the various repositories located in the cloudFPGA organization.  
 
The global structure of the cloudFPGA documentation is defined by the markdown source files of 
the organization located in the folders`./docsrc/pages`.

Any change and commit to these folders will trigger an automatic re-compilation and re-generation
of the *GitHub* pages. However, if you need to re-build and update this documentation locally, 
please follow the step-by-step procedure in the 
[Manual documentation compilation](#howto-manual-documentation-compilation) section. 

### 1.1 How to automatically compile the documentation

As mentioned above, an new compilation of the overall cloudFPGA documentation is triggered 
whenever a commit to this current [Doc](https://github.com/cloudFPGA/Doc) repository occurs.
This build is performed by `Travis CI` on a containerized environment and the resulting static 
*HTML* files are pushed on the `gh_pages` branch of the current 
[Doc](https://github.com/cloudFPGA/Doc) repository. 
The repository is configured to match this branch to the 
[GitHub Pages](https://help.github.com/en/github/working-with-github-pages/getting-started-with-github-pages) 
and also bypass [jekyll](https://jekyllrb.com/) processing of `GitHub Pages` by creating an empty 
file named `.nojekyll` on the repository. Eventually the final documentation is available 
[here](https://pages.github.ibm.com/cloudFPGA/Doc/).

### 1.2 How to manually compile the documentation

If you need to manually compile the overall cloudFPGA documentation on your local development 
environment, please follow these steps:

#### 1.2.1 Sphinx and dependencies setup (Step 1/3)

To generate the Sphinx based python documentations, you need to setup:
```bash
which python3.6
virtualenv sphinx -p /usr/bin/python3.6
. sphinx/bin/activate
git clone git@github.com:cloudFPGA/Doc.git cloudFPGA-Doc
pip install -r ./cloudFPGA-Doc/docsrc/requirements.txt

```
#### 1.2.2 Rebuild documentation (Step 2/3)

```bash
. sphinx/bin/activate
cd cloudFPGA-Doc
git checkout master
< ... make your changes ... >
make clean
make localhtml
firefox _build/html/index.html & (to view your changes locally)
```

#### 1.2.3 Update documentation (Step 3/3)

```
git checkout gh-pages (ensure you are on this branch)
git commit -am "rebuild docs"
git push
```

## 2. Documenting the cF Repositories

Each cloudFPGA repository should be accompanied by a minimal documentation provided in the form 
of a `README.md` file and / or other ` Markdown` files. These files (if present) will then be 
pulled from their respective repositories and and will be parsed to generate the corresponding
HTML pages.

The following cF repositories are currently parsed for `Markdown` files:

* [cloudFPGA/cFDK](https://github.com/cloudFPGA/cFDK)
* [cloudFPGA/cFp_HelloKale](https://github.com/cloudFPGA/cFp_HelloKale)
* [cloudFPGA/cFp_HelloThemisto](https://github.com/cloudFPGA/cFp_HelloThemisto)
* [cloudFPGA/cFp_Zoo](https://github.com/cloudFPGA/cFp_Zoo)

> **_NOTE:_** In order to edit the documentation of the aforementioned repositories, you should apply the 
changes directly on the `Markdown` files in those repositories. Next, to make the changes being reflected 
onto the HTML pages, you can use the following automated or manual procedure. 

### 2.1 Automated update of a cF repository documentation

Force a [Restart Build](https://travis.ibm.com/cloudFPGA/Doc) job on the Travis CI page. 
This is useful when you don't have any changes for the current 
[Organization Documentation](#documenting-the-organization)
but you want update the documentation of a [specific cF repository](#documenting-the-cf-repositories). 

### 2.2 Manual update of a cF repository documentation

Clone the [Doc](https://github.com/cloudFPGA/Doc) repo, create a minor commit and push it. 
This is useful when you made changes in both the [Organization Documentation](#documenting-the-organization) 
and the [cF Repository Documentation](#documenting-the-cf-repositories). It is the `push` request 
that will trigger a new Travis CI building process.

The procedure is as follows:

```bash
git clone git@github.com:cloudFPGA/Doc.git cloudFPGA-Doc
cd cloudFPGA-Doc
< ... make your changes ... >
git commit -am "my changes in Doc repo"
git push
firefox https://pages.github.ibm.com/cloudFPGA/Doc/ & (view your changes)
```

> **_NOTE:_** The documentation compilation on Travis CI is expected to take several minutes, so be 
patient when you submit changes as they won't take effect instantly.

## 3. Documenting the cF Source Codes

The generation of the code documentation from the software source files is maintained in 
[Dox](https://github.com/cloudFPGA/Dox/), a separate repository of the cF organization. 
This documentation is in-lined as chapter [4.1](https://cloudfpga.github.io/Doc/pages/CFSPHERE/cfsphere.html#application-programming-interface-api) 
of the global cloudFPGA documentation, but it is also [available here ](https://cloudfpga.github.io/Dox/).
 













