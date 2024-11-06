# SPDX-License-Identifier: MIT

# wave processes

# dispersion

"""
    dispertion_relation(d, ω; g=LinearWaves.g, ϵ=LinearWaves.tol)

Calculate wavenumber `k` based on depth `d`, angular wave frequency `ω`
and gravitational acceleration `g` for given accuracy `ϵ` according to linear wave theory."
"""
function dispersion_relation(d, ω, g=LinearWaves.g, ϵ=LinearWaves.tol)
    k = k₀ = ω^2 / g # initial guess
    while max(abs(k * tanh(k * d) - k₀)) > ϵ
        k = k₀ / tanh(k * d)
    end
    return k
end
