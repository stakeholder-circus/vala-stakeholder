VALAC ?= valac
BIN := bin/stakeholder
SRC := src/stakeholder.vala

.PHONY: all compiler-proof analyze build test
all: build

compiler-proof:
	$(VALAC) --version

analyze:
	$(VALAC) --fatal-warnings --pkg glib-2.0 -o /tmp/vala-stakeholder-analyze $(SRC)

build:
	mkdir -p bin
	$(VALAC) --fatal-warnings --pkg glib-2.0 -o $(BIN) $(SRC)

test: build
	BIN=$(BIN) tests/test_cli.sh
