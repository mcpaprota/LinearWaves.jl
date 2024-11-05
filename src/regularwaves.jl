# regular waves

"""
    wave_profile(x, t, a, k, ω)

Calculates free-surface elevation at position `x` and time `t` for regular wave
of amplitude `a`, wave number `k`, and angular wave frequency `ω`
"""
function wave_profile(x, t, a, k, ω)
    η = a * cos(k * x - ω * t)
    return η
end

#=
η₀(x,t) = a*cos(k*x - ω*t) # free-surface elevation
u₀(x,z,t) = a*ω*cosh(k*(z+d))/sinh(k*d)*cos(k*x - ω*t) # horizontal wave velocity component
w₀(x,z,t) = a*ω*sinh(k*(z+d))/sinh(k*d)*sin(k*x - ω*t) # vertical wave velocity component
ζ(x,z,t) = x - a*cosh(k*(z+d))/sinh(k*d)*sin(k*x - ω*t) # horizontal water particle displacement
ξ(x,z,t) = z + a*sinh(k*(z+d))/sinh(k*d)*cos(k*x - ω*t) # vertical water particle displacement
p(x,z,t) = z > 0 ? ρ*g*(η₀(x,t) - z) : -ρ*g*z + ρ*g*a*cosh(k*(z+d))/sinh(k*d)*cos(k*x - ω*t)
# second-order weakly-nonlinear correction - Stokes waves
η₁(x,t) = a^2*k/4*cosh(k*d)/sinh(k*d)^3*(2+cosh(2*k*d))*cos(2*(k*x-ω*t))
u₁(x,z,t) = 3*a^2*ω*k/4*cosh(2*k*(z+d))/sinh(k*d)^4*cos(2*(k*x-ω*t))
w₁(x,z,t) = 3*a^2*ω*k/4*sinh(2*k*(z+d))/sinh(k*d)^4*sin(2*(k*x-ω*t))
=#
