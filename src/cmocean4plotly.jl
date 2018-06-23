#= Including this file

julia> include("code/julia/cmocean4plotly.jl")

generates file "ColormapsOcean.jl" which then has the code for
the Julia module ColormapsOcean. It makes available the ocean colormaps

https://matplotlib.org/cmocean/

with the PlotlyJS.jl plotting package. This file is included
in the ColormapsOcean.jl package, but it is only needed if the original
color maps get updated or enhanced, or the Julia code has to be regenerated
for some reason. Please edit then paths according to your local setup.

=#
ppath = "code/cmocean/cmocean/rgb"
fid = open(joinpath("code/julia", "ColormapsOcean.jl"), "w")
@printf(fid, "__precompile__()\n\nmodule ColormapsOcean\n\n")
@printf(fid, "export cmocean\n\n")
@printf(fid, "const cmocean = Dict{Symbol, Vector{Tuple{Float64,String}}}()\n\n")
for (_, __, files) in walkdir(ppath)
    for fnm in files
        if !ismatch(r"txt$", fnm)
            continue
        end
        @printf(fid, "cmocean[:%s] = [\n", fnm[1:search(fnm, '-')-1])
        lns = open(readdlm, joinpath(ppath, fnm))
        for k in 1:size(lns, 1)
            rgb = view(lns, k, :)
            if k>1
                println(fid, ",")
            end
            print(fid, "($((k-1)/255), \"rgb($(round(UInt8, rgb[1]*255)),$(round(UInt8, rgb[2]*255)),$(round(UInt8, rgb[3]*255)))\")")
        end
        println(fid, "]\n")
    end
end
println(fid, "end   # module ColormapsOcean")
close(fid)
