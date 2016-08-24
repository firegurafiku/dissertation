# Simple Makefile for building my dissertation with accompanying
# documents.
# Copyright (c) Pavel Kretov, 2016.
# Provided under the terms of MIT license.
#
# How to use: for each top-level <FILE>.tex file create the following
# pseudo-targets:
#
#     <FILE>_sources_tex
#     <FILE>_sources_bib
#
# and set them to depend on all source files which need tracking,
# then add '$(OUTDIR)/<FILE>.pdf' as the dependency to 'all' target.
# After that, just give use the make command to build.

OUTDIR := build

all: \
    $(OUTDIR)/dissertation.pdf \
    $(OUTDIR)/my-publications.pdf

dissertation_sources_tex: \
    text/introduction.tex \
    text/chapter1.tex \
    text/chapter2.tex \
    text/chapter3.tex \
    text/conclusion.tex \
    dissertation.tex

dissertation_sources_bib: \
    bibliography/my-publications.bib

my-publications_sources_tex: \
    my-publications.tex

my-publications_sources_bib: \
    bibliography/my-publications.bib

# ---

.PHONY: all %_sources_tex %_sources_bib

$(OUTDIR)/%.bcf:
	mkdir -p $(OUTDIR)/text
	xelatex -output-directory=$(OUTDIR) $*.tex

$(OUTDIR)/%.bbl: $(OUTDIR)/%.bcf
	biber $(OUTDIR)/$*.bcf

$(OUTDIR)/%.pdf: %_sources_tex $(OUTDIR)/%.bbl
	xelatex -output-directory=$(OUTDIR) $*.tex
	xelatex -output-directory=$(OUTDIR) $*.tex
