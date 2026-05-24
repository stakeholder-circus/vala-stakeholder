VALAC ?= valac
BIN := bin/stakeholder
SRC := src/stakeholder.vala

.PHONY: all compiler-proof build test clean

all: build

compiler-proof:
	$(VALAC) --version

build:
	mkdir -p bin
	$(VALAC) --pkg glib-2.0 -o $(BIN) $(SRC)

test: build
	BIN=$(BIN) tests/test_cli.sh

clean:
	rm -rf bin
