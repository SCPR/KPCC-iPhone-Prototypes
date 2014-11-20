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
onboarding.LensHeadlines.opacity = 0

# Push Onboarding elements
onboarding.HintPush.opacity = 0
onboarding.AlertPush.opacity = 0
onboarding.PushBtnYes.opacity = 0
onboarding.PushBtnNo.opacity = 0
onboarding.PushAsk.opacity = 0


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
    engaged: {width:612, x: 14}
})
onboarding.DividerProgress.states.animationOptions = {
  curve: "ease-out",
  time: 0.2
}


###############################
# Trigger animations
###############################

# Make play button respond to touch
onboarding.WelcomePlayBtnCircle.on Events.TouchStart, ->
  onboarding.WelcomePlayBtnCircle.states.switch("press")
  onboarding.WelcomePlayBtnTriangle.states.switch("press")

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
			
			Utils.delay 0.3, ->
				onboarding.RewindBtn.states.switch("initial")
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
					onboarding.LensRewind.y = -100
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
						
						Utils.delay 1, ->
							onboarding.LensMenu.springIn()
					
onboarding.TrackProgress.on Events.AnimationEnd, ->
	onboarding.LensRewind.springIn()