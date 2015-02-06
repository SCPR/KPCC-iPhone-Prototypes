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
    initial: {blur:0, brightness:100, scale:1},
})
scrubber.ProgramTile.states.animationOptions = {
	curve: "linear",
	time: 0.2
}

# Navbar
scrubber.Navbar.states.add({
    hidden: {y:-121},
    initial: {y:0},
})
scrubber.Navbar.states.animationOptions = {
	curve: curve2
}

# Content Share Button
scrubber.ShareBtn.states.add({
    hidden: {opacity:0},
    initial: {opacity:1},
})
scrubber.ShareBtn.states.animationOptions = {
	curve: "linear",
	time: 0.1
}

# Show Title Label
scrubber.ShowTitle.states.add({
    hidden: {opacity:0},
    initial: {opacity:1},
})
scrubber.ShowTitle.states.animationOptions = {
	curve: "linear",
	time: 0.1
}

#Episode Title Label
scrubber.EpisodeTitle.states.add({
    dimmed: {opacity:0.6},
    initial: {opacity:1},
})
scrubber.EpisodeTitle.states.animationOptions = {
	curve: "linear",
	time: 0.1
}

#Episode Date Label
scrubber.EpisodeDate.states.add({
    hidden: {opacity:0},
    initial: {opacity:1},
})
scrubber.EpisodeDate.states.animationOptions = {
	curve: "linear",
	time: 0.1
}

# Show Divider
scrubber.ShowDivider.states.add({
    hidden: {opacity:0},
    initial: {opacity:1},
})
scrubber.ShowDivider.states.animationOptions = {
	curve: "linear",
	time: 0.1
}

# Track Duration Label
scrubber.TrackDuration.states.add({
    hidden: {opacity:0},
    initial: {opacity:1},
})
scrubber.TrackDuration.states.animationOptions = {
	curve: "linear",
	time: 0.1
}

# Track Length Label
scrubber.TrackLength.states.add({
    hidden: {opacity:0},
    initial: {opacity:1},
})
scrubber.TrackLength.states.animationOptions = {
	curve: "linear",
	time: 0.05
}

# Back 30 Button
scrubber.Back30.states.add({
    hidden: {opacity:0, scale: 0},
    engaged: {opacity:1, scale: 1},
})
scrubber.Back30.states.animationOptions = {
	curve: curve2
}

# Forward 30 Button
scrubber.Forward30.states.add({
    hidden: {opacity:0, scale: 0},
    engaged: {opacity:1, scale: 1},
})
scrubber.Forward30.states.animationOptions = {
	curve: curve2
}

# Track Duration Engaged Label
scrubber.TrackDurationEngaged.states.add({
    hidden: {opacity:0, scale: 0},
    engaged: {opacity:1, scale: 1},
})
scrubber.TrackDurationEngaged.states.animationOptions = {
	curve: curve2
}

# Track Length Engaged
scrubber.TrackLengthEngaged.states.add({
    hidden: {height:0, y: 760},
    engaged: {height:183, y: 579},
})
scrubber.TrackLengthEngaged.states.animationOptions = {
	curve: "linear",
	time: 0.12
}

# Track Progress Engaged
scrubber.TrackProgressEngaged.states.add({
    initial: {height:6, y: 755},
    engaged: {height:183, y: 579},
})
scrubber.TrackProgressEngaged.states.animationOptions = {
	curve: "linear",
	time: 0.12
}

# Close Button
scrubber.CloseBtn.states.add({
    hidden: {opacity:0, scale: 0},
    engaged: {opacity:1, scale: 1},
})
scrubber.CloseBtn.states.animationOptions = {
	curve: curve2
}


###############################
# Trigger animations
###############################

isHeld = false

scrubber.PressZone.on Events.TouchStart, () ->
  isHeld = true
  Utils.delay .5, () ->
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
  isHeld = false