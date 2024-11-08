# SPDX-License-Identifier: MIT

# wave processes

## dispersion

"""
    wave_number(d::Real, ω::Real; g::Real=LinearWaves.g, ϵ::Real=LinearWaves.tol)

Calculate a wave number `k` based on depth `d`, an angular wave frequency `ω`
and gravitational acceleration `g` for a given accuracy `ϵ`
according to linear disperion relation."
"""
function wave_number(d::Real, ω::Real; g::Real=LinearWaves.g, ϵ::Real=LinearWaves.tol)
    k₀ = ω^2 / g # initial guess
    p = [ω, d]
    f(k, p) = p[1]^2 / g - k * tanh(k * p[2])
    prob = NonlinearProblem(f, k₀, p)
    sol = solve(prob, reltol=ϵ)
    k = sol.u
    return k
end

"""
    wave_number(L::Real)

Calculate wave number `k` for a regular wave of length `L`.
"""
function wave_number(L::Real)
    k = 2π / L
    return k
end

"""
    wavelength(k::Real)

Calculate wavelength `L` for a wave number `k` of a regular wave.
"""
function wavelength(k::Real)
    L = 2π / k
end

"""
    wave_frequency(d::Real, k::Real; g::Real=LinearWaves.g)

Calculate angular wave frequency `ω` based on water depth `d`
and gravitational acceleration `g` for a regular wave of a number `k`.
"""
function wave_frequency(d::Real, k::Real; g::Real=LinearWaves.g)
    ω = sqrt(g * k * tanh(k * d))
    return ω
end

"""
    wave_frequency(T::Real)

Calculate wave angular frequency `ω` for a period `T` of a regular wave.
"""
function wave_frequency(T::Real)
    ω = 2π / T
end

"""
    wave_period(ω::Real)

Calculate a wave period `T` for angular frequency `ω` of a regular wave.
"""
function wave_period(ω::Real)
    T = 2π / ω
end

"""
    phase_velocity(k::Real, ω::Real)

Calculate phase velocity (celerity) `c` for a regular wave of a number `k`
and an angular frequency `ω`.
"""
function phase_velocity(k::Real, ω::Real)
    c = ω / k
    return c
end

"""
    group_velocity(k::Real, ω::Real, d::Real)

Calculate group velocity (celerity) `c_g` for a regular wave of a number `k`
and an angular frequency `ω` at depth `d`.
"""
function group_velocity(k::Real, ω::Real, d::Real)
    c = phase_velocity(k, ω)
    n = (1 + 2k * d / sinh(2k * d)) / 2
    c_g = n * c
    return c_g
end
