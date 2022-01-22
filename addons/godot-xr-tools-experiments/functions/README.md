# Godot XR Tools Functions
This folder contains a numer of functions that work with the various AR and XR interfaces for the Godot game engine.

## Function_FadeCollision
This function is a fade contributor that works with the Fader asset to obscure the players view if their head gets too close to a collider.

The following three properties control collision fading:
- Collision Layers - Layers detected for collision (make sure to ignore the player themselves)
- Fade Start Distance - Collision distance where the view starts to be obscured
- Fade Full Distance - Collision distance where the view is fully obscured

This function must be added as a child of the ARVRCamera (or the Fader attached to it) so it is located at the players head position. 

## Function_FadeInOut
This function performs time-driven fading in and out. This can be useful for scene fade-ins, or transitions.

The following properties control timed fading:
- obscure_rate - The rate at which the fader obscures the view. Full obscuring occurs in 1/obscure_rate seconds.
- reveal_rate - The rate at which the fader reveals the view. Full reveal occurs in 1/reveal_rate seconds.
- initial_fade - Initial fade level when the scene starts.
- fade_target - The target fade level. This value can be modified at any time.

In order to obscure the view before scene transitions, set the fade_target property to 1.0 and wait for the full obscure duration before transitioning.