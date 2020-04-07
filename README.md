[![Build Status](https://travis.ibm.com/cloudFPGA/Doc.svg?token=8sgWzx3xuqu53CzFUy8K&branch=master)](https://travis.ibm.com/cloudFPGA/Doc)

# cloudFPGA Doc
[Documentation and tutorials for cloudFPGA. project](https://pages.github.ibm.com/cloudFPGA/Doc/)

## Automated documentation compilation

We adopt the following tools for automating the documentation of cloudFPGA project:
* [Sphinx](https://www.sphinx-doc.org/en/master/) is a tool that makes it easy to create intelligent and beautiful documentation.
* [Read the Docs Sphinx Theme (sphinx_rtd_theme)](https://readthedocs.org/) is a sphinx theme designed to look modern and be mobile-friendly.
* [Travis CI](https://travis-ci.org/) is a hosted continuous integration service used to build and test software projects hosted at GitHub (both our public and IBM enterprise edition).
* [Doxygen](http://www.doxygen.nl/) is the de facto standard tool for generating documentation from annotated sources of several programming languages.
* [Breathe](https://breathe.readthedocs.io/en/latest/) provides a bridge between the Sphinx and Doxygen documentation systems.
* [Exhale](https://exhale.readthedocs.io/en/latest/index.html) is a Sphinx extension that depends on the excellent Breathe extension which enables parsing Doxygen documentation into the Sphinx domain.

The overall documentation compilation process is triggered by a new commit to [cloudFPGA Doc repository](https://github.ibm.com/cloudFPGA/Doc). Then `Travis CI` is building the documentation for the cloudFPGA (general information, tutorials, etc.), as well as the documentation for the code (C, C++, VHDL, etc.) on a containerized environment and pushes the generated static HTML files on the `gh_pages` branch of [cloudFPGA Doc repository](https://github.ibm.com/cloudFPGA/Doc). The repository is configured to match this branch to [GitHub Pages](https://help.github.com/en/github/working-with-github-pages/getting-started-with-github-pages) and eventually the final documentation is available at [GitHub Pages](https://pages.github.ibm.com/cloudFPGA/Doc/)


## Manually documentation compilation
In case you need to manually compile the documentation of cloudFPGA project on your local development environment, please follow these steps:

#### 1. Spinx setup

To generate the spinx based python documentations, you have to setup:
```bash
which python3.6
virtualenv sphinx -p /usr/bin/python3.6
. sphinx/bin/activate
pip install -r ./docsrc/requirements.txt
```
#### 2. Rebuild Documentation

```bash
. sphinx/bin/activate
git clone git@github.ibm.com:cloudFPGA/Doc.git cloudFPGA-Doc
cd cloudFPGA-Doc
git checkout gh-pages
make clean
make github
git commit -a -m"rebuild docs"
```
