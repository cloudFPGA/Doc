[![Build Status](https://travis.ibm.com/cloudFPGA/Doc.svg?token=8sgWzx3xuqu53CzFUy8K&branch=master)](https://travis.ibm.com/cloudFPGA/Doc)  [![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) [![Python 3.6+](https://img.shields.io/badge/python-3.6+-blue.svg)](https://www.python.org/downloads/release/python-360/) [![made-with-sphinx-doc](https://img.shields.io/badge/Made%20with-Sphinx-1f425f.svg)](https://www.sphinx-doc.org/) [![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.ibm.com/cloudFPGA/Doc/pulse)

# cloudFPGA Documentation info
[Documentation and tutorials for cloudFPGA project.](https://pages.github.ibm.com/cloudFPGA/Doc/)

There are two ways to contribute to the documentation of cloudFPGA project, the automating compilation and and the manual compilation.

## Automated documentation compilation

We adopt the following tools for automating the documentation of cloudFPGA project:
* [Sphinx](https://www.sphinx-doc.org/en/master/) is a tool that makes it easy to create intelligent and beautiful documentation.
* [Read the Docs (sphinx_rtd_theme)](https://readthedocs.org/) is a sphinx theme designed to look modern and be mobile-friendly.
* [Travis CI](https://travis-ci.org/) is a hosted continuous integration service used to build and test software projects hosted at GitHub (both on our public and IBM enterprise repositories).
* [Doxygen](http://www.doxygen.nl/) is the de facto standard tool for generating documentation from annotated sources of several programming languages.
* [Breathe](https://breathe.readthedocs.io/en/latest/) provides a bridge between the Sphinx and Doxygen documentation systems.
* [Exhale](https://exhale.readthedocs.io/en/latest/index.html) is a Sphinx extension that depends on the excellent Breathe extension which enables parsing Doxygen documentation into the Sphinx domain.

The overall documentation compilation process is triggered by a new commit to [cloudFPGA Doc repository](https://github.ibm.com/cloudFPGA/Doc). Then `Travis CI` is building the documentation for the cloudFPGA (general information, tutorials, etc.), as well as the documentation for the code (C, C++, VHDL, etc.) on a containerized environment and pushes the generated static HTML files on the `gh_pages` branch of [cloudFPGA Doc repository](https://github.ibm.com/cloudFPGA/Doc). The repository is configured to match this branch to [GitHub Pages](https://help.github.com/en/github/working-with-github-pages/getting-started-with-github-pages) and also bypass [jekyll](https://jekyllrb.com/) processing of `GitHub Pages` by creating an empty file named `.nojekyll` on the repository. Eventually the final documentation is available [here](https://pages.github.ibm.com/cloudFPGA/Doc/).

#### Step 1/1: Update Documentation

```bash
git clone git@github.ibm.com:cloudFPGA/Doc.git cloudFPGA-Doc
cd cloudFPGA-Doc
< ... make your changes ... >
git push
firefox https://pages.github.ibm.com/cloudFPGA/Doc/ & (view your changes)
```

**NOTE**: the documentation compilation on Travis CI is expected to take several minutes, so be patient when you submit changes until the time these take effect on the documentation.

***

## Manual documentation compilation
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

**NOTE**: To avoid the long-time for building documentation for the source code, you can run `make html` instead `make localhtml` on the script above. This will not clone the source-code repositories of cloudFPGA and eventually there will be no repo to parse the source code with Doxygen. Expect an empty documentation for API then.

#### Step 3/3: Update Documentation

```
git checkout gh-pages (ensure you are on this branch)
git commit -am "rebuild docs"
git push
```
