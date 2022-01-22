# Godot XR Tools Objects
This folder contains a number of objects that work with the various AR and XR interfaces for the Godot game engine.

## FadeArea
This object defines a game area which interacts with the Function_FadeArea fade controller to obscure or reveal the player view.

The following two properties control the fade area:
- fade_level - the fade level to apply in this area
- priority - the priority of this area when fade areas overlap - the area with the higher priority is used