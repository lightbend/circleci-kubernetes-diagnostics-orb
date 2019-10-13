
src = src
target = target
orb = $(target)/orb.yml

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

.PHONY: clean
clean:
	-rm -f $(orb)

.DELETE_ON_ERROR:
