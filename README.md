# Factorio Heat Dissipation, Boltzmann Edition!

## Rationale and Summary
In Factorio, heat pipes are lossless. If you have a heat pipe at 1000 C, it will stay like that forever, even on Aquilo.
And heat consumption does not scale with temperature, so an Aquilo base at 1000 C will consume
the same amount of fuel as one that is regulated to much lower temperatures. This has always bothered
me as an astronomer, where we're taught that heat loss increases with the temperature to the FOURTH POWER
which is a fairly large exponent in physics contexts! You even see the heat pipes glowing in game, so it's not
like they're just extremely well-insulated.

I usually tailor my playstyle to try to keep the temperature as low as possible, but I have wanted for a long time
to have a game mechanic that encourages that. After reading the code for the Heat Dissipation mod,
I got an idea for how to implement it!

## Implementation
`data.lua` adds 10 prototypes (invisible fake assembling machines) that differ only in their `heating_energy` value.
The 10 prototypes each correspond to approximately 100 degrees C, and their heating energy amounts are scaled to approximate
the Stefan Boltzmann law (energy radiated = T^4). 

`control.lua` implements a timer that checks all the heat pipes in the game every minute or so, and swaps the correct
prototype into each heat pipe. I was afraid that this approach would be noticeable in terms of causing lag, but 
at least in my modest Aquilo base the function runs in 0.16 ms, which is completely unnoticeable. 
