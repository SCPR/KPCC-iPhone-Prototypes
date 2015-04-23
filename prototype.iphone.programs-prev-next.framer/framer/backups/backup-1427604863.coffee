# This imports all the layers for "prev-next" into prevNextLayers
prevNext = Framer.Importer.load "imported/prev-next"

# Create layer for SVG animation
prevNext.Spinner = new Layer()
prevNext.Spinner.backgroundColor = "transparent"
prevNext.Spinner.x = 226
prevNext.Spinner.y = 825
prevNext.Spinner.width = 184
prevNext.Spinner.height = 184
prevNext.Spinner.html = "<svg class='spinner' width='188px' height='188px' viewBox='0 0 66 66' xmlns='http://www.w3.org/2000/svg'><circle class='path' fill='none' stroke-width='1' stroke-linecap='round' cx='33' cy='33' r='30'></circle></svg>"


###############################
# Set up device attributes
###############################

# Set canvas BG image
Framer.Device.background.image = "http://a.scpr.org/i/7a376d4259ccd459d68495f8ee6f7e0f/86185-full.jpg"


###############################
# Set up initial layer states
###############################

prevNext.ShowTile.y = 100
prevNext.PrevTrackProgress.opacity = 0
prevNext.NextTrackProgress.opacity = 0
prevNext.NextEpisodeTitle.x = 650 
prevNext.PrevEpisodeTitle.x = -450 
prevNext.CurrentEpisodeTitle.y = 100
prevNext.NextEpisodeTitle.y = 100
prevNext.LoadingEpisode.opacity = 0
prevNext.Spinner.opacity = 0

# Create Transparent Layer for Dragging
prevNext.dragCanvas = new Layer
  x:0, y:121, width:1280, height:640, backgroundColor: "transparent", opacity: 1

# Make Title layers subLayers of draggable canvas
prevNext.dragCanvas.addSubLayer(prevNext.CurrentEpisodeTitle)
prevNext.dragCanvas.addSubLayer(prevNext.NextEpisodeTitle)

  
###############################
# Set some animation styles
###############################

curve1 = "spring(200,20,30)"
curve2 = "spring(130,20,10)"


###############################
# Establish states for layers
###############################

# Program Tile Image BG
prevNext.ShowTile.states.add({
    blur: {blur:20, brightness:80, scale:1.02},
    initial: {blur:0, brightness:100, scale:1},
})
prevNext.ShowTile.states.animationOptions = {
	curve: "linear",
	time: 0.3
}

# Current Track Progress
prevNext.CurrentTrackProgress.states.add({
    hidden: {opacity:0},
    initial: {opacity:1},
})
prevNext.CurrentTrackProgress.states.animationOptions = {
	curve: "linear",
	time: 0.075
}

# Next Track Progress
prevNext.NextTrackProgress.states.add({
    hidden: {opacity:0},
    initial: {opacity:1},
})
prevNext.NextTrackProgress.states.animationOptions = {
	curve: "linear",
	time: 0.2
}


# Content Share Button
prevNext.ContentShare.states.add({
    hidden: {opacity:0},
    initial: {opacity:1},
})
prevNext.ContentShare.states.animationOptions = {
	curve: "linear",
	time: 0.075
}

# Loading UI Label
prevNext.LoadingEpisode.states.add({
    hidden: {opacity:0},
    engaged: {opacity:1},
})
prevNext.LoadingEpisode.states.animationOptions = {
	curve: "linear",
	time: 0.1
}

# Pause Button
prevNext.PauseBtn.states.add({
    engaged: {opacity:1},
    hidden:  {opacity:0}
})
prevNext.PauseBtn.states.animationOptions = {
  curve: "ease-out",
  time: 0.25
}

# Spinner
prevNext.Spinner.states.add({
    engaged: {opacity: 1},
    dismiss: {opacity: 0}
})
prevNext.Spinner.states.animationOptions = {
  curve: "ease-out",
  time: 0.4
}


###############################
# Trigger animations
###############################

# Make Canvas Draggable
prevNext.dragCanvas.draggable.enabled = true
prevNext.dragCanvas.draggable.speedX = 1.5
prevNext.dragCanvas.draggable.speedY = 0
initX = prevNext.dragCanvas.x
initMidX = prevNext.dragCanvas.midX
initY = prevNext.dragCanvas.y
windowHeight = window.innerHeight
windowWidth = window.innerHeight

# Set behavior on DragMove
prevNext.dragCanvas.on Events.DragMove, (event) ->
	
  # Blur ProgramTile, fade current track progress and share button
  prevNext.ShowTile.states.switch("blur")
  prevNext.CurrentTrackProgress.states.switch("hidden")
  prevNext.ContentShare.states.switch("hidden")
  
  # set boundary for draggable canvas
  boundRadius = 700
  # Set resistance and boundaries on draggable layer
  position = x: 0
  distance = x: Math.abs(prevNext.dragCanvas.x - position.x)
  prevNext.dragCanvas.draggable.speedX = 2 - Math.min(distance.x, boundRadius) / boundRadius

  
# Set behavior on DragEnd
prevNext.dragCanvas.on Events.DragEnd, ->
  
  if prevNext.dragCanvas.x < -400
    
  	# Set layer states
  	prevNext.PauseBtn.states.switch("hidden")
  	prevNext.Spinner.states.switch("engaged")
  	prevNext.LoadingEpisode.states.switch("engaged")
  	
  	Utils.delay 2, -> 
  	  prevNext.LoadingEpisode.states.switch("hidden")
  	  prevNext.NextTrackProgress.states.switch("initial")
  	  prevNext.ContentShare.states.switch("initial")
  	  prevNext.PauseBtn.states.switch("engaged")
  	  prevNext.Spinner.opacity = 0
  	  prevNext.ShowTile.states.switch("initial")
  	
  	# Advance to next episode
  	prevNext.dragCanvas.animate 
      properties:
        x: -620
      curve: curve2
  else
  	# Set layer states
    prevNext.ShowTile.states.switch("initial")
    prevNext.CurrentTrackProgress.states.switch("initial")
    prevNext.NextTrackProgress.states.switch("hidden")
    prevNext.ContentShare.states.switch("initial")
  
  	# Slide UI back to currently playing episode
  	prevNext.dragCanvas.animate 
      properties:
        x: initX
      curve: curve2

