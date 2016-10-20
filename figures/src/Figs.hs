{-# LANGUAGE NoMonomorphismRestriction  #-}

module Figs where

import              Diagrams.Prelude
import              Diagrams.Backend.SVG

opaqueCircle :: Colour Double -> Diagram B
opaqueCircle col = circle 1 # fc col # opacity 0.25

namedCircle :: Colour Double -> String -> Diagram B
namedCircle col label = text label # fontSizeL 2 # fc black <> circle 2 # fc col

namedRegPoly :: Int -> [String] -> Diagram B
namedRegPoly n names =  (atPoints (regPoly n 10) $ map (namedCircle white) names)
                <>  regPoly n 10

-- Venn Diagrams
----------------

vennPlace :: (Double, Double) -> Double -> (Diagram B -> Diagram B)
vennPlace vec ang = translate $ r2 vec # rotate (ang @@ rad)

fontOpts :: Double -> Colour Double -> (Diagram B -> Diagram B)
fontOpts size col = fontSizeL size # fc col

vennD :: Diagram B
vennD =     atPoints (trailVertices $ regPoly 3 1)
                [opaqueCircle blue, opaqueCircle red, opaqueCircle yellow]
            <>  text "powerful" # fontOpts 0.25 black # vennPlace (0.9,-0.9) 0
            <>  text "simple"   # fontOpts 0.25 black # vennPlace (-0.9,-0.9) 0
            <>  text "flexible" # fontOpts 0.25 black # vennPlace (0,1.27) 0
            <>  text "Arduino"  # fontOpts 0.14 black # vennPlace (0,-0.8) 0
            <>  text "DIY"      # fontOpts 0.14 black # vennPlace (0,-0.8) (2*pi/3.3)
            <>  text "ideal ROS"
                                # fontOpts 0.14 black
            <>  text "actual ROS"
                                # fontOpts 0.14 black # vennPlace (0,-0.8) (2*pi/2.5)
            <>  text "roshask"  # fontOpts 0.14 black # vennPlace (0,-0.7) (0.73*pi)
            <>  text "mBed"     # fontOpts 0.14 black # vennPlace (0.4,-0.4) 0
            <>  text "microPython"
                                # fontOpts 0.14 black # vennPlace (0,-0.5) (1.3*pi)

