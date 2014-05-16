import Fractals
import Text.Printf
import Data.Complex
import Graphics.Gloss.Interface.Pure.Animate
import Graphics.Gloss.Raster.Field

palette = map (\v -> makeColor 0 (v^2) 0.1 0) [0, 0.02 .. 1]

julia_anim :: C -> (Point -> Color)
julia_anim p (re,im) = mkimage (julia p) palette ((re) :+ (im))

scaletime t
    | t < 18 = t
    | t < 23 = t + (t - 18)*5
    | otherwise = t + 25

pic t = pictures [frac, param]
        where re = 0.35; im = ((scaletime t)-10)/100
              --time  = Translate (-80) (-180) $ Scale 0.3 0.3 $ Text (show t)
              param = Translate (-320) (-250) $ Scale 0.2 0.2 $ Text (printf "%.3f + %.3fi" re im)
              frac  = makePicture 800 600 3 3 $ julia_anim (re :+ im)

window = InWindow "Magic!" (800, 600) (100, 100)

main = animate window black pic
