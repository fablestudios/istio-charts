.PHONY: all clean fetch index package upload

all: package

fetch:
	./scripts/fetch.sh

package: fetch
	./scripts/package.sh

upload: package
	cr upload -o fablestudios -r istio-charts -p packages --skip-existing

index: upload
	cr index -o fablestudios -r istio-charts -p packages -i index.yaml -c https://fablestudios.github.io/istio-charts

clean:
	rm -fr charts packages
