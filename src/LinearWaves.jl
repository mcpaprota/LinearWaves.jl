# SPDX-License-Identifier: MIT

# Main module

"""
LinearWaves is an implementation of a linear water wave theory.
"""
module LinearWaves

## regular progressive waves
export wave_profile, horizontal_velocity, vertical_velocity
export horizontal_displacement, vertical_displacement

## regular standing waves
export wave_profile_s, horizontal_velocity_s, vertical_velocity_s
export horizontal_displacement_s, vertical_displacement_s

include("constants.jl")
include("regularwaves.jl")

end
