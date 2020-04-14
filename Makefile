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
	rm -rf ./doxyoutput/ ./docsrc/cFDK_api/ ./repos_for_Doxygen/cFDK
	@$(SPHINXBUILD) -M clean "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

clone_local_cfdk_repo:
	git clone --depth=1 -b update_md_for_doc_compatibility_did git@github.ibm.com:cloudFPGA/cFDK.git repos_for_Doxygen/cFDK

change_links:
	cd repos_for_Doxygen && python3 modify_links_cf.py && cd ../

doxygen:
	cd docsrc && doxygen Doxyfile && cd ../

localhtml: clone_local_cfdk_repo change_links doxygen
	@make html

dhtml: change_links doxygen
	@make html

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
