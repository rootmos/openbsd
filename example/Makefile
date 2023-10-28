ROOT := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
SCRIPTS ?= $(ROOT)/../scripts

INTERCALATE ?= $(SCRIPTS)/intercalate

.PHONY: spec
spec: openbsd.toml

openbsd.toml: $(wildcard parts/*.toml) | $(INTERCALATE)
	$(INTERCALATE) $@ $^
