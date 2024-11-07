# Package Guide

LinearWaves is a growing package for calculating parameters of linear water waves. In this guide, we present how to install and use the package. 

## Installation

```julia
pkg> add pkg> add https://github.com/mcpaprota/LinearWaves.jl
julia> using LinearWaves
```

## Quick start

### Spatial wave profile 

In the first step, we prepare a spatial profile view of a regular wave along with displayed definitions of basic parameters:
-  $L$ -- wavelength (m),
-  $a$ -- wave amplitude (m),
-  $H$ -- wave height (m),
-  $d$ -- water depth (m).
We use [`CairoMakie.jl`](https://github.com/MakieOrg/Makie.jl) for graphical output.

```@example 1
using LinearWaves
using CairoMakie # use the plotting package

L = 2.0 # wavelength (m)
a = 0.2 # wave amplitude (m)
H = 2a # wave height (m)
d = 1.0 # water depth (m)
nothing # hide
```
We also need a wave number $k$, angular frequency $\omega$ and gravitational acceleration $g$ (`LinearWaves.g`).

```@example 1
g = LinearWaves.g # gravitational acceleration (m/s²)
k = 2π / L # wave number (rad/s)
ω = sqrt(g * k * tanh(k * d)) # angular wave frequency (rad/s)
nothing # hide
```

We define a free-surface elevation function $\eta(x, t)$ using [`wave_profile`](@ref) for specified wave parameters $a$, $k$, and $\omega$.

```@example 1
η(x, t) = wave_profile(x, t, a, k, ω)
```

For $N+1$ points in space, we define a vector $\boldsymbol{x}$ as a range of values covering two wavelengths and set the time $t = 0$.

```@example 1
N = 100 # number of points per wavelength
x = range(0, 2L, N + 1) # vector of space positions (m)
t = 0 # time (s)
nothing # hide
```

Now, we are ready to plot the results and arrange the whole figure.

```@example 1
set_theme!(theme_latexfonts()) # set theme to latex
fig = Figure(size = (600, 300)) # create figure
ax = Axis(fig[1, 1], aspect = AxisAspect(2)) # create axis
band!(ax, x, η.(x, t), -d;
    color=:lightblue,
    ) # plot water bulk
lines!(ax, x, η.(x, t);
    linewidth=0.5,
    color=:slategray,
    ) # plot water surface
band!(ax, x, -1.1d, -d;
    color=:wheat,
    ) # plot sand bulk
lines!(ax, x, 0*x .- d;
    linewidth=0.5,
    color=:wheat4,
    ) # plot bottom line
lines!(ax, x, 0*x;
    linewidth=0.7,
    linestyle=:dash,
    color=:black,
    ) # still water level line
lines!(ax, [5L / 11, L], [a, a];
    linewidth=0.7,
    color=:black,
    ) # auxiliary line for wave height dimension line
lines!(ax, [5L / 11, 6L / 11], [-a, -a];
    linewidth=0.7,
    color=:black,
    ) # auxiliary line for wave height dimension line
lines!(ax, [5L / 11, 8L / 11], [-a, -a];
    linewidth=0.7,
    color=:black,
    ) # auxiliary line for wave amplitude dimension line
lines!(ax, [L, L], [a, 1.2H];
    linewidth=0.7,
    color=:black,
    ) # auxiliary line for wavelength dimension line
lines!(ax, [2L, 2L], [a, 1.2H];
    linewidth=0.7,
    color=:black,
    ) # auxiliary line for wavelength dimension line
lines!(ax, [L, 2L], [H, H];
    linewidth=0.7,
    color=:black,
    ) # dimension line for wavelength
lines!(ax, [L / 2, L / 2],[-a, a];
    linewidth=0.7,
    color=:black,
    ) # dimension line for wave height
lines!(ax, [2L / 3, 2L / 3],[-a, a];
    linewidth=0.7,
    color=:black,
    ) # dimension line for wave amplitude
lines!(ax, [13L / 7, 13L / 7], [-d, 0];
    linewidth=0.7,
    color=:black,
    )
arrow_head = BezierPath([
    MoveTo(Point(0, 0)),
    LineTo(Point(0.3, -1.2)),
    LineTo(Point(-0.3, -1.2)),
    ClosePath()
]) # define arrow head
scatter!(ax, [L, 2L, L / 2, L / 2, 2L / 3, 2L / 3, 2L / 3, 2L / 3, 13L / 7, 13L / 7],
    [H, H, -a, a, -a, 0, 0, a, -d, 0];
    color=:black,
    marker=arrow_head,
    rotation=[π / 2, - π / 2, -π, 0, -π, 0, -π, 0, -π, 0],
    ) # draw arrows
text!(ax, [(3L / 2, H), (L / 2 - 0.05L, 0), (13L / 7 - 0.05L, -d / 2),
    (2L / 3 - 0.05L, -a / 2), (2L / 3 - 0.05L, a / 2)];
    text=[L"$L$", L"$H$", L"$d$", L"$a$", L"$a$"],
    align=[(:center, :bottom), (:center, :bottom), (:center, :bottom),
    (:center, :center), (:center, :center)]
    )
hidedecorations!(ax)
hidespines!(ax)
fig # display figure
```
