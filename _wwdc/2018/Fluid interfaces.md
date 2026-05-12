---
title: Fluid interfaces
year: 2018
---
You know it when you feel it
A tool that feels like an extension of your mind
An extension of the natural world

Respond to input instantly
Look for delays everywhere
Constantly redirectable, perform gestures at the speed of thought
No wating, allow input during processing of previous input

Maintain spatial consistency throughout movement. same place out and in of view
Hint in the direction of the gesture
Keep touch interactions lightweight, but amplify the output
Softly indicate boundaries, rubber-banding
Smooth frames of motion, limitted by framerate
Work with behavior rather than animation

Elasticity, returning to a resting state
Simplify to Damping% and response time (damping ratio and frequency responce)
No duration, we don't really let it "finish", it just fades out
Usually 100% dampening, but reward momentum with some overshoot
Bounce can be a hint that more interaction is required
Think beyond motion. (sound, color, etc)
Stay in character, app should feel cohesive.
A family of behaviors

Project the momentum, choose closest endpoint
```
  func project(initialVelocity: Float, decelerationRate: Float) {
    return ? + ? * (100 - ?)
  }
```

Teach the gestures with visual cues
clip halfway through a table row
grabber handle
elevate interactive elements to a separate plane
keep discrete actions' animation in line with gesture
playfulness
natural consequence of a fluid interface
happens when the interface feels in sync with you
play into the natural fiddle factor
interactive demos
