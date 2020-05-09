# yunglenin_meshlabels_example
My implementation of 'mesh labels' in Transport Fever 2.

## Usage
Require the following:
```lua
local yl_numberutil = require "yl_numberutil"
local yl_meshlabelutil = require "yl_meshlabelutil"
```

Generate either a random or semi-random number. use ```x``` to denote where a number should be randomised.
```lua
local number = yl_numberutil.generate("1502xx")
```

Specify the transformation matrix to place the meshlabel relative to the root node's tranf
```lua
transf = {0.065, 0, 0, 0, 0, 0.065, 0, 0, 0, 0, 0.065, 0, 9.86, 0.47, 1.94, 1, }
```

Create the meshlabel set, providing the colour, number and transf
```lua
meshlabel = yl_meshlabelutil.createMeshlabel("BLACK", number, transf)
```

## Issues
Once an ```.mdl``` is loaded, the random meshlabel actually becomes static. This means all instances of the same `.mdl` will have the same random number. However, separate ```.mdl```s with the same implementation will have a different random number applied to all its instances. 
