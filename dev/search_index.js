var documenterSearchIndex = {"docs":
[{"location":"guide/#Package-Guide","page":"Guide","title":"Package Guide","text":"","category":"section"},{"location":"guide/","page":"Guide","title":"Guide","text":"LinearWaves is a growing package for calculating parameters of linear water waves. In this guide, we present how to install and use the package. ","category":"page"},{"location":"guide/#Installation","page":"Guide","title":"Installation","text":"","category":"section"},{"location":"guide/","page":"Guide","title":"Guide","text":"pkg> add pkg> add https://github.com/mcpaprota/LinearWaves.jl\njulia> using LinearWaves","category":"page"},{"location":"guide/#Quick-start","page":"Guide","title":"Quick start","text":"","category":"section"},{"location":"guide/#Spatial-wave-profile","page":"Guide","title":"Spatial wave profile","text":"","category":"section"},{"location":"guide/","page":"Guide","title":"Guide","text":"In the first step, we prepare a spatial profile view of a regular wave with following parameters defined:","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"L – wavelength (m),\nH – wave height (m),\nd – water depth (m).","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"We use CairoMakie.jl for graphical output.","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"using LinearWaves\nusing CairoMakie # use the plotting package\n\nL = 2.0 # wavelength (m)\nH = 0.1 # wave height (m)\nd = 1.0 # water depth (m)\nnothing # hide","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"We need a wave amplitude a, a wave number k, and angular frequency omega.","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"a = H / 2 # wave amplitude\nk = wave_number(L) # wave number (rad/s)\nω = wave_frequency(d, k) # angular wave frequency (rad/s)\nnothing # hide","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"We may also calculate wave period T.","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"T = wave_period(ω) # angular wave frequency (rad/s)\nnothing # hide","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"We define a free-surface elevation function eta(x t) using wave_profile for specified wave parameters a, k, and omega.","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"η(x, t) = wave_profile(x, t, a, k, ω)","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"For N+1 points in space, we define a vector boldsymbolx as a range of values covering one wavelength and set the time t = 0.","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"N = 100 # number of points per wavelength\nx = range(0, L, N + 1) # vector of space positions (m)\nt = 0 # time (s)\nnothing # hide","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"Now, we are ready to plot the results.","category":"page"},{"location":"guide/","page":"Guide","title":"Guide","text":"set_theme!(theme_latexfonts()) # set theme to latex\nfig = Figure(size = (300, 200), fontsize=9) # create figure\nax = Axis(fig[1, 1], aspect = AxisAspect(2),\n            xlabel=L\"$x$ (m)\",\n            ylabel=L\"$\\eta$ (m)\",\n            # display wave parameters in the title\n            title=L\"$T=%$(round(T, digits=1))$ s, $L=%$(L)$ m, $H=%$(H)$ m, $d=%$(d)$ m\",\n            limits=(0, L, -d, H);) # set upper limit to 110% of η_max\nlines!(ax, x, η.(x, t)) # plot water surface\nfig # display figure","category":"page"},{"location":"api/#API","page":"API Reference","title":"API","text":"","category":"section"},{"location":"api/","page":"API Reference","title":"API Reference","text":"CurrentModule = LinearWaves","category":"page"},{"location":"api/","page":"API Reference","title":"API Reference","text":"Pages = [\"api.md\"]","category":"page"},{"location":"api/","page":"API Reference","title":"API Reference","text":"Modules = [LinearWaves]","category":"page"},{"location":"api/#LinearWaves.LinearWaves","page":"API Reference","title":"LinearWaves.LinearWaves","text":"LinearWaves is an implementation of a linear water wave theory.\n\n\n\n\n\n","category":"module"},{"location":"api/#LinearWaves.group_velocity-Tuple{Real, Real, Real}","page":"API Reference","title":"LinearWaves.group_velocity","text":"group_velocity(k::Real, ω::Real, d::Real)\n\nCalculate group velocity (celerity) c_g for a regular wave of a number k and an angular frequency ω at depth d.\n\n\n\n\n\n","category":"method"},{"location":"api/#LinearWaves.horizontal_displacement-NTuple{7, Real}","page":"API Reference","title":"LinearWaves.horizontal_displacement","text":"horizontal_displacement(x::Real, z::Real, t::Real, a::Real, k::Real, ω::Real, d::Real)\n\nCalculate horizontal particle displacement ξ at position (x, z) and time t for a regular wave of amplitude a, wave number k, and angular wave frequency ω, propagating at constant depth d.\n\n\n\n\n\n","category":"method"},{"location":"api/#LinearWaves.horizontal_displacement_s-NTuple{7, Real}","page":"API Reference","title":"LinearWaves.horizontal_displacement_s","text":"horizontal_displacement_s(x::Real, z::Real, t::Real, a::Real, k::Real, ω::Real, d::Real)\n\nCalculate horizontal particle displacement ξ at position (x, z) and time t for a regular standing wave of amplitude a, wave number k, and angular wave frequency ω, propagating at constant depth d.\n\n\n\n\n\n","category":"method"},{"location":"api/#LinearWaves.horizontal_velocity-NTuple{7, Real}","page":"API Reference","title":"LinearWaves.horizontal_velocity","text":"horizontal_velocity(x::Real, z::Real, t::Real, a::Real, k::Real, ω::Real, d:Real)\n\nCalculate horizontal wave velocity u at position x and time t for a regular wave of amplitude a, wave number k, and angular wave frequency ω, propagating at constant depth d.\n\n\n\n\n\n","category":"method"},{"location":"api/#LinearWaves.horizontal_velocity_s-NTuple{7, Real}","page":"API Reference","title":"LinearWaves.horizontal_velocity_s","text":"horizontal_velocity_s(x::Real, z::Real, t::Real, a::Real, k::Real, ω::Real, d:Real)\n\nCalculate horizontal wave velocity u at position x and time t for a regular standing wave of amplitude a, wave number k, and angular wave frequency ω, propagating at constant depth d.\n\n\n\n\n\n","category":"method"},{"location":"api/#LinearWaves.phase_velocity-Tuple{Real, Real}","page":"API Reference","title":"LinearWaves.phase_velocity","text":"phase_velocity(k::Real, ω::Real)\n\nCalculate phase velocity (celerity) c for a regular wave of a number k and an angular frequency ω.\n\n\n\n\n\n","category":"method"},{"location":"api/#LinearWaves.pressure-NTuple{7, Real}","page":"API Reference","title":"LinearWaves.pressure","text":"pressure(x::Real, z::Real, t::Real, a::Real, k::Real, ω::Real, d::Real)\n\nCalculate pressure p at position (x, z) and time t under a regular wave of amplitude a, wave number k, and angular wave frequency ω, propagating at constant depth d.\n\n\n\n\n\n","category":"method"},{"location":"api/#LinearWaves.pressure_s-NTuple{7, Real}","page":"API Reference","title":"LinearWaves.pressure_s","text":"pressure_s(x::Real, z::Real, t::Real, a::Real, k::Real, ω::Real, d::Real)\n\nCalculate pressure p at position (x, z) and time t under a regular standing wave of amplitude a, wave number k, and angular wave frequency ω, propagating at constant depth d.\n\n\n\n\n\n","category":"method"},{"location":"api/#LinearWaves.vertical_displacement-NTuple{7, Real}","page":"API Reference","title":"LinearWaves.vertical_displacement","text":"vertical_displacement(x::Real, z::Real, t::Real, a::Real, k::Real, ω::Real, d::Real)\n\nCalculate vertical particle displacement ζ at position (x, z) and time t for a regular wave of amplitude a, wave number k, and angular wave frequency ω, propagating at constant depth d.\n\n\n\n\n\n","category":"method"},{"location":"api/#LinearWaves.vertical_displacement_s-NTuple{7, Real}","page":"API Reference","title":"LinearWaves.vertical_displacement_s","text":"vertical_displacement_s(x::Real, z::Real, t::Real, a::Real, k::Real, ω::Real, d::Real)\n\nCalculate vertical particle displacement ζ at position (x, z) and time t for a regular standing wave of amplitude a, wave number k, and angular wave frequency ω, propagating at constant depth d.\n\n\n\n\n\n","category":"method"},{"location":"api/#LinearWaves.vertical_velocity-NTuple{7, Real}","page":"API Reference","title":"LinearWaves.vertical_velocity","text":"vertical_velocity(x::Real, z::Real, t::Real, a::Real, k::Real, ω::Real, d:Real)\n\nCalculate vertical wave velocity v at position (x, z) and time t for a regular wave of amplitude a, wave number k, and angular wave frequency ω, propagating at constant depth d.\n\n\n\n\n\n","category":"method"},{"location":"api/#LinearWaves.vertical_velocity_s-NTuple{7, Real}","page":"API Reference","title":"LinearWaves.vertical_velocity_s","text":"vertical_velocity_s(x::Real, z::Real, t::Real, a::Real, k::Real, ω::Real, d:Real)\n\nCalculate vertical wave velocity v at position (x, z) and time t for a regular standing wave of amplitude a, wave number k, and angular wave frequency ω, propagating at constant depth d.\n\n\n\n\n\n","category":"method"},{"location":"api/#LinearWaves.wave_frequency-Tuple{Real, Real}","page":"API Reference","title":"LinearWaves.wave_frequency","text":"wave_frequency(d::Real, k::Real; g::Real=LinearWaves.g)\n\nCalculate angular wave frequency ω based on water depth d and gravitational acceleration g for a regular wave of a number k.\n\n\n\n\n\n","category":"method"},{"location":"api/#LinearWaves.wave_frequency-Tuple{Real}","page":"API Reference","title":"LinearWaves.wave_frequency","text":"wave_frequency(T::Real)\n\nCalculate wave angular frequency ω for a period T of a regular wave.\n\n\n\n\n\n","category":"method"},{"location":"api/#LinearWaves.wave_number-Tuple{Real, Real}","page":"API Reference","title":"LinearWaves.wave_number","text":"wave_number(d::Real, ω::Real; g::Real=LinearWaves.g, ϵ::Real=LinearWaves.tol)\n\nCalculate a wave number k based on depth d, an angular wave frequency ω and gravitational acceleration g for a given accuracy ϵ according to linear disperion relation.\"\n\n\n\n\n\n","category":"method"},{"location":"api/#LinearWaves.wave_number-Tuple{Real}","page":"API Reference","title":"LinearWaves.wave_number","text":"wave_number(L::Real)\n\nCalculate wave number k for a regular wave of length L.\n\n\n\n\n\n","category":"method"},{"location":"api/#LinearWaves.wave_period-Tuple{Real}","page":"API Reference","title":"LinearWaves.wave_period","text":"wave_period(ω::Real)\n\nCalculate a wave period T for angular frequency ω of a regular wave.\n\n\n\n\n\n","category":"method"},{"location":"api/#LinearWaves.wave_profile-NTuple{5, Real}","page":"API Reference","title":"LinearWaves.wave_profile","text":"wave_profile(x::Real, t::Real, a::Real, k::Real, ω::Real)\n\nCalculate free-surface elevation η at position x and time t for a regular wave of amplitude a, wave number k, and angular wave frequency ω.\n\n\n\n\n\n","category":"method"},{"location":"api/#LinearWaves.wave_profile_s-NTuple{5, Real}","page":"API Reference","title":"LinearWaves.wave_profile_s","text":"wave_profile_s(x::Real, t::Real, a::Real, k::Real, ω::Real)\n\nCalculate free-surface elevation η at position x and time t for a regular standing wave of amplitude a, wave number k, and angular wave frequency ω.\n\n\n\n\n\n","category":"method"},{"location":"api/#LinearWaves.wavelength-Tuple{Real}","page":"API Reference","title":"LinearWaves.wavelength","text":"wavelength(k::Real)\n\nCalculate wavelength L for a wave number k of a regular wave.\n\n\n\n\n\n","category":"method"},{"location":"","page":"Home","title":"Home","text":"CurrentModule = LinearWaves","category":"page"},{"location":"#LinearWaves","page":"Home","title":"LinearWaves","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for LinearWaves.","category":"page"}]
}