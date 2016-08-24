My dissertation at Voronezh State University (in Russian)
=========================================================

(In early development.)


Prerequisites
-------------

### LaTeX packages

This document is written in XeTeX with LaTeX and employs a number of
third-party packages. To compile the PDF, you will need a comprehensive
distribution like TeX Live. I used TeX Live 2015 from Fedora 24, with
a number of packages additionally installed:

       $ sudo dnf install               \
                 texlive-xetex          \
                 texlive-xetex-bin      \
                 texlive-xetex-def      \
                 texlive-biblatex       \
                 texlive-biblatex-gost  \
                 texlive-babel-russian  \
                 texlive-hyphen-russian \
                 biber

You may need to additionally run `fmtutil --all` after
installing `texlive-hyphen-russian` in order to get Russian hyphenation
actually work.

### Common command line tools

* GNU Make
* ImageMagick's `convert`
