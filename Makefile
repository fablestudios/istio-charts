.PHONY: all clean fetch package

all: package

fetch:
	./scripts/fetch.sh

package: fetch
	./scripts/package.sh

clean:
	rm -fr charts packages
