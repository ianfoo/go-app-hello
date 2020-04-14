WASM_APP := app.wasm
BINDIR := bin
SERVER_BIN := $(BINDIR)/server
PORT := "7777"

all: webapp server

webapp:
	GO111MODULE=on GOOS=wasm GOARCH=js go build -o $(WASM_APP) ./webapp

server:
	GO111MODULE=on go build -o $(SERVER_BIN) ./cmd/server

run: server
	PORT=$(PORT) $(SERVE_BIN)

clean:
	rm -rf $(BINDIR) $(WASM_APP)

.PHONY: run
