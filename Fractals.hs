module Fractals where

import Data.Complex

-- we will represent the fractal as points in the complex plane
type C = Complex Float

next :: C -> C -> C
next p z = z^2 + p

fractal :: C -> C -> [C]
fractal z p = iterate (next p) z

notfar :: C -> Bool
notfar p = let threshold = 47 in realPart (abs p) < threshold

type Fractal = C -> [C]

-- the Mandelbrot set has a fixed origin (z) at 0+0i
mandelbrot :: Fractal
mandelbrot = fractal (0 :+ 0)

in_fractal :: Fractal -> C -> Bool
in_fractal frac p = all notfar (frac p)

-- in_fractal mandelbrot (0 :+ 0) → True

in_fractal_approx :: Int -> Fractal -> C -> Int
in_fractal_approx n fr p = length . take n . takeWhile notfar $ fr p

-- Julia sets have a fixed shift that determines the shape and varied origin
julia :: C -> Fractal
julia c p = fractal p c

-- ...and a few pretty presets :)
rabbit     = julia ((-0.123) :+ 0.745)
siegeldisk = julia ((-0.391) :+ (-0.587))
fancy      = julia ((-0.702) :+ (-0.384))

-- an image is just a mapping from a point to a color
type Image color = C -> color -- color could be anything...

mkimage :: Fractal -> [color] -> Image color
mkimage f palette = (palette !!) . steps
                    where steps = in_fractal_approx (length palette - 1) f
