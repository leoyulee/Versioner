# Versioner
A utility module that has helper functions for [Version](https://github.com/leoyulee/Version). At the moment, it only has one function that is used to compare Versions, regardless of being a string or Version object.

This module is bound to change over time as different scenarios are brought up.

# Installation/Setup
For now, only Wally is supported. If there's demand, other methods will be added!
## With Wally
Put the following under `[dependacies]` in your `wally.toml` file:
```
Versioner = "leoyulee/versioner@0.0.3"
```
Then run `wally install`.

# 0.0.3 Notes
- Fixed an incorrect reference preventing this package from functioning in wally workspaces.

# Development & Contributing

## Workspace Dependacies
[Aftman](https://github.com/LPGhatguy/aftman#installation) tools:
- [Wally](https://github.com/UpliftGames/wally/#installation)
- [Rojo 7.2.0](https://github.com/rojo-rbx/rojo)

Other tools:
- [Moonwave 0.3.7](https://github.com/evaera/moonwave)

## Development Workspace Setup
1. Install wally dependacies.
2. Build rojo project with `dev.project.json`.

## Rojo Place Building
To build the place from scratch, use:

```bash
rojo build -o "Versioner.rbxlx"
```

Next, open `Versioner.rbxlx` in Roblox Studio and start the Rojo server:

```bash
rojo serve
```

For more help, check out [the Rojo documentation](https://rojo.space/docs).