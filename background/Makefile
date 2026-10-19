INITIAL_MEMORY_PAGES=2000
MAX_MEMORY_PAGES=65536

INITIAL_MEMORY_BYTES=$(shell expr $(INITIAL_MEMORY_PAGES) \* $(MAX_MEMORY_PAGES))
MAX_MEMORY_BYTES=$(shell expr $(MAX_MEMORY_PAGES) \* $(MAX_MEMORY_PAGES))

LDFLAGS="--export-table --import-memory --initial-memory=$(INITIAL_MEMORY_BYTES) --max-memory=$(MAX_MEMORY_BYTES)"

bin/background.wasm: src/background.odin
	odin build $< -file -target:js_wasm32 -out:$@ -o:size -extra-linker-flags:$(LDFLAGS)

clean:
	rm -f bin/background.wasm
