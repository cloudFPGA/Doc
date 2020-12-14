# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
SOURCEDIR     = ./docsrc
BUILDDIR      = _build

PDFBUILDDIR   = /tmp
PDF           = ./manual.pdf

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile clean

clean:
	rm -rf ./doxyoutput/ ./docsrc/cFDK_api/ ./repos_for_Doxygen/cFDK ./repos_for_Doxygen/Dox ./repos_for_Doxygen/cFp_Vitis ./repos_for_Doxygen/cFp_Monolithic ./repos_for_Doxygen/cFp_EchoThemisto ./repos_for_Doxygen/cFp_Uppercase ./repos_for_Doxygen/cFp_Triangle
	@$(SPHINXBUILD) -M clean "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

clone_local_cfdk_repo:
	git -C 'repos_for_Doxygen/cFDK' pull             || git clone --depth=1 git@github.ibm.com:cloudFPGA/cFDK.git repos_for_Doxygen/cFDK
	git -C 'repos_for_Doxygen/Dox' pull              || git clone --depth=1 git@github.ibm.com:cloudFPGA/Dox.git repos_for_Doxygen/Dox
	git -C 'repos_for_Doxygen/cFp_Monolithic' pull   || git clone --depth=1 git@github.ibm.com:cloudFPGA/cFp_Monolithic.git repos_for_Doxygen/cFp_Monolithic
	git -C 'repos_for_Doxygen/cFp_Vitis' pull        || git clone --depth=1 git@github.ibm.com:cloudFPGA/cFp_Vitis.git repos_for_Doxygen/cFp_Vitis
	git -C 'repos_for_Doxygen/cFp_EchoThemisto' pull || git clone --depth=1 git@github.ibm.com:cloudFPGA/cFp_EchoThemisto.git repos_for_Doxygen/cFp_EchoThemisto
	git -C 'repos_for_Doxygen/cFp_Uppercase' pull    || git clone --depth=1 git@github.ibm.com:cloudFPGA/cFp_Uppercase.git repos_for_Doxygen/cFp_Uppercase
	git -C 'repos_for_Doxygen/cFp_Triangle' pull     || git clone --depth=1 git@github.ibm.com:cloudFPGA/cFp_Triangle.git repos_for_Doxygen/cFp_Triangle

change_links:
	cd repos_for_Doxygen && python3 modify_links_cf.py && cd ../

doxygen:
	cd docsrc && doxygen Doxyfile && cd ../

localhtml: clone_local_cfdk_repo change_links 
	@make html

latexpdf:
	$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) $(SOURCEDIR) $(PDFBUILDDIR)/latex
	@echo "Running LaTeX files through pdflatex..."
	make -C $(PDFBUILDDIR)/latex all-pdf"$(SOURCEDIR)"
	cp $(PDFBUILDDIR)/latex/*.pdf $(PDF)
	@echo "pdflatex finished; see $(PDF)"

dhtml: change_links 
	@make html

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
