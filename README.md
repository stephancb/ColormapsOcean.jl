# ColormapsOcean

[![Build Status](https://travis-ci.org/stephancb/ColormapsOcean.jl.svg?branch=master)](https://travis-ci.org/stephancb/ColormapsOcean.jl)

[![Coverage Status](https://coveralls.io/repos/stephancb/ColormapsOcean.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/stephancb/ColormapsOcean.jl?branch=master)

[![codecov.io](http://codecov.io/github/stephancb/ColormapsOcean.jl/coverage.svg?branch=master)](http://codecov.io/github/stephancb/ColormapsOcean.jl?branch=master)

ColormapsOcean.jl
===================

This package makes the beautiful color maps for oceanography,
[cmocean](https://matplotlib.org/cmocean/), available for the
PlotlyJS package.

See also

Thyng, K. M., C. A. Greene, R. D. Hetland, H. M. Zimmerle, and S. F.
DiMarco. 2016. True colors of oceanography: Guidelines for effective and
accurate colormap selection. Oceanography 29(3):9–13,
doi:10.5670/oceanog.2016.66.

Example:

```julia
cmaps=[:algae,:amp,:balance,:curl,:deep,:delta,:dense,:gray,:haline,:ice,:matter,:oxy,:phase,:solar ,:speed,:tempo,:thermal,:turbid]
x=linspace(0,1,256);
p=[[plot(heatmap(x=x,y=[0,1],z=hcat(x,x),colorscale=cmocean[cm],showscale=false), Layout(title=String(cm), xaxis_showticklabels=false)) for cm in cmaps]...];
relayout!(p, height=1080, width=400); display(p);
```

![ocean colormaps][cmocean]

[cmocean]: https://github.com/stephancb/ColormapsOcean.jl/blob/master/test/cmocean.png "Ocean Colormaps"

