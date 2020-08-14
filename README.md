## Generic cloudFPGA Documentation

[![Build Status](https://travis.ibm.com/cloudFPGA/Doc.svg?token=8sgWzx3xuqu53CzFUy8K&branch=master)](https://travis.ibm.com/cloudFPGA/Doc)  [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![Python 3.6+](https://img.shields.io/badge/python-3.6+-blue.svg)](https://www.python.org/downloads/release/python-360/) [![made-with-sphinx-doc](https://img.shields.io/badge/Made%20with-Sphinx-1f425f.svg)](https://www.sphinx-doc.org/) [![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.ibm.com/cloudFPGA/Doc/pulse)

[Documentation and tutorials for cloudFPGA project.](https://pages.github.ibm.com/cloudFPGA/Doc/)

**NOTE**: This repository acts as a building pipeline of tasks that results in the actual documentation in static
html pages. This is the generic documentation of the cloudFPGA project, including the desctiprtion of the cloudFPGA 
components, tutorials, etc. The documentation of the cloudFPGA source code is maintained in a 
[separate repository](https://github.ibm.com/cloudFPGA/Dox/) and 
[is available here ](https://pages.github.ibm.com/cloudFPGA/Dox/).


![Overview of Doc repository](https://github.ibm.com/cloudFPGA/Doc/blob/master/docsrc/images/doc_repo_overview.png?raw=true)


There are two ways to contribute to the documentation of cloudFPGA project, the automating compilation and and the manual compilation.

### Automated documentation compilation

We adopt the following tools for automating the documentation of cloudFPGA project:
* [Sphinx](https://www.sphinx-doc.org/en/master/) is a tool that makes it easy to create intelligent and beautiful documentation.
* [Read the Docs (sphinx_rtd_theme)](https://readthedocs.org/) is a sphinx theme designed to look modern and be mobile-friendly.
* [Travis CI](https://travis-ci.org/) is a hosted continuous integration service used to build and test software projects hosted at GitHub (both on our public and IBM enterprise repositories).

The overall documentation compilation process is triggered by a new commit to 
[cloudFPGA Doc repository](https://github.ibm.com/cloudFPGA/Doc). Then `Travis CI` is building the documentation 
for the cloudFPGA (general information, tutorials, etc.)on a containerized environment and pushes the generated 
static HTML files on the `gh_pages` branch of [cloudFPGA Doc repository](https://github.ibm.com/cloudFPGA/Doc). 
The repository is configured to match this branch to 
[GitHub Pages](https://help.github.com/en/github/working-with-github-pages/getting-started-with-github-pages) and 
also bypass [jekyll](https://jekyllrb.com/) processing of `GitHub Pages` by creating an empty file named `.nojekyll` 
on the repository. Eventually the final documentation is available [here](https://pages.github.ibm.com/cloudFPGA/Doc/).



#### Update cloudFPGA Generic Documentation
Since in this repository we don't host any cloudFPGA source code, the actual source code is pulled from 
other repositiories in order to parse the `Markdown` files and generate the rpspective html output.
The following repositories are being parsed for `Markdown` files:

* [cloudFPGA/cFDK](https://github.ibm.com/cloudFPGA/cFDK)
* [cloudFPGA/cFp_Monolithic](https://github.ibm.com/cloudFPGA/cFp_Monolithic)
* [cloudFPGA/cFp_Vitis](https://github.ibm.com/cloudFPGA/cFp_Vitis)

In order to edit the documentation of the aforementioned repositiories, you should apply the changes 
directly on the `Markdown` files in those repositories.

Then, to make the changes being reflected onto the html pages, there are two options:
1. Force a `Restart Build` job on [the Travis CI page of this repository](https://travis.ibm.com/cloudFPGA/Doc). This is useful when don't have any changes for this actual documentation repository and you only intend to keep the cloudFPGA generic documentation up to date with the Markdown files of the cloudFPGA repositories listed above.
2. Clone this repo, create a minor commit and push. This is useful when you also have some changes for this actual documentation repository (i.e. pipeline of tasks). The `push` request will trigger a new Travis CI building process.

#### Update this documentation
```bash
git clone git@github.ibm.com:cloudFPGA/Doc.git cloudFPGA-Doc
cd cloudFPGA-Doc
< ... make your changes ... >
git commit -am "my changes in Doc repo"
git push
firefox https://pages.github.ibm.com/cloudFPGA/Doc/ & (view your changes)
```

**NOTE**: the documentation compilation on Travis CI is expected to take several minutes, so be patient when you submit changes until the time these take effect on the documentation.

***

### Manual documentation compilation
In case you need to manually compile the documentation of cloudFPGA project on your local development environment, please follow these steps:

#### Step 1/3: Sphinx and dependencies setup

To generate the Sphinx based python documentations, you have to setup:
```bash
which python3.6
virtualenv sphinx -p /usr/bin/python3.6
. sphinx/bin/activate
git clone git@github.ibm.com:cloudFPGA/Doc.git cloudFPGA-Doc
pip install -r ./cloudFPGA-Doc/docsrc/requirements.txt
```
#### Step 2/3: Rebuild Documentation

```bash
. sphinx/bin/activate
git checkout gh-pages  (assuming you are on cloudFPGA-Doc folder)
< ... make your changes ... >
make clean
make localhtml
firefox _build/html/index.html & (view your changes locally)
```

**NOTE**: To avoid the long-time for building documentation for the source code, you can run `make html` 
instead `make localhtml` on the script above.

#### Step 3/3: Update Documentation

```
git checkout gh-pages (ensure you are on this branch)
git commit -am "rebuild docs"
git push
```
