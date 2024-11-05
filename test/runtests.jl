using LinearWaves
using Test

@testset "LinearWaves.jl" begin
    # Free surface tests
    a, k, ω = 1, 1, 1
    η(x, t) = wave_profile(x, t, a, k, ω)
    @test η(0, 0) == a
    @test η(0, π / 2) < LinearWaves.tol
end