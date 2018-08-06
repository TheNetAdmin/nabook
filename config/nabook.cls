\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nabook}

\LoadClass[
    10pt,
    twoside,
    openright,
    onecolumn,
    draft,
    % showtrims,
]{memoir}

\RequirePackage{kvoptions}

\SetupKeyvalOptions{
    family=nabook,
    prefix=
}

\DeclareStringOption{booktitle}
\DeclareStringOption{bookengtitle}
\DeclareStringOption{bookauthor}
\DeclareStringOption{bookcoverdesign}
\DeclareStringOption{bookyear}
\DeclareStringOption{bookartno}
\DeclareStringOption{bookisbn}
\DeclareStringOption{bookedition}
\DeclareStringOption{bookpublished}
\DeclareStringOption{bookprinted}

\ProcessKeyvalOptions*

% Chinese support
\RequirePackage[
    UTF8,
    fontset = none
]{ctex}

% Colors
\RequirePackage{xcolor}
\input{config/format/color}

% Page layout
\RequirePackage{etoolbox}
\input{config/format/layout}

% Fonts
\RequirePackage{fontspec}
\RequirePackage{lmodern}
\input{config/format/font}

% Some fancy boxes
\RequirePackage[many]{tcolorbox}
\RequirePackage{fontawesome}
\input{config/components/boxes}

% Code
\RequirePackage{listings}
\RequirePackage{verbatim}
\RequirePackage{caption}
\input{config/format/code}

% Bib ref and cross ref
\RequirePackage[
    style=verbose,
    bibstyle=numeric,
    sorting=none
]{biblatex}
\RequirePackage{hyperref}
\input{config/format/reference}

% Paragraph
\input{config/format/paragraph}

% Figures
\RequirePackage{graphicx}
\input{config/format/figure}

% Headings
\RequirePackage{epigraph}
\RequirePackage{environ}
\input{config/format/heading}

% ToC, LoF, LoT
\RequirePackage{cuted}
\input{config/format/list}

% Enum and itemize
\RequirePackage[shortlabels]{enumitem}
\input{config/format/item}

\RequirePackage{zhlipsum}
