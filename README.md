# yunglenin_meshlabels_example

My implementation of 'mesh labels' in Transport Fever 2.

## Installation

Copy the ```res/``` folder into the main directory of your mod, so that it's merged into your own ```res/``` folder.

## Usage

Require the following:

```lua
local yl_numberutil = require "yl_numberutil"
local yl_meshlabelutil = require "yl_meshlabelutil"
```

Generate either a random or semi-random number, as a string. use ```x``` to denote where a number should be randomised.

```lua
local number = yl_numberutil.generate("1502xx") -- Will return e.g. "150238" or "150292"
```

Specify the transformation matrix to place the meshlabel relative to the root node's tranf

```lua
transf = {0.065, 0, 0, 0, 0, 0.065, 0, 0, 0, 0, 0.065, 0, 9.86, 0.47, 1.94, 1, }
```

Create the meshlabel set, providing the colour, number and transf. `BLACK` or `WHITE` are the only colours currently supported.

```lua
meshlabel = yl_meshlabelutil.createMeshlabel("BLACK", number, transf)
```

Insert the meshlabel(s) you have created into the mesh list of your ```.mdl```.

```lua
...
lods = {
    {
        node = {
            children = {
                meshlabel,
                {
                    ...
                },
            },
        },
        name = "RootNode",
        transf = { 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, },
    },
    static = false,
    visibleFrom = 0,
    visibleTo = 2500,
},
...
```

### Custom Materials (fonts)

If you want to use a custom material (font) for meshlabels:

```lua
yl_meshlabelutil.setMaterial("path/to/your/material.mtl")
```

**NOTE: to avoid propogating custom materials to other mods, you need to reset the material to the default value when you are done:**

```lua
yl_meshlabelutil.resetMaterial()
```

## Testing

```bash
lua test/test.lua
```

Use ```-v || --verbose``` for more verbose test logs.

## Issues

Once an ```.mdl``` is loaded, the random meshlabel actually becomes static. This means all instances of the same `.mdl` will have the same random number. However, separate ```.mdl```s with the same implementation will have a different random number applied to all its instances.
