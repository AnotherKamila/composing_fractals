import Fractals
import Data.Complex
import Graphics.Gloss.Raster.Field

palette = map (\v -> makeColor 0 (v^2) 0.1 0) [0, 0.02 .. 1]

animate :: Fractal -> Float -> (Point -> Color)
animate frac t (re,im) = mkimage frac palette ((re/sc - 0.108) :+ (im/sc - 0.1))
                         where sc = (1.1**t)/2

window = InWindow "Magic!" (800, 600) (100, 100)

main = animateField window (1,1) (animate fancy)
