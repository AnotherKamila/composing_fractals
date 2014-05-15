import Fractals
import Data.Complex

ascii_palette = "       ....---,,,'''--:=;o!?X08#%&$@"

grid :: (Int,Int) -> (Float,Float) -> (Float,Float) -> [[C]]
grid (w,h) (xt,yt) (xb,yb) =
                [ [ x :+ y | x <- [xt, xt+stepx .. xb] ] | y <- [yt, yt+stepy .. yb] ]
                       where stepx = (xb - xt)/(fromIntegral w)
                             stepy = (yb - yt)/(fromIntegral h)

to_ascii :: [[C]] -> Fractal -> [Char]
to_ascii grid frac = unlines $ map (map (mkimage frac ascii_palette)) grid

render :: Fractal -> String
render frac = to_ascii (grid (120,40) (-2.1,-1.2) (2,1.2)) frac

main = putStr $ render mandelbrot
