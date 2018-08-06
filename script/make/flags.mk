export VIEWER      := SumatraPDF
export ROOT_TEX    := $(TARGET).tex
export OUT_PDF     := $(OUT_PATH)/$(TARGET).pdf
export FINAL_PDF   := $(ROOT_PATH)/$(TARGET)-$(shell date +'%y-%m-%d').pdf

export ENGINE      := -xelatex
export LATEXMK     := latexmk

# use relevant path
export COMMON_FLAG := $(ENGINE) \
                      -outdir=$(call relpath,$(OUT_PATH)) \
			          -shell-escape
export DRAFT_FLAG  := $(COMMON_FLAG)
export FINAL_FLAG  := $(COMMON_FLAG) -silent
export TIKZ_FLAG   := -pdf -dvi- -silent

export MAKEFLAGS    := -I $(MAKE_SCRIPT_PATH) \
                       MAKEFILES=common.mk \
                       -s --no-print-directory
