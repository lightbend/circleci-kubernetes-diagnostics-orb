orb = target/orb.yml
src = src

.PHONY: build
build: lint validate

.PHONY: lint
lint:
	yamllint --strict $(src)

$(orb): $(shell find $(src))
	circleci config pack $(src) > $@

.PHONY: pack
pack: $(orb)

.PHONY: validate
validate: $(orb)
	circleci orb validate $(orb)

.PHONY: clean
clean:
	-rm -f $(orb)

.DELETE_ON_ERROR:
