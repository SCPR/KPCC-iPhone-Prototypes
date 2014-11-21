# This imports all the layers for "onboarding" into onboardingLayers
onboarding = Framer.Importer.load "imported/onboarding"

# Create layer for SVG animation
onboarding.Spinner = new Layer()
onboarding.Spinner.backgroundColor = "transparent"
onboarding.Spinner.x = 227
onboarding.Spinner.y = 795
onboarding.Spinner.width = 184
onboarding.Spinner.height = 184
onboarding.Spinner.html = "<svg class='spinner' width='188px' height='188px' viewBox='0 0 66 66' xmlns='http://www.w3.org/2000/svg'><circle class='path' fill='none' stroke-width='1' stroke-linecap='round' cx='33' cy='33' r='30'></circle></svg>"


###############################
# Set up device attributes
###############################

# Set canvas BG image
Framer.Device.background.image = "http://a.scpr.org/i/7a376d4259ccd459d68495f8ee6f7e0f/86185-full.jpg"


###############################
# Set some animation styles
###############################

curve1 = "spring(200,20,30)"
curve2 = "spring(130,20,10)"


###############################
# Set up common functions
###############################
Layer::fadeOut = ->
    this.animate
        properties: 
            opacity: 0
            scale: 0
        curve: curve1
 
 Layer::fadeOutSlow = ->
    this.animate
        properties: 
            opacity: 0
        curve: curve2

Layer::fadeInFast = ->
    this.animate
        properties: 
            opacity: 1
        curve: 'ease-out'
        time: 0.2
        
Layer::fadeInSlow = ->
    this.animate
        properties: 
            opacity: 1
        curve: 'ease-out'
        time: 0.5
        
Layer::springIn = ->
    this.animate
        properties: 
            opacity: 1
            scale: 1
        curve: curve1

Layer::springOut = ->
    this.animate
        properties: 
            opacity: 0
            scale: 0
        curve: curve2
        
        
###############################
# Set up initial layer states
###############################

# Create Parent Layer for Push Ask
onboarding.pushCanvas = new Layer
  x:0, y:0, width:640, height:1136, backgroundColor: "transparent", opacity: 0, scale: 0

# Make layers subLayers of pushCanvas
onboarding.pushCanvas.addSubLayer(onboarding.PushAsk)
onboarding.pushCanvas.addSubLayer(onboarding.PushBtnYes)
onboarding.pushCanvas.addSubLayer(onboarding.PushBtnNo)

# Onboarding BG Tile
onboarding.ShowTile.blur = 20
onboarding.ShowTile.brightness = 10
onboarding.ShowTileDupe.brightness = 10

# Welcome elements
onboarding.WelcomeLogo.opacity = 0
onboarding.WelcomeLogo.y = 100
onboarding.WelcomeCopy.opacity = 0
onboarding.WelcomeCopy.y = 354
onboarding.WelcomeDivider.x = 320
onboarding.WelcomeDivider.width = 0
onboarding.WelcomePlayLabel.opacity = 0
onboarding.WelcomePlayBtnCircle.scale = 0
onboarding.WelcomePlayBtnTriangle.opacity = 0

# Player elements
onboarding.PauseBtn.opacity = 0
onboarding.TrackProgress.width = 0
onboarding.DividerProgress.width = 0
onboarding.DividerProgress.x = 320
onboarding.ShowTitle.opacity = 0

# Rewind Onboarding elements
onboarding.Spinner.opacity = 0
onboarding.HintRewind.width = 0
onboarding.LensRewind.opacity = 0
onboarding.LensRewind.scale = 0
onboarding.RewindLabel.opacity = 0
onboarding.RewindBtn.opacity = 0

# NavBar elements
onboarding.NavBar.height = 0
onboarding.NavBarTitle.opacity = 0
onboarding.StatusBar.opacity = 0

# Menu Onboarding elements
onboarding.NavBarMenuTop.opacity = 0
onboarding.NavBarMenuMiddle.opacity = 0
onboarding.NavBarMenuBottom.opacity = 0
onboarding.NavBarMenuTop.scale = 0
onboarding.NavBarMenuMiddle.scale = 0
onboarding.NavBarMenuBottom.scale = 0
onboarding.LensMenu.opacity = 0
onboarding.LensMenu.scale = 0
onboarding.Menu.y = -605
onboarding.StatusBar.opacity = 0
onboarding.HighlightPrograms.opacity = 0
onboarding.HighlightHeadlines.opacity = 0
onboarding.LensPrograms.opacity = 0
onboarding.LensPrograms.scale = 0
onboarding.LensHeadlines.opacity = 0
onboarding.LensHeadlines.scale = 0

# Push Onboarding elements
onboarding.HintPush.opacity = 0
onboarding.AlertPush.opacity = 0


###############################
# Establish states for layers
###############################

# Program Tile Image BG
onboarding.ShowTile.states.add({
    blur: {blur:20, brightness:60, scale:1},
    infocus: {blur:0, brightness:100, scale:1}
})
onboarding.ShowTile.states.animationOptions = {
  curve: "ease-out",
  time: 1
}

# Welcome Play Button Circle
onboarding.WelcomePlayBtnCircle.states.add({
    initial: {scale:1, opacity:1, curve: curve1},
    press:   {scale: 0.95, curve: curve1},
    dismiss: {scale:0, opacity:0},
})
onboarding.WelcomePlayBtnCircle.states.animationOptions = {
  curve: curve1
}

# Welcome Play Button Triangle
onboarding.WelcomePlayBtnTriangle.states.add({
    initial: {scale:1, opacity:1, curve: curve1},
    press:   {scale: 0.95, curve: curve1},
    dismiss: {scale:0, opacity:0},
})
onboarding.WelcomePlayBtnTriangle.states.animationOptions = {
  curve: curve1
}

# Show Title
onboarding.ShowTitle.states.add({
    initial: {opacity:1},
    dismiss: {opacity:0},
})
onboarding.ShowTitle.states.animationOptions = {
  curve: curve1
}

# Pause Button
onboarding.PauseBtn.states.add({
    initial: {opacity:1},
    dismiss: {opacity:0},
})
onboarding.PauseBtn.states.animationOptions = {
  curve: curve1
}

# Rewind Button
onboarding.RewindBtn.states.add({
    initial: {scale:1, opacity:1, curve: curve1},
    press:   {scale: 0.95, curve: curve1},
    dismiss: {scale:0, opacity:0},
})
onboarding.RewindBtn.states.animationOptions = {
  curve: curve1
}

# Rewinding Label
onboarding.RewindLabel.states.add({
    engaged: {opacity:1},
    dismiss: {opacity:0}
})
onboarding.RewindLabel.states.animationOptions = {
  curve: "ease-in-out",
  time: 0.3
}

# Lens Menu
onboarding.LensMenu.states.add({
    initial: {scale:1, opacity:1, curve: curve1},
    press:   {scale: 0.9, curve: curve1},
    dismiss: {scale:0, opacity:0},
})
onboarding.LensMenu.states.animationOptions = {
  curve: curve1
}

# Rewind Lens
onboarding.LensRewind.states.add({
    initial: {scale:1, opacity:1, curve: curve1},
    press:   {scale: 0.9, curve: curve1},
    dismiss: {scale:0, opacity:0},
})
onboarding.LensRewind.states.animationOptions = {
  curve: curve1
}

# Spinner
onboarding.Spinner.states.add({
    engaged: {opacity: 1},
    dismiss: {opacity: 0}
})
onboarding.Spinner.states.animationOptions = {
  curve: "ease-out",
  time: 0.4
}

# UI Divider
onboarding.DividerProgress.states.add({
    engaged: {opacity: 1, width:612, x: 14},
    initial: {opacity:1},
    dismiss: {opacity:0}
})
onboarding.DividerProgress.states.animationOptions = {
  curve: "ease-out",
  time: 0.2
}

# TrackProgress
onboarding.TrackProgress.states.add({
    initial: {opacity:1},
    dismiss: {opacity:0},
})
onboarding.TrackProgress.states.animationOptions = {
  curve: curve1
}

# Hamburger Top
onboarding.NavBarMenuTop.states.add({
    initial: {y:63, rotation:0, originX:0, originY:0},
    engaged: {y:61, rotation:45, originX:0, originY:0},
})
onboarding.NavBarMenuTop.states.animationOptions = {
  curve: curve1
}

# Hamburger Middle
onboarding.NavBarMenuMiddle.states.add({
    initial: {opacity:1},
    engaged: {opacity:0},
})
onboarding.NavBarMenuMiddle.states.animationOptions = {
  curve: curve1
}

# Hamburger Bottom
onboarding.NavBarMenuBottom.states.add({
    initial: {y: 89, rotation:0, originX:0, originY:1},
    engaged: {y:94, rotation:-45, originX:0, originY:1},
})
onboarding.NavBarMenuBottom.states.animationOptions = {
  curve: curve1
}

# Menu TableView
onboarding.Menu.states.add({
  initial: {y:-605},
  engaged: {y:184},
})
onboarding.Menu.states.animationOptions = {
  curve: "ease-in-out",
  time: 0.3
}

# Programs Highlight
onboarding.HighlightPrograms.states.add({
    active: {opacity:1},
    inactive: {opacity:0},
})
onboarding.HighlightPrograms.states.animationOptions = {
  curve: curve1
}

# Headlines Highlight
onboarding.HighlightHeadlines.states.add({
    active: {opacity:1},
    inactive: {opacity:0},
})
onboarding.HighlightHeadlines.states.animationOptions = {
  curve: curve1
}

# Push Yes
onboarding.PushBtnYes.states.add({
    initial: {scale:1, opacity:1, curve: curve1},
    press:   {scale: 0.95, curve: curve1},
    dismiss: {scale:0, opacity:0},
})
onboarding.PushBtnYes.states.animationOptions = {
  curve: curve1
}

# Push No
onboarding.PushBtnNo.states.add({
    initial: {scale:1, opacity:1, curve: curve1},
    press:   {scale: 0.95, curve: curve1},
    dismiss: {scale:0, opacity:0},
})
onboarding.PushBtnNo.states.animationOptions = {
  curve: curve1
}

# Push Canvas
onboarding.pushCanvas.states.add({
    engaged: {scale:1, opacity:1, curve: curve2},
    dismiss: {scale:0, opacity:0},
})
onboarding.pushCanvas.states.animationOptions = {
  curve: curve2
}

# Push Alert
onboarding.AlertPush.states.add({
    engaged: {opacity:1},
    dismiss: {opacity:0},
})
onboarding.AlertPush.states.animationOptions = {
  curve: curve2
}

# Push Hint
onboarding.HintPush.states.add({
    engaged: {opacity:1},
    dismiss: {opacity:0},
})
onboarding.HintPush.states.animationOptions = {
  curve: curve2
}

###############################
# Trigger animations
###############################

# Make play button respond to touch
onboarding.WelcomePlayBtnCircle.on Events.TouchStart, ->
  onboarding.WelcomePlayBtnCircle.states.switch("press")
  onboarding.WelcomePlayBtnTriangle.states.switch("press")

# Make Push Notifications "Yes" button respond to touch
onboarding.PushBtnYes.on Events.TouchStart, ->
  onboarding.PushBtnYes.states.switch("press")

# Make Push Notifications "No" button respond to touch
onboarding.PushBtnNo.on Events.TouchStart, ->
  onboarding.PushBtnNo.states.switch("press")

# Opening Welcome Sequence  
# Add a cosmetic 1-sec delay for testing purposes
Utils.delay 1, -> 
  
  onboarding.ShowTile.animate
    properties:
      brightness: 80
    time: 0.75
    curve: "ease-in-out"
  onboarding.ShowTileDupe.animate
    properties:
      brightness: 80
    time: 0.75
    curve: "ease-in-out"
  
  # wait 0.4 secs after BG has faded in, then kick off the next sequence
  Utils.delay 0.4, -> 
    onboarding.WelcomeDivider.animate
      properties:
        width: 380
        x: 130
      time: 0.25
      curve: "ease-out"
    
    onboarding.WelcomeLogo.animate
      properties:
        opacity: 1 
        y: 172
      time: 0.25
      curve: curve2
    
    onboarding.WelcomeCopy.animate
      properties:
        opacity: 1 
        y: 282
      time: 0.25
      curve: curve2
    
    Utils.delay 1.5, ->
      onboarding.WelcomePlayBtnCircle.animate
        properties:
          scale: 1
        time: 0.25
        curve: curve2
      
      Utils.delay 0.1, ->
        onboarding.WelcomePlayBtnTriangle.animate
          properties:
            opacity: 1 
          time: 0.8
          curve: "ease-in-out"
          
        onboarding.WelcomePlayLabel.animate
          properties:
            opacity: 1 
          time: 0.8
          curve: "ease-in-out"
        
        
# Kick off onboarding steps    
onboarding.WelcomePlayBtnCircle.on Events.TouchEnd, ->
  onboarding.WelcomePlayBtnCircle.states.switch("initial")
  onboarding.WelcomePlayBtnTriangle.states.switch("initial")
  
  onboarding.ShowTile.states.switch("infocus")
  onboarding.WelcomeCopy.fadeOut()
  onboarding.WelcomePlayLabel.fadeOut()
  onboarding.WelcomePlayBtnTriangle.fadeOut()
  onboarding.WelcomePlayBtnCircle.fadeOut()
  onboarding.WelcomeCopy.fadeOut()
  onboarding.WelcomeLogo.fadeOut()
  onboarding.WelcomeDivider.fadeOut()
  
  onboarding.DividerProgress.states.switch("engaged")
  onboarding.NavBar.animate
    properties:
      height: 119
    curve: curve2
  
  Utils.delay 0.3, ->
    onboarding.ShowTitle.fadeInSlow()
    onboarding.PauseBtn.fadeInSlow()
    onboarding.NavBarTitle.fadeInSlow()
    onboarding.StatusBar.fadeInSlow()
    onboarding.TrackProgress.animate
      properties:
        width: 150
      time:10
      curve: "linear"
    Utils.delay 10, ->
      onboarding.RewindBtn.animate
        properties:
          opacity: 1 
        time: 0.4
        curve: "ease-in-out"

    
    Utils.delay 12, ->
      onboarding.RewindBtn.states.switch("press")
      onboarding.LensRewind.states.switch("press")
      
      Utils.delay 0.3, ->
        onboarding.RewindBtn.states.switch("initial")
        onboarding.LensRewind.states.switch("initial")
        onboarding.LensRewind.springOut()
        onboarding.RewindBtn.fadeOut()
        onboarding.RewindLabel.states.switch("engaged")
        onboarding.Spinner.states.switch("engaged")
        onboarding.ShowTile.states.switch("blur")
        onboarding.PauseBtn.states.switch("dismiss")
        onboarding.TrackProgress.animate
          properties:
            width: 10
          time: 2.5
          curve: "linear"
                  
        Utils.delay 2.5, ->
          onboarding.LensRewind.y = -120
          onboarding.RewindLabel.states.switch("dismiss")
          onboarding.Spinner.states.switch("dismiss")
          onboarding.ShowTile.states.switch("infocus")
          onboarding.PauseBtn.states.switch("initial")
          onboarding.TrackProgress.animate
            properties:
              width: 250
            time: 10
            curve: "linear"
            
          Utils.delay 8, ->
            onboarding.NavBarMenuTop.springIn()
            onboarding.NavBarMenuMiddle.springIn()
            onboarding.NavBarMenuBottom.springIn()
            onboarding.LensMenu.springIn()
            
            Utils.delay 1, ->
              onboarding.LensMenu.states.switch("press")
              Utils.delay 0.3, ->
                onboarding.LensMenu.states.switch("initial")
                onboarding.ShowTile.states.switch("blur")
                onboarding.PauseBtn.states.switch("dismiss")
                onboarding.DividerProgress.states.switch("dismiss")
                onboarding.TrackProgress.states.switch("dismiss")
                onboarding.ShowTitle.states.switch("dismiss")
                onboarding.NavBarMenuTop.states.switch("engaged")
                onboarding.NavBarMenuMiddle.states.switch("engaged")
                onboarding.NavBarMenuBottom.states.switch("engaged")
                Utils.delay 0.1, ->
                  onboarding.Menu.states.switch("engaged")
                  onboarding.LensMenu.springOut()
          
          
  Utils.delay 27, ->
	  onboarding.LensPrograms.springIn()
	  onboarding.HighlightPrograms.states.switch("active")
	  Utils.delay 2, ->
	    onboarding.LensPrograms.springOut()
	    onboarding.HighlightPrograms.states.switch("inactive")
	    Utils.delay 1, ->
	      onboarding.LensHeadlines.springIn()
	      onboarding.HighlightHeadlines.states.switch("active")
	      Utils.delay 2, ->
	        onboarding.LensHeadlines.springOut()
	        onboarding.HighlightHeadlines.states.switch("inactive")
	        Utils.delay 2, ->
	          onboarding.Menu.states.switch("initial")
	          Utils.delay 0.1, ->
	            onboarding.ShowTile.states.switch("infocus")
	            onboarding.PauseBtn.states.switch("initial")
	            onboarding.DividerProgress.states.switch("engaged")
	            onboarding.TrackProgress.states.switch("initial")
	            onboarding.TrackProgress.width = 400
	            onboarding.ShowTitle.states.switch("initial")
	            onboarding.NavBarMenuTop.states.switch("initial")
	            onboarding.NavBarMenuMiddle.states.switch("initial")
	            onboarding.NavBarMenuBottom.states.switch("initial")
	            Utils.delay 0.4, ->
	            	onboarding.NavBarMenuTop.springOut()
	            	onboarding.NavBarMenuMiddle.springOut()
	            	onboarding.NavBarMenuBottom.springOut()
		        	onboarding.TrackProgress.animate
		            	properties:
		            		width: 500
		            	time: 7
		            	curve: "linear"
		          	Utils.delay 7, ->
		          		onboarding.ShowTile.states.switch("blur")
		          		onboarding.PauseBtn.states.switch("dismiss")
		          		onboarding.DividerProgress.states.switch("dismiss")
		          		onboarding.TrackProgress.states.switch("dismiss")
		          		onboarding.ShowTitle.states.switch("dismiss")
		          		Utils.delay 0.3, ->
		          			onboarding.pushCanvas.states.switch("engaged")
            
onboarding.PushBtnYes.on Events.TouchEnd, ->
	onboarding.PushBtnYes.states.switch("initial")
	Utils.delay 0.2, ->
		onboarding.pushCanvas.states.switch("dismiss")
		Utils.delay 0.2, ->
			onboarding.AlertPush.states.switch("engaged")
			onboarding.HintPush.states.switch("engaged")

onboarding.AlertPush.on Events.TouchEnd, ->
	onboarding.AlertPush.states.switch("dismiss")
	onboarding.HintPush.states.switch("dismiss")
	onboarding.ShowTile.states.switch("infocus")
	onboarding.PauseBtn.states.switch("initial")
	onboarding.DividerProgress.states.switch("engaged")
	onboarding.TrackProgress.states.switch("initial")
	onboarding.ShowTitle.states.switch("initial")
	onboarding.TrackProgress.animate
         	properties:
         		width: 610
         	time: 4
         	curve: "linear"
    Utils.delay 4, ->
    	onboarding.PauseBtn.opacity = 0
		onboarding.TrackProgress.fadeOutSlow()
		onboarding.DividerProgress.fadeOutSlow()
		onboarding.ShowTile.fadeOutSlow()
		onboarding.ShowTileDupe.fadeOutSlow()
		onboarding.ShowTitle.fadeOutSlow()
		onboarding.NavBar.fadeOutSlow()
		onboarding.NavBarTitle.fadeOutSlow()
		onboarding.StatusBar.fadeOutSlow()

onboarding.PushBtnNo.on Events.TouchEnd, ->
	onboarding.PushBtnNo.states.switch("initial")

onboarding.TrackProgress.on Events.AnimationEnd, ->
  onboarding.LensRewind.springIn()