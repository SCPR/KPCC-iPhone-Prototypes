# Import all the layers for "home" into `home` var
home = Framer.Importer.load "imported/home"

###############################
# Set up device attributes
###############################

# Set canvas BG image
Framer.Device.background.image = "http://a.scpr.org/i/7a376d4259ccd459d68495f8ee6f7e0f/86185-full.jpg"


###############################
# Set up initial layer states
###############################

home.AdUnit.y = -500
home.AdProgress.width = 0
home.ShowTitleEngaged.opacity = 0
home.ShowTitlePaused.opacity = 0
home.DividerProgress.width = 0
home.DividerProgress.x = 320
home.Progress.width = 0
home.PauseBtn.y = 1300
home.PlayBtnSmall.y = 1300


###############################
# Set some animation styles
###############################

curve1 = "spring(200,20,30)"
curve2 = "spring(130,20,10)"


###############################
# Establish states for layers
###############################

# Program Tile Image BG
home.ShowTIle.states.add({
    blur: {blur:20, brightness:60, scale:1.0},
    initial: {blur:0, brightness:100, scale:1},
})
home.ShowTIle.states.animationOptions = {
	curve: "linear",
	time: 0.3
}

# Show Title - On Now
home.ShowTitleInitial.states.add({
    initial: {scale:1, opacity:1},
    dismiss: {scale:0, opacity:0},
})
home.ShowTitleInitial.states.animationOptions = {
	curve: curve1
}

# Show Title - Live
home.ShowTitleEngaged.states.add({
    engaged: {opacity:1}
})
home.ShowTitleEngaged.states.animationOptions = {
	curve: "ease-in-out",
	time: 0.6
}

# Default State Play Button
home.PlayBtn.states.add({
    initial: {scale:1, opacity:1, curve: curve1},
    press:   {scale: 0.95, curve: curve1},
    dismiss: {scale:0, opacity:0},
})
home.PlayBtn.states.animationOptions = {
	curve: curve1
}

# 300x250 Ad Unit
home.AdUnit.states.add({
    initial: {y:-500},
    preroll: {y:150},
})
home.AdUnit.states.animationOptions = {
	curve: "ease-out",
	time: 0.25
}

# Ad Progress Bar
home.AdProgress.states.add({
    engaged: {width:600}
})
home.AdProgress.states.animationOptions = {
	curve: "linear",
	time: 11
}

# Pause Button
home.PauseBtn.states.add({
    engaged: {y:802},
    press: {scale: 0.95, curve: curve1},
})
home.PauseBtn.states.animationOptions = {
	curve: "ease-out",
	time: 0.25
}

# Small Play Button
home.PlayBtnSmall.states.add({
    initial: {scale:1, opacity:1, curve: curve1},
    press:   {scale: 0.95, curve: curve1}
})
home.PlayBtnSmall.states.animationOptions = {
	curve: curve1
}

# UI Divider
home.DividerProgress.states.add({
    engaged: {width:612, x: 14}
})
home.DividerProgress.states.animationOptions = {
	curve: "ease-out",
	time: 0.25
}

# Orange Progress Bar
home.Progress.states.add({
    engaged: {width:612}
})
home.Progress.states.animationOptions = {
	curve: "ease-in-out",
	time: 11
}


###############################
# Trigger animations
###############################

# Make play button respond to touch
home.PlayBtn.on Events.TouchStart, ->
  home.PlayBtn.states.switch("press")
  
# Kick off preroll animation sequence    
home.PlayBtn.on Events.TouchEnd, ->
  home.PlayBtn.states.switch("initial")
  # Play button pressed: load preroll and drop into live stream
  home.ShowTIle.states.switch("blur")
  home.ShowTitleInitial.states.switch("dismiss")
  home.PlayBtn.states.switch("dismiss")
  home.AdUnit.states.switch("preroll")
  home.PauseBtn.states.switch("engaged")
  home.DividerProgress.states.switch("engaged")
  document.getElementById("preroll").play()
  home.AdProgress.states.switch("engaged")
  home.AdProgress.animate 
    properties:
        width:600
        time: 11
	curve: "linear"

	home.AdProgress.on Events.AnimationEnd, ->
	  home.Progress.animate
	      properties:
	          width:100
	      curve: "ease-out",
	      time: 0.4
	  home.AdProgress.opacity = 0
	  home.AdUnit.states.switch("initial")
	  home.ShowTIle.states.switch("initial")
	  home.ShowTitleEngaged.states.switch("engaged")
	  document.getElementById("stream").play()
  
  
# Make pause button respond to touch
home.PauseBtn.on Events.TouchStart, ->
  home.PauseBtn.states.switch("press")
  
home.PauseBtn.on Events.TouchEnd, ->
  home.PauseBtn.y = 1300
  home.PlayBtnSmall.y = 802
  home.ShowTitleEngaged.opacity = 0
  home.ShowTitlePaused.opacity = 1
  document.getElementById("preroll").pause()
  document.getElementById("stream").pause()
  
# Make small play button respond to touch
home.PlayBtnSmall.on Events.TouchStart, ->
  home.PlayBtnSmall.states.switch("press")
  
home.PlayBtnSmall.on Events.TouchEnd, ->
  home.PauseBtn.y = 802
  home.PlayBtnSmall.y = 1300
  home.ShowTitleEngaged.opacity = 1
  home.ShowTitlePaused.opacity = 0
  document.getElementById("stream").play()