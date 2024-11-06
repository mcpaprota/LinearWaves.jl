# SPDX-License-Identifier: MIT

# Tests

using LinearWaves
using Test

@testset "LinearWaves.jl" begin
    ϵ = LinearWaves.tol
    g = LinearWaves.g
    ρ = LinearWaves.ρ
    # Free surface tests
    a, k, ω, d = 2, 1, 1, 1
    # progressive wave
    η(x, t) = wave_profile(x, t, a, k, ω)
    @test η(0, 0) == a
    @test η(0, π) == -a
    @test η(π / 2, π / 2) == a
    u(x, z, t) = horizontal_velocity(x, z, t, a, k, ω, d)
    @test u(π / 2, 0, 0) < ϵ
    @test u(0, 0, π / 2) < ϵ
    w(x, z, t) = vertical_velocity(x, z, t, a, k, ω, d)
    @test w(0, 0, 0) < ϵ
    @test w(0, 0, π) < ϵ
    @test w(π / 2, -1, 0) < ϵ
    ξ(x, z, t) = horizontal_displacement(x, z, t, a, k, ω, d)
    ζ(x, z, t) = vertical_displacement(x, z, t, a, k, ω, d)
    @test ξ(0, 0, 0)^2 + ζ(0, 0, 0)^2 == a^2
    p(x, z, t) = pressure(x, z, t, a, k, ω, d)
    @test p(π / 2, -d, 0) - p(3π / 2, -d, 0) < ϵ * g * ρ
    # standing wave
    η(x, t) = wave_profile_s(x, t, a, k, ω)
    @test η(0, 0) == a
    @test η(0, π) == -a
    @test η(0, 2π) == a
    u(x, z, t) = horizontal_velocity_s(x, z, t, a, k, ω, d)
    @test u(0, 0, 0) < ϵ
    @test u(0, 0, π) < ϵ
    w(x, z, t) = vertical_velocity_s(x, z, t, a, k, ω, d)
    @test w(π / 2, 0, 0) < ϵ
    @test w(0, 0, π / 2) < ϵ
    @test w(0, -1, 0) < ϵ
    ξ(x, z, t) = horizontal_displacement_s(x, z, t, a, k, ω, d)
    ζ(x, z, t) = vertical_displacement_s(x, z, t, a, k, ω, d)
    @test ξ(0, 0, 0)^2 + ζ(0, 0, 0)^2 == a^2
    p(x, z, t) = pressure_s(x, z, t, a, k, ω, d)
    @test p(π / 2, -d, 1) - p(3π / 2, -d, 1) < ϵ * g * ρ
end
