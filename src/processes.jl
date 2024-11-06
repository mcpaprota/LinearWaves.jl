# SPDX-License-Identifier: MIT

# wave processes

using NonlinearSolve

# dispersion

"""
    dispertion_relation(d, ω; g=LinearWaves.g, ϵ=LinearWaves.tol)

Calculate a wave number `k` based on depth `d`, an angular wave frequency `ω`
and gravitational acceleration `g` for a given accuracy `ϵ`
according to linear wave theory."
"""
function dispersion_relation(d, ω; g=LinearWaves.g, ϵ=LinearWaves.tol)
    k₀ = ω^2 / g # initial guess
    p = [ω, d]
    f(k, p) = p[1]^2 / g - k * tanh(k * p[2])
    prob = NonlinearProblem(f, k₀, p)
    sol = solve(prob, reltol=ϵ)
    k = sol.u
    return k
end

"""
    phase_velocity(k, ω)

Calculate phase velocity (celerity) `c` for a regular wave of a number `k`
and an angular frequency `ω`.
"""
function phase_velocity(k, ω)
    c = ω / k
    return c
end

"""
    group_velocity(k, ω, d)

Calculate group velocity (celerity) `c_g` for a regular wave of a number `k`
and an angular frequency `ω` at depth `d`.
"""
function group_velocity(k, ω, d)
    c = phase_velocity(k, ω)
    n = (1 + 2k * d / sinh(2k * d)) / 2
    c_g = n * c
    return c_g
end
