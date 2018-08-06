# dependencies
%.pdf: %.tikz
	@echo -e "LATEXMK $< \t $@"
	@$(LATEXMK) $(TIKZ_FLAG) $<

# recursive build
.PHONY: build build-current build-subdirs
build: build-current \
       build-subdirs

.SECONDEXPANSION:
ifeq (0,$(MAKELEVEL))
build-current:
	@for dir in $(contents); do \
		mkdir -p $(OUT_PATH)/$$dir; \
	done
else
build-current: $$(objs)
endif

.SECONDEXPANSION:
build-subdirs:
	@for dir in $(dirs); do \
		$(MAKE) -C $$dir build; \
	done

# recursive clean
.PHONY: clean clean-current clean-subdirs
clean: clean-subdirs clean-current

.SECONDEXPANSION:
clean-current:
ifeq (0,$(MAKELEVEL))
	@echo -e CLEAN "\t" $(call relpath,$(OUT_PATH))
	@rm -rf $(OUT_PATH)
else
	@if [[ 0 -ne $(words $(objs)) ]]; then \
		echo -e CLEAN "\t" $(objs); \
		$(LATEXMK) -c -f -silent $(objs); \
		rm -f $(objs); \
	fi;
endif

.SECONDEXPANSION:
clean-subdirs:
	@for dir in $(dirs); do \
		$(MAKE) -C $$dir clean; \
	done
