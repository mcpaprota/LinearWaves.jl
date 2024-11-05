using LinearWaves
using Documenter

DocMeta.setdocmeta!(LinearWaves, :DocTestSetup, :(using LinearWaves); recursive=true)

makedocs(;
    modules=[LinearWaves],
    authors="mcpaprota <mapap@ibwpan.gda.pl> and contributors",
    sitename="LinearWaves.jl",
    format=Documenter.HTML(;
        canonical="https://mcpaprota.github.io/LinearWaves.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/mcpaprota/LinearWaves.jl",
    devbranch="main",
)
