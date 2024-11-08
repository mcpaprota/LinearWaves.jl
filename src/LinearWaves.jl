# SPDX-License-Identifier: MIT

# Main module

"""
LinearWaves is an implementation of a linear water wave theory.
"""
module LinearWaves

using NonlinearSolve

## regular progressive waves
export wave_profile, horizontal_velocity, vertical_velocity
export horizontal_displacement, vertical_displacement, pressure

## regular standing waves
export wave_profile_s, horizontal_velocity_s, vertical_velocity_s
export horizontal_displacement_s, vertical_displacement_s, pressure_s

## wave processes
export wave_number, wave_length, wave_frequency, wave_period
export phase_velocity, group_velocity

include("constants.jl")
include("regularwaves.jl")
include("parameters.jl")

end
