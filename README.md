A simple Haskell fractal renderer, showcasing the strengths of a compositional approach to programming. Based on [Composing fractals, Mark P. Jones. 2004](http://web.cecs.pdx.edu/~mpj/pubs/composing-fractals.pdf).

`Fractals.hs` contains the abstract fractal functions.
`ascii.hs` uses it to renders fractals in ASCII and is cool to play with in ghci.
`graphical.hs` and `julia_param-*.hs` use the [Gloss](http://hackage.haskell.org/package/gloss) graphics library to zoom into a Julia set and animate the Julia starting parameter, respectively.

You can view a presentation with some fancy pictures [here](https://docs.google.com/presentation/d/1h88WKBrgarV_3jn6a_mXZnUJSDK5Qg7RCgy8Pqq7Gw8/pub?start=false&loop=false&delayms=3000).
