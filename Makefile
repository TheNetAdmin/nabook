# paths
export ROOT_PATH        := $(CURDIR)
export OUT_PATH         := $(abspath $(ROOT_PATH)/out)
export SCRIPT_PATH      := $(abspath $(ROOT_PATH)/script)
export MAKE_SCRIPT_PATH := $(abspath $(SCRIPT_PATH)/make)

# targets
export TARGET     := book

# includes
include $(MAKE_SCRIPT_PATH)/utils.mk
include $(MAKE_SCRIPT_PATH)/flags.mk
include $(MAKE_SCRIPT_PATH)/common.mk

# objects and subdirs
dirs     := figure
objs     :=
contents := content page

# rules
.DEFAULT_GOAL := draft

.PHONY: draft
draft: build
	@echo -e "LATEXMK $(ROOT_TEX) \t $(OUT_PDF)"
	@$(LATEXMK) $(DRAFT_FLAG) $(ROOT_TEX)
	@$(VIEWER) $(OUT_PDF) &

.PHONY: final
final: clean build
	@echo -e "LATEXMK $(ROOT_TEX) \t $(FINAL_PDF)"
	@$(LATEXMK) $(FINAL_FLAG) $(ROOT_TEX)
	@cp $(OUT_PDF) $(FINAL_PDF)
	@$(VIEWER) $(FINAL_PDF) &
