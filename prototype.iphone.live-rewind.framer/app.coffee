# Imports all the layers for "live-rewind" into liveRewind
liveRewind = Framer.Importer.load "imported/live-rewind"

# Create layer for SVG animation
liveRewind.Spinner = new Layer()
liveRewind.Spinner.backgroundColor = "transparent"
liveRewind.Spinner.x = 226
liveRewind.Spinner.y = 795
liveRewind.Spinner.width = 184
liveRewind.Spinner.height = 184
liveRewind.Spinner.html = "<svg class='spinner' width='188px' height='188px' viewBox='0 0 66 66' xmlns='http://www.w3.org/2000/svg'><circle class='path' fill='none' stroke-width='1' stroke-linecap='round' cx='33' cy='33' r='30'></circle></svg>"


###############################
# Set up device attributes
###############################

# Set canvas BG image
Framer.Device.background.image = "http://a.scpr.org/i/7a376d4259ccd459d68495f8ee6f7e0f/86185-full.jpg"


###############################
# Set up initial layer states
###############################

liveRewind.ShowTitleEngaged.opacity = 0
liveRewind.ShowTitleRewinding.opacity = 0
liveRewind.PauseRects.opacity = 0
liveRewind.PauseRects.scale = 0
liveRewind.DividerProgress.width = 0
liveRewind.DividerProgress.x = 320
liveRewind.Progress.width = 0
liveRewind.PauseBtn.opacity = 0
liveRewind.Spinner.opacity = 0

###############################
# Set some animation styles
###############################

curve1 = "spring(200,20,30)"
curve2 = "spring(130,20,10)"


###############################
# Establish states for layers
###############################

# Program Tile Image BG
liveRewind.ShowTIle.states.add({
    blur: {blur:20, brightness:60, scale:1.0},
    initial: {blur:0, brightness:100, scale:1},
})
liveRewind.ShowTIle.states.animationOptions = {
  curve: "linear",
  time: 0.4
}

# Home Play Button
liveRewind.PlayBtn.states.add({
    initial: {scale:1, opacity:1},
    dismiss: {scale:0, opacity:0},
})
liveRewind.PlayBtn.states.animationOptions = {
  curve: curve1
}

# Show Title - On Now
liveRewind.ShowTitleInitial.states.add({
    initial: {scale:1, opacity:1},
    dismiss: {scale:0, opacity:0},
})
liveRewind.ShowTitleInitial.states.animationOptions = {
  curve: curve1
}

# Show Title - Rewinding
liveRewind.ShowTitleRewinding.states.add({
    engaged: {opacity:1},
    dismiss: {opacity:0}
})
liveRewind.ShowTitleRewinding.states.animationOptions = {
  curve: "ease-in-out",
  time: 0.3
}

# Show Title - Live
liveRewind.ShowTitleEngaged.states.add({
    engaged: {opacity:1}
})
liveRewind.ShowTitleEngaged.states.animationOptions = {
  curve: "linear",
  time: 0.1
}

# Live Rewind Label
liveRewind.LiveRewindLabel.states.add({
    initial: {scale:1, opacity:1, curve: curve1},
    press:   {scale: 0.98, curve: curve1},
    dismiss: {scale:0, opacity:0},
})
liveRewind.LiveRewindLabel.states.animationOptions = {
  curve: curve1
}

# Pause Button
liveRewind.PauseBtn.states.add({
    engaged: {opacity:1},
    press: {scale: 0.95, curve: curve1}
})
liveRewind.PauseBtn.states.animationOptions = {
  curve: "ease-out",
  time: 0.25
}

# Pause Button Rectangles
liveRewind.PauseRects.states.add({
    engaged: {scale:1, opacity:1}
})
liveRewind.PauseRects.states.animationOptions = {
  curve: curve2
}

# Spinner
liveRewind.Spinner.states.add({
    engaged: {opacity: 1},
    dismiss: {opacity: 0}
})
liveRewind.Spinner.states.animationOptions = {
  curve: "ease-out",
  time: 0.4
}

# UI Divider
liveRewind.DividerProgress.states.add({
    engaged: {width:612, x: 14}
})
liveRewind.DividerProgress.states.animationOptions = {
  curve: "ease-out",
  time: 0.25
}

# Orange Progress Bar
liveRewind.Progress.states.add({
    engaged: {width:612}
})
liveRewind.Progress.states.animationOptions = {
  curve: "ease-in-out",
  time: 11
}


###############################
# Trigger animations
###############################

# Make play button respond to touch
liveRewind.LiveRewindLabel.on Events.TouchStart, ->
  liveRewind.LiveRewindLabel.states.switch("press")
  
# Kick off preroll animation sequence    
liveRewind.LiveRewindLabel.on Events.TouchEnd, ->
  liveRewind.LiveRewindLabel.states.switch("initial")
  # Play button pressed: load preroll and drop into live stream
  liveRewind.ShowTIle.states.switch("blur")
  liveRewind.ShowTitleInitial.states.switch("dismiss")
  liveRewind.PlayBtn.states.switch("dismiss")
  liveRewind.LiveRewindLabel.states.switch("dismiss")
  liveRewind.Spinner.states.switch("engaged")
  liveRewind.ShowTitleRewinding.states.switch("engaged")
  liveRewind.DividerProgress.animate 
    properties:
      width:612
      x:14
    time: 0.25
	curve: "ease-out"
	
	liveRewind.DividerProgress.on Events.AnimationEnd, ->
	  setTimeout ( ->
	  	liveRewind.Progress.animate
	      properties:
	          width:10
	      curve: "ease-out",
	      time: 0.3
	  	liveRewind.ShowTIle.states.switch("initial")
	  	liveRewind.ShowTitleRewinding.opacity = 0
	  	liveRewind.ShowTitleEngaged.opacity = 1
	  	liveRewind.PauseBtn.states.switch("engaged")
	  	liveRewind.PauseRects.states.switch("engaged")
	  	liveRewind.Spinner.states.switch("dismiss")
	  	document.getElementById("stream").play()
	  ), 3500
	