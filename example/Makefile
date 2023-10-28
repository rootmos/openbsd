ROOT := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
SCRIPTS ?= $(ROOT)/../scripts

INTERCALATE ?= $(SCRIPTS)/intercalate
INCLUDE ?= $(SCRIPTS)/include

.PHONY: all
all: openbsd.toml README.md

openbsd.toml: $(wildcard parts/*.toml) | $(INTERCALATE)
	$(INTERCALATE) $@ $^

README.md: README.in.md $(wildcard parts/*.toml) | $(INCLUDE)
	$(INCLUDE) $< $@
