
src = src
target = target
orb = $(target)/orb.yml
namespace = lightbend

.PHONY: build
build: lint validate

.PHONY: lint
lint:
	yamllint --strict $(src)

$(orb): $(shell find $(src))
	mkdir -p $(target)
	circleci config pack $(src) > $@

.PHONY: pack
pack: $(orb)

.PHONY: validate
validate: $(orb)
	circleci orb validate $(orb)

.PHONY: publish
publish: $(orb)
	@read -p "version = " version; \
	circleci orb publish $(orb) $(namespace)/kubernetes-diagnostics@$$version

.PHONY: promote
publish:
	@read -p "version = " version; \
	@read -p "segment (major|minor|patch) = " segment; \
	circleci orb publish promote $(namespace)/kubernetes-diagnostics@$$version $$segment

.PHONY: clean
clean:
	-rm -f $(orb)

.DELETE_ON_ERROR:
