# Contributing

## Development

### Setup

[Install][install-circle-cli] and [setup][setup-circle-cli] the CircleCI CLI.

### Pack

The orb configuration uses a destructured layout which then gets [packed][packing-a-config] together into a single configuration.

To pack the configuration:

```bash
circleci config pack src > build/orb.yml
```

### Validate

Before you can validate the configuration make sure that you have [packed](#pack) the configuration.

```bash
circleci orb
```

## Releases

TODO

[install-circle-cli]: https://circleci.com/docs/2.0/orb-author-cli/#install-the-cli-for-the-first-time
[packing-a-config]: https://circleci.com/docs/2.0/creating-orbs/#packing-a-config
[setup-circle-cli]: https://circleci.com/docs/2.0/orb-author-cli/#configure-the-circleci-cli
