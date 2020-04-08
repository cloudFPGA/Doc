# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
SOURCEDIR     = ./docsrc
BUILDDIR      = _build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile clean

clean:
	rm -rf doxyoutput/ cFDK_api/ repos_for_Doxygen/
	@$(SPHINXBUILD) -M clean "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

clone_local_cfdk_repo:
	mkdir -p repos_for_Doxygen
	git clone --depth=1 git@github.ibm.com:cloudFPGA/cFDK.git repos_for_Doxygen/cFDK

doxygen:
	cd docsrc && doxygen Doxyfile && cd ../

localhtml: clone_local_cfdk_repo doxygen
	@make html

dhtml: doxygen
	@make html

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
