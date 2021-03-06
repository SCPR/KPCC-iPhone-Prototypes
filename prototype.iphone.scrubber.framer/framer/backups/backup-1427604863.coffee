# This imports all the layers for "scrubber" into scrubberLayers
scrubber = Framer.Importer.load "imported/scrubber"

###############################
# Set up device attributes
###############################

# Set canvas BG image
Framer.Device.background.image = "http://a.scpr.org/i/7a376d4259ccd459d68495f8ee6f7e0f/86185-full.jpg"


###############################
# Set up initial layer states
###############################

scrubber.TrackDurationEngaged.opacity = 0
scrubber.TrackDurationEngaged.scale = 0
scrubber.TrackProgress.opacity = 0
scrubber.TrackLengthEngaged.height = 0
scrubber.TrackLengthEngaged.y = 760
scrubber.Forward30.opacity = 0
scrubber.Back30.opacity = 0
scrubber.TrackProgressEngaged.height = 6
scrubber.TrackProgressEngaged.y = 755
scrubber.Back30.scale = 0
scrubber.Forward30.scale = 0
scrubber.CloseBtn.scale = 0

# Create Transparent Layer for Dragging
scrubber.dragCanvas = new Layer
	x:0, y:565, width:0, height:200, backgroundColor: "transparent", opacity: 1
  
###############################
# Set some animation styles
###############################

curve1 = "spring(200,20,30)"
curve2 = "spring(130,20,10)"


###############################
# Establish states for layers
###############################

# Program Tile Image BG
scrubber.ProgramTile.states.add({
    blur: {blur:20, brightness:80, scale:1.02},
    initial: {blur:0, brightness:100, scale:1}
})
scrubber.ProgramTile.states.animationOptions = {
	curve: "ease-in-out",
	time: 0.11
}

# Navbar
scrubber.Navbar.states.add({
    hidden: {y:-121},
    initial: {y:0}
})
scrubber.Navbar.states.animationOptions = {
	curve: "ease-in-out",
	time: 0.11
}

# Content Share Button
scrubber.ShareBtn.states.add({
    hidden: {opacity:0},
    initial: {opacity:1}
})
scrubber.ShareBtn.states.animationOptions = {
	curve: "ease-in-out",
	time: 0.11
}

# Show Title Label
scrubber.ShowTitle.states.add({
    hidden: {opacity:0},
    initial: {opacity:1}
})
scrubber.ShowTitle.states.animationOptions = {
	curve: "ease-in-out",
	time: 0.11
}

#Episode Title Label
scrubber.EpisodeTitle.states.add({
    dimmed: {opacity:0.6},
    initial: {opacity:1}
})
scrubber.EpisodeTitle.states.animationOptions = {
	curve: "ease-in-out",
	time: 0.11
}

#Episode Date Label
scrubber.EpisodeDate.states.add({
    hidden: {opacity:0},
    initial: {opacity:1}
})
scrubber.EpisodeDate.states.animationOptions = {
	curve: "ease-in-out",
	time: 0.11
}

# Show Divider
scrubber.ShowDivider.states.add({
    hidden: {opacity:0},
    initial: {opacity:1}
})
scrubber.ShowDivider.states.animationOptions = {
	curve: "ease-in-out",
	time: 0.11
}

# Track Duration Label
scrubber.TrackDuration.states.add({
    hidden: {opacity:0},
    initial: {opacity:1}
})
scrubber.TrackDuration.states.animationOptions = {
	curve: "ease-in-out",
	time: 0.11
}

# Track Length Label
scrubber.TrackLength.states.add({
    hidden: {opacity:0},
    initial: {opacity:1}
})
scrubber.TrackLength.states.animationOptions = {
	curve: "ease-in-out",
	time: 0.05
}

# Back 30 Button
scrubber.Back30.states.add({
    hidden: {opacity:0, scale: 0},
    engaged: {opacity:1, scale: 1},
    press: {scale: 0.9, curve: curve1}
})
scrubber.Back30.states.animationOptions = {
	curve: "ease-in-out",
	time: 0.11
}

# Forward 30 Button
scrubber.Forward30.states.add({
    hidden: {opacity:0, scale: 0},
    engaged: {opacity:1, scale: 1},
    press: {scale: 0.9, curve: curve1}
})
scrubber.Forward30.states.animationOptions = {
	curve: "ease-in-out",
	time: 0.11
}

# Track Duration Engaged Label
scrubber.TrackDurationEngaged.states.add({
    hidden: {opacity:0, scale: 0},
    engaged: {opacity:1, scale: 1}
})
scrubber.TrackDurationEngaged.states.animationOptions = {
	curve: "ease-in-out",
	time: 0.11
}

# Track Length Engaged
scrubber.TrackLengthEngaged.states.add({
    hidden: {height:0, y: 760},
    engaged: {height:183, y: 579}
})
scrubber.TrackLengthEngaged.states.animationOptions = {
	curve: "ease-in-out",
	time: 0.11
}

# Track Progress Engaged
scrubber.TrackProgressEngaged.states.add({
    initial: {height:6, y: 755},
    engaged: {height:183, y: 579}
})
scrubber.TrackProgressEngaged.states.animationOptions = {
	curve: "ease-in-out",
	time: 0.11
}

# Drag Canvas 
scrubber.dragCanvas.states.add({
    initial: {width:0},
    engaged: {width:640}
})
scrubber.TrackProgressEngaged.states.animationOptions = {
	curve: "linear",
	time: 0.05
}

# Close Button
scrubber.CloseBtn.states.add({
    hidden: {opacity:0, scale: 0},
    engaged: {opacity:1, scale: 1},
    press: {scale: 0.8, curve: curve1}
})
scrubber.CloseBtn.states.animationOptions = {
	curve: "ease-in-out",
	time: 0.11
}

# Pause Button
scrubber.PauseBtn.states.add({
    engaged: {scale: 1},
    press: {scale: 0.95, curve: curve1}
})
scrubber.PauseBtn.states.animationOptions = {
	curve: "ease-in-out",
	time: 0.11
}



###############################
# Trigger animations
###############################

# Make Canvas Draggable
scrubber.dragCanvas.draggable.enabled = true
scrubber.dragCanvas.draggable.speedX = 1.5
scrubber.dragCanvas.draggable.speedY = 0
initX = scrubber.dragCanvas.x
initMidX = scrubber.dragCanvas.midX
initY = scrubber.dragCanvas.y
windowHeight = window.innerHeight
windowWidth = window.innerHeight

# Set behavior on DragMove
scrubber.dragCanvas.on Events.DragMove, (event) ->
	
  # Blur ProgramTile, fade current track progress and share button
  scrubber.ProgramTile.states.switch("initial")
  
  # set boundary for draggable canvas
  boundRadius = 700
  # Set resistance and boundaries on draggable layer
  position = x: 0
  distance = x: Math.abs(scrubber.dragCanvas.x - position.x)
  scrubber.dragCanvas.draggable.speedX = 2 - Math.min(distance.x, boundRadius) / boundRadius


# Make close button respond to touch
scrubber.CloseBtn.on Events.TouchStart, ->
  scrubber.CloseBtn.states.switch("press")
  
# Make back30 button respond to touch
scrubber.Back30.on Events.TouchStart, ->
  scrubber.Back30.states.switch("press")
  
scrubber.Back30.on Events.TouchEnd, ->
  scrubber.Back30.states.switch("engaged")
  
# Make forward30 button respond to touch
scrubber.Forward30.on Events.TouchStart, ->
  scrubber.Forward30.states.switch("press")
  
scrubber.Forward30.on Events.TouchEnd, ->
  scrubber.Forward30.states.switch("engaged")
  
# Make pause button respond to touch
scrubber.PauseBtn.on Events.TouchStart, ->
  scrubber.PauseBtn.states.switch("press")
  
scrubber.PauseBtn.on Events.TouchEnd, ->
  scrubber.PauseBtn.states.switch("engaged")

isHeld = false

scrubber.PressZone.on Events.TouchStart, () ->
  isHeld = true
  Utils.delay .35, () ->
    if isHeld then triggerLongHold()
    
triggerLongHold = () ->
  # this is the long hold trigger
  scrubber.ProgramTile.states.switch("blur")
  scrubber.Navbar.states.switch("hidden")
  scrubber.TrackDuration.states.switch("hidden")
  scrubber.TrackLength.states.switch("hidden")
  scrubber.ShareBtn.states.switch("hidden")
  scrubber.ShowTitle.states.switch("hidden")
  scrubber.ShowDivider.states.switch("hidden")
  scrubber.EpisodeTitle.states.switch("dimmed")
  scrubber.EpisodeDate.states.switch("hidden")
  scrubber.Back30.states.switch("engaged")
  scrubber.Forward30.states.switch("engaged")
  scrubber.TrackDurationEngaged.states.switch("engaged")
  scrubber.TrackLengthEngaged.states.switch("engaged")
  scrubber.TrackProgressEngaged.states.switch("engaged")
  scrubber.CloseBtn.states.switch("engaged")
  scrubber.dragCanvas.states.switch("engaged")
  isHeld = false
  
scrubber.CloseBtn.on Events.TouchEnd, () ->
  scrubber.ProgramTile.states.switch("initial")
  scrubber.Navbar.states.switch("initial")
  scrubber.TrackDuration.states.switch("initial")
  scrubber.TrackLength.states.switch("initial")
  scrubber.ShareBtn.states.switch("initial")
  scrubber.ShowTitle.states.switch("initial")
  scrubber.ShowDivider.states.switch("initial")
  scrubber.EpisodeTitle.states.switch("initial")
  scrubber.EpisodeDate.states.switch("initial")
  scrubber.Back30.states.switch("hidden")
  scrubber.Forward30.states.switch("hidden")
  scrubber.TrackDurationEngaged.states.switch("hidden")
  scrubber.TrackLengthEngaged.states.switch("hidden")
  scrubber.TrackProgressEngaged.states.switch("initial")
  scrubber.CloseBtn.states.switch("engaged")
  scrubber.dragCanvas.states.switch("initial")