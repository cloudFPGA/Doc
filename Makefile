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
	rm -rf ./doxyoutput/ ./docsrc/cFDK_api/ ./repos_for_Doc/cFDK ./repos_for_Doc/Dox ./repos_for_Doc/cFp_Vitis ./repos_for_Doc/cFp_Monolithic ./repos_for_Doc/cFp_EchoThemisto ./repos_for_Doc/cFp_Uppercase ./repos_for_Doc/cFp_Triangle
	@$(SPHINXBUILD) -M clean "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

clone_local_repos:
	git -C 'repos_for_Doc/Doc' pull              || git clone --depth=1 -b master --single-branch git@github.com:cloudFPGA/Doc.git                    repos_for_Doc/Doc
	git -C 'repos_for_Doc/cFDK' pull             || git clone --depth=1 git@github.ibm.com:cloudFPGA/cFDK.git               repos_for_Doc/cFDK
	git -C 'repos_for_Doc/Dox' pull              || git clone --depth=1 git@github.com:cloudFPGA/Dox.git                    repos_for_Doc/Dox
	git -C 'repos_for_Doc/cFp_HelloKale' pull    || git clone --depth=1 git@github.com:cloudFPGA/cFp_HelloKale.git          repos_for_Doc/cFp_HelloKale
	git -C 'repos_for_Doc/cFp_Zoo' pull          || git clone --depth=1 git@github.com:cloudFPGA/cFp_Zoo.git                repos_for_Doc/cFp_Zoo
	git -C 'repos_for_Doc/cFp_Uppercase' pull    || git clone --depth=1 git@github.ibm.com:cloudFPGA/cFp_Uppercase.git      repos_for_Doc/cFp_Uppercase
	git -C 'repos_for_Doc/cFp_Triangle' pull     || git clone --depth=1 git@github.ibm.com:cloudFPGA/cFp_Triangle.git       repos_for_Doc/cFp_Triangle

change_links:
	cd repos_for_Doc && python3 modify_links_cf.py ./ && cd ../

doxygen:
	cd docsrc && doxygen Doxyfile && cd ../

localhtml: clone_local_repos change_links 
	@make html

latexpdf:
	$(SPHINXBUILD) -b latex $(ALLSPHINXOPTS) $(SOURCEDIR) $(PDFBUILDDIR)/latex
	@echo "Running LaTeX files through pdflatex..."
	make -C $(PDFBUILDDIR)/latex all-pdf"$(SOURCEDIR)"
	cp $(PDFBUILDDIR)/latex/*.pdf $(PDF)
	@echo "pdflatex finished; see $(PDF)"

dhtml:  change_links
	@make html

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
