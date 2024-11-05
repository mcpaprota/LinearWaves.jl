# SPDX-License-Identifier: MIT

# regular waves

## progressive waves

"""
    wave_profile(x::Real, t::Real, a::Real, k::Real, ω::Real)

Calculate free-surface elevation `η` at position `x` and time `t` for
a regular wave of amplitude `a`, wave number `k`, and angular wave frequency `ω`.
"""
function wave_profile(x::Real, t::Real, a::Real, k::Real, ω::Real)
    η = a * cos(k * x - ω * t)
    return η
end

"""
    horizontal_velocity(x::Real, z::Real, t::Real, a::Real, k::Real, ω::Real, d:Real)

Calculate horizontal wave velocity `u` at position `x` and time `t` for
a regular wave of amplitude `a`, wave number `k`, and angular wave frequency `ω`,
propagating at constant depth `d`.
"""
function horizontal_velocity(x::Real, z::Real, t::Real, a::Real, k::Real, ω::Real, d::Real)
    u = a * ω * cosh(k * (z + d)) / sinh(k * d) * cos(k * x - ω * t)
    return u
end

"""
    vertical_velocity(x::Real, z::Real, t::Real, a::Real, k::Real, ω::Real, d:Real)

Calculate vertical wave velocity `v` at position (`x`, `z`) and time `t` for
a regular wave of amplitude `a`, wave number `k`, and angular wave frequency `ω`,
propagating at constant depth `d`.
"""
function vertical_velocity(x::Real, z::Real, t::Real, a::Real, k::Real, ω::Real, d::Real)
    w = a * ω * sinh(k * (z + d)) / sinh(k * d) * sin(k * x - ω * t)
    return w
end

"""
    horizontal_displacement(x::Real, z::Real, t::Real, a::Real, k::Real, ω::Real, d::Real)

Calculate horizontal particle displacement `ξ` at position (`x`, `z`) and time `t` for
a regular wave of amplitude `a`, wave number `k`, and angular wave frequency `ω`,
propagating at constant depth `d`.
"""
function horizontal_displacement(x::Real, z::Real, t::Real, a::Real, k::Real, ω::Real, d::Real)
    ξ = x - a * cosh(k * (z + d)) / sinh(k * d) * sin(k * x - ω * t)
    return ξ
end

"""
    vertical_displacement(x::Real, z::Real, t::Real, a::Real, k::Real, ω::Real, d::Real)

Calculate vertical particle displacement `ζ` at position (`x`, `z`) and time `t` for
a regular wave of amplitude `a`, wave number `k`, and angular wave frequency `ω`,
propagating at constant depth `d`.
"""
function vertical_displacement(x::Real, z::Real, t::Real, a::Real, k::Real, ω::Real, d::Real)
    ζ = z + a * sinh(k * (z + d)) / sinh(k * d) * cos(k * x - ω * t)
    return ζ
end

"""
    pressure(x::Real, z::Real, t::Real, a::Real, k::Real, ω::Real, d::Real)

Calculate pressure `p` at position (`x`, `z`) and time `t` under
a regular wave of amplitude `a`, wave number `k`, and angular wave frequency `ω`,
propagating at constant depth `d`.
"""
function pressure(x::Real, z::Real, t::Real, a::Real, k::Real, ω::Real, d::Real)
    η(x, t) = wave_profile(x, t, a, k, ω)
    K(z) = cosh(k * (z + d)) / cosh(k * d) # pressure response factor
    if z > 0
        p = ρ * g * (η(x, t) - z) # above still water level
    else
        p = ρ * g * (η(x, t) * K(z) - z) # below still water level
    end
    return p
end

## standing waves

"""
    wave_profile_s(x::Real, t::Real, a::Real, k::Real, ω::Real)

Calculate free-surface elevation `η` at position `x` and time `t` for
a regular standing wave of amplitude `a`, wave number `k`, and angular wave frequency `ω`.
"""
function wave_profile_s(x::Real, t::Real, a::Real, k::Real, ω::Real)
    η = a * cos(k * x) * cos(ω * t)
    return η
end

"""
    horizontal_velocity_s(x::Real, z::Real, t::Real, a::Real, k::Real, ω::Real, d:Real)

Calculate horizontal wave velocity `u` at position `x` and time `t` for
a regular standing wave of amplitude `a`, wave number `k`, and angular wave frequency `ω`,
propagating at constant depth `d`.
"""
function horizontal_velocity_s(x::Real, z::Real, t::Real, a::Real, k::Real, ω::Real, d::Real)
    u = a * ω * cosh(k * (z + d)) / sinh(k * d) * sin(k * x) * sin(ω * t)
    return u
end

"""
    vertical_velocity_s(x::Real, z::Real, t::Real, a::Real, k::Real, ω::Real, d:Real)

Calculate vertical wave velocity `v` at position (`x`, `z`) and time `t` for
a regular standing wave of amplitude `a`, wave number `k`, and angular wave frequency `ω`,
propagating at constant depth `d`.
"""
function vertical_velocity_s(x::Real, z::Real, t::Real, a::Real, k::Real, ω::Real, d::Real)
    w = -a * ω * sinh(k * (z + d)) / sinh(k * d) * cos(k * x) * sin(ω * t)
    return w
end

"""
    horizontal_displacement_s(x::Real, z::Real, t::Real, a::Real, k::Real, ω::Real, d::Real)

Calculate horizontal particle displacement `ξ` at position (`x`, `z`) and time `t` for
a regular standing wave of amplitude `a`, wave number `k`, and angular wave frequency `ω`,
propagating at constant depth `d`.
"""
function horizontal_displacement_s(x::Real, z::Real, t::Real, a::Real, k::Real, ω::Real, d::Real)
    ξ = x - a * cosh(k * (z + d)) / sinh(k * d) * sin(k * x) * cos(ω * t)
    return ξ
end

"""
    vertical_displacement_s(x::Real, z::Real, t::Real, a::Real, k::Real, ω::Real, d::Real)

Calculate vertical particle displacement `ζ` at position (`x`, `z`) and time `t` for
a regular standing wave of amplitude `a`, wave number `k`, and angular wave frequency `ω`,
propagating at constant depth `d`.
"""
function vertical_displacement_s(x::Real, z::Real, t::Real, a::Real, k::Real, ω::Real, d::Real)
    ζ = z + a * sinh(k * (z + d)) / sinh(k * d) * cos(k * x) * cos(ω * t)
    return ζ
end

"""
    pressure_s(x::Real, z::Real, t::Real, a::Real, k::Real, ω::Real, d::Real)

Calculate pressure `p` at position (`x`, `z`) and time `t` under
a regular standing wave of amplitude `a`, wave number `k`, and angular wave frequency `ω`,
propagating at constant depth `d`.
"""
function pressure_s(x::Real, z::Real, t::Real, a::Real, k::Real, ω::Real, d::Real)
    η(x, t) = wave_profile(x, t, a, k, ω)
    K(z) = cosh(k * (z + d)) / cosh(k * d) # pressure response factor
    if z > 0
        p = ρ * g * (η(x, t) - z) # above still water level
    else
        p = ρ * g * (η(x, t) * K(z) - z) # below still water level
    end
    return p
end
