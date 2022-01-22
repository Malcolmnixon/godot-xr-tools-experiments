# Godot XR Tools Assets
This folder contains a number of assets that work with the various AR and XR interfaces for the Godot game engine.

## Fader
The Fader asset can be used to fade the players view. It must be added as a child of the ARVRCamera.

The Fader works in conjunction with Fade Contributor functions such as:
- Function_FadeInOut
- Function_FadeCollision

Additional fade contributors may be constructed by:
- Adding the contributor to the "fade_contributors" group
- Exposing a "fade_contribution" float property in the range 0.0 (fully reveal view) to 1.0 (fully obscure view)

The Fader will occlude the view using the highest contribution from any fade contributor.

The Fader color may be adjusted by modifying the Albedo color on the FadeMesh material.