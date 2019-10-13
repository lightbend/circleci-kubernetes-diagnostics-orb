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
into a single configuration. To pack the configuration:

```bash
make pack
```

### Validate

You can validate the configuration for any errors:

```bash
make validate
```

### Process

You may want to resolve an Orb and it's dependencies to see how it would be expanded when you
publish it to the registry:

```bash
make proces
```

## CI

The CI build uses CircleCI and the [circleci/orb-tools orb][orb-tools-orb] to pack and validate this
Orb. See [orb-tools-orb on GitHub][orb-tools-orb-git] for more details on how this works.

## Release

### Automatic Release

The CI build will automatically publish, tag and promote the Orb depending on what has been changed.

Depending on what was tagged last time we may have to tag the number version ourselves. The build
will take what we have tagged and release it.

The tag format is:
  tag    = name "-" type "-" branch "-" 7*HEXDIGIT
  name   = ...
  type   = "major" | "minor" | "patch" | "skip"
  branch = ...

For example:

```bash
git tag master-minor-master-f0f6e12
git push origin
```

### Manual Release

You can publish the Orb manually:

```bash
make publish
version = dev:alpha
```

Then promote it:

```bash
make promote
version = dev:alpha
segment (major|minor|patch) = patch
```

[install-circle-cli]: https://circleci.com/docs/2.0/orb-author-cli/#install-the-cli-for-the-first-time
[install-yaml-lint]: https://yamllint.readthedocs.io/en/stable/quickstart.html#installing-yamllint
[orb-tools-orb]: https://circleci.com/orbs/registry/orb/circleci/orb-tools
[orb-tools-orb-git]: https://github.com/CircleCI-Public/orb-tools-orb
[packing-a-config]: https://circleci.com/docs/2.0/creating-orbs/#packing-a-config
[setup-circle-cli]: https://circleci.com/docs/2.0/orb-author-cli/#configure-the-circleci-cli
