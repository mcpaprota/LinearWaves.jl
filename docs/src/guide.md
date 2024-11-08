# Package Guide

LinearWaves is a growing package for calculating parameters of linear water waves. In this guide, we present how to install and use the package. 

## Installation

```julia
pkg> add pkg> add https://github.com/mcpaprota/LinearWaves.jl
julia> using LinearWaves
```

## Quick start

### Spatial wave profile 

In the first step, we prepare a spatial profile view of a regular wave with following parameters defined:
-  $L$ -- wavelength (m),
-  $H$ -- wave height (m),
-  $d$ -- water depth (m).
We use [`CairoMakie.jl`](https://github.com/MakieOrg/Makie.jl) for graphical output.

```@example 1
using LinearWaves
using CairoMakie # use the plotting package

L = 2.0 # wavelength (m)
H = 0.1 # wave height (m)
d = 1.0 # water depth (m)
nothing # hide
```
We need a wave amplitude $a$, a wave number $k$, and angular frequency $\omega$.

```@example 1
a = H / 2 # wave amplitude
k = wave_number(L) # wave number (rad/s)
ω = wave_frequency(d, k) # angular wave frequency (rad/s)
nothing # hide
```

We may also calculate wave period $T$.

```@example 1
T = wave_period(ω) # angular wave frequency (rad/s)
nothing # hide
```

We define a free-surface elevation function $\eta(x, t)$ using [`wave_profile`](@ref) for specified wave parameters $a$, $k$, and $\omega$.

```@example 1
η(x, t) = wave_profile(x, t, a, k, ω)
```

For $N+1$ points in space, we define a vector $\boldsymbol{x}$ as a range of values covering one wavelength and set the time $t = 0$.

```@example 1
N = 100 # number of points per wavelength
x = range(0, L, N + 1) # vector of space positions (m)
t = 0 # time (s)
nothing # hide
```

Now, we are ready to plot the results.

```@example 1
set_theme!(theme_latexfonts()) # set theme to latex
fig = Figure(size = (300, 200), fontsize=9) # create figure
ax = Axis(fig[1, 1], aspect = AxisAspect(2),
            xlabel=L"$x$ (m)",
            ylabel=L"$\eta$ (m)",
            # display wave parameters in the title
            title=L"$T=%$(round(T, digits=1))$ s, $L=%$(L)$ m, $H=%$(H)$ m, $d=%$(d)$ m",
            limits=(0, L, -d, H);) # set upper limit to 110% of η_max
lines!(ax, x, η.(x, t)) # plot water surface
fig # display figure
```
