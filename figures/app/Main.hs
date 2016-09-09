{-# LANGUAGE NoMonomorphismRestriction #-}

module Main where

import Diagrams.Prelude
import Diagrams.Backend.SVG.CmdLine

--import Lib
--

node :: Colour Double -> Diagram B
node col = circle 1 # fc col # opacity 0.25

vennD :: Diagram B
vennD =   atPoints (trailVertices $ regPoly 3 1)
                [node blue, node red, node yellow]
            <> text "powerful"  # fontSizeL 0.25 # fc black # translate (r2 (0.9,-0.9))
            <> text "simple"    # fontSizeL 0.25 # fc black # translate (r2 (-0.9,-0.9))
            <> text "flexible"  # fontSizeL 0.25 # fc black # translate (r2 (0,1.27))
            <> text "Arduino"   # fontSizeL 0.14 # fc black # translate (r2 (0,-0.8))
            <> text "DIY"       # fontSizeL 0.14 # fc black
                                # translate ((r2 (0,-0.8)) # rotate (2*pi/3.3 @@ rad))
            <> text "ideal ROS" # fontSizeL 0.14 # fc black
            <> text "actual ROS"# fontSizeL 0.14 # fc black
                                # translate ((r2 (0,-0.8)) # rotate (2*pi/2.5 @@ rad))
            <> text "mBed"      # fontSizeL 0.14 # fc black
                                # translate (r2 (0.4,-0.4))
            <> text "microPython"      # fontSizeL 0.14 # fc black
                                # translate ((r2 (0,-0.5)) # rotate (1.3*pi @@ rad))
main :: IO ()
main = mainWith (vennD :: Diagram B)
