# SPDX-License-Identifier: MIT

# Tests

using LinearWaves
using Test

@testset "LinearWaves.jl" begin
    ϵ = LinearWaves.tol
    g = LinearWaves.g
    ρ = LinearWaves.ρ
    ## regular wave tests
    a, k, d = 2, 1, 1
    ω = sqrt(g * k * tanh(k * d))
    ### progressive wave
    η(x, t) = wave_profile(x, t, a, k, ω)
    @test η(0, 0) == a
    @test η(0, π / ω) == -a
    @test η(π / 2, π / 2ω) == a
    u(x, z, t) = horizontal_velocity(x, z, t, a, k, ω, d)
    @test abs(u(π / 2, 0, 0)) < ϵ
    @test abs(u(0, 0, π / 2ω)) < ϵ
    w(x, z, t) = vertical_velocity(x, z, t, a, k, ω, d)
    @test abs(w(0, 0, 0)) < ϵ
    @test abs(w(0, 0, π / ω)) < ϵ
    @test abs(w(π / 2, -1, 0)) < ϵ
    ξ(x, z, t) = horizontal_displacement(x, z, t, a, k, ω, d)
    ζ(x, z, t) = vertical_displacement(x, z, t, a, k, ω, d)
    @test ξ(0, 0, 0)^2 + ζ(0, 0, 0)^2 == a^2
    p(x, z, t) = pressure(x, z, t, a, k, ω, d)
    @test abs(p(π / 2, -d, 0) - p(3π / 2, -d, 0)) < ϵ * g * ρ
    ### standing wave
    η_s(x, t) = wave_profile_s(x, t, a, k, ω)
    @test η_s(0, 0) == a
    @test η_s(0, π / ω) == -a
    @test η_s(0, 2π / ω) == a
    u_s(x, z, t) = horizontal_velocity_s(x, z, t, a, k, ω, d)
    @test abs(u_s(0, 0, 0)) < ϵ
    @test abs(u_s(0, 0, π / ω)) < ϵ
    w_s(x, z, t) = vertical_velocity_s(x, z, t, a, k, ω, d)
    @test abs(w_s(π / 2, 0, 0)) < ϵ
    @test abs(w_s(0, 0, π / ω)) < ϵ
    @test abs(w_s(0, -1, 0)) < ϵ
    ξ_s(x, z, t) = horizontal_displacement_s(x, z, t, a, k, ω, d)
    ζ_s(x, z, t) = vertical_displacement_s(x, z, t, a, k, ω, d)
    @test ξ_s(0, 0, 0)^2 + ζ_s(0, 0, 0)^2 == a^2
    p_s(x, z, t) = pressure_s(x, z, t, a, k, ω, d)
    @test abs(p_s(π / 2, -d, 1) - p_s(3π / 2, -d, 1)) < ϵ * g * ρ
    ## wave processes
    ω, d = 2π, 1
    k = dispersion_relation(d, ω)
    ### dispersion
    @test abs(ω - sqrt(g * k * tanh(k * d))) < ϵ
    #### deep water
    d = 10^15
    k = dispersion_relation(d, ω)
    c = phase_velocity(k, ω)
    @test c == g / ω
    #### shallow water
    d = 0.00000000001
    k = dispersion_relation(d, ω)
    c = phase_velocity(k, ω)
    @test abs(c - sqrt(g * d)) < ϵ
end
