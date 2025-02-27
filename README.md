# `jtry`

Create temporary environment, install dependencies, and open Jupyter notebook in VS Code.

## Usage

```shell
./jtry.sh <dependencies>
```

For example, to create a temporary environment with `matplotlib` and `scipy`:

```shell
./jtry.sh matplotlib scipy
```

Or, using `curl`:

```shell
curl https://raw.githubusercontent.com/fepegar/jtry/main/jtry.sh | bash -s -- matplotlib scipy
```
