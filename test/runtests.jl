using ColormapsOcean
@static if VERSION < v"0.7.0-DEV.2005"
    using Base.Test
else
    using Test
end

# write your own tests here
cmaps=[:algae,:amp,:balance,:curl,:deep,:delta,:dense,:gray,:haline,:ice,:matter,:oxy,:phase,:solar ,:speed,:tempo,:thermal,:turbid]
sz=[size(cmocean[cm],1) for cm in cmaps]
@test size(sz, 1)==1
@test all([z==256 || z==512 for z in sz])
