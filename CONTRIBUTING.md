# Contributing

## Development

### Setup

1. [Install][install-circle-cli] and [setup][setup-circle-cli] the CircleCI CLI.
1. [Install][install-yamllint] yamllint.

### Build

To run the build:

```bash
make
```

### Linting

The Orb configuration is written in YAML and so first off you should lint the files:

```bash
make lint
```

### Pack

The Orb configuration uses a destructured layout which then gets [packed][packing-a-config] together
into a single configuration.

To pack the configuration:

```bash
make pack
```

### Validate

Before you can validate the configuration make sure that you have [packed](#pack) the configuration.

```bash
make validate
```

## CI

The CI build uses CircleCI and the [circleci/orb-tools orb][orb-tools-orb] to pack and validate this
Orb.

## Releases

TODO

[install-circle-cli]: https://circleci.com/docs/2.0/orb-author-cli/#install-the-cli-for-the-first-time
[install-yaml-lint]: https://yamllint.readthedocs.io/en/stable/quickstart.html#installing-yamllint
[orb-tools-orb]: https://circleci.com/orbs/registry/orb/circleci/orb-tools
[packing-a-config]: https://circleci.com/docs/2.0/creating-orbs/#packing-a-config
[setup-circle-cli]: https://circleci.com/docs/2.0/orb-author-cli/#configure-the-circleci-cli
