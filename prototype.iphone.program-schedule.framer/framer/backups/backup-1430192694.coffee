# This imports all the layers for "ProgramSchedule" into programscheduleLayers
programSchedule = Framer.Importer.load "imported/ProgramSchedule"

###############################
# Set up device attributes
###############################

# Set canvas BG image
Framer.Device.background.image = "http://a.scpr.org/i/7a376d4259ccd459d68495f8ee6f7e0f/86185-full.jpg"

# set up button hotspot shapes
FullScheduleBtn = new Layer
	width: 393
	height: 63
	x: 121
	y: 1010

BackBtn = new Layer
	width: 93
	height: 80
	x: 10
	y: 40
	
# hide hotspots by default
FullScheduleBtn.sendToBack()
BackBtn.sendToBack()

# Draw Menu Icon
MenuIconTop = new Layer
	width: 46
	height: 2
	x: 30
	y: 64
	backgroundColor: "#fff"
	originX:  0
	
MenuIconMiddle = new Layer
	width: 46
	height: 2
	x: 30
	y: 77
	backgroundColor: "#fff"

MenuIconBottom = new Layer
	width: 46
	height: 2
	x: 30
	y: 90
	backgroundColor: "#fff"
	originX:  0

###############################
# Set up initial layer states
###############################

programSchedule.ScheduleLabel.opacity = 0
programSchedule.Live_Player.width = 640

###############################
# Set some animation styles
###############################

curve1 = "spring(200,20,30)"
curve2 = "spring(130,20,10)"
curve3 = "spring(200,20,15)"

###############################
# Establish states for layers
###############################

MenuIconBottom.states.add({
	initial: { width: 46, rotation: 0, y: 90},
	engaged: { width: 23, rotation: 45, y: 77 }
})
MenuIconBottom.states.animationOptions = {
	curve: curve3
}

MenuIconTop.states.add({
	initial: { width: 46, rotation: 0, y: 64},
	engaged: { width: 23, rotation: -45, y: 77 }
})
MenuIconTop.states.animationOptions = {
	curve: curve3
}

# Program Tile Image BG
programSchedule.BGTile.states.add({
    blur: {blur:20, brightness:80, scale:1.02},
    initial: {blur:0, brightness:100, scale:1}
})
programSchedule.BGTile.states.animationOptions = {
	curve: "linear",
	time: 0.3
}

# UI Divider/Timeline
programSchedule.Divider.states.add({
	expanded: {width: 640, x: 0},
	initial: {width: 612, x: 14}
})
programSchedule.Divider.states.animationOptions = {
	curve: "linear",
	time: 0.05
}

# Program Tile Image BG
programSchedule.BtnFullSchedule.states.add({
    press: {scale:0.95},
    initial: {scale:1}
})
programSchedule.BtnFullSchedule.states.animationOptions = {
	curve: curve1
}

programSchedule.ScheduleLabel.states.add ({
	hidden: {opacity:0},
	visible: {opacity:1}
})
programSchedule.ScheduleLabel.states.animationOptions = {
	curve: "linear",
	time: 0.15
}

programSchedule.LiveLabel.states.add ({
	hidden: {opacity:0},
	visible: {opacity:1}
})
programSchedule.LiveLabel.states.animationOptions = {
	curve: "linear",
	time: 0.15
}

###############################
# Set up initial layer states
###############################

# This page component holds the horizontally aligned pages
page = new PageComponent
  x: 0
  y: programSchedule.Navbar.height
  height: Screen.height
  width: Screen.width
  # The scroll direction is restricted to only allow for horizontal scrolling
  scrollVertical: false
  # The direction lock is enabled to only allow either horizontal or vertical scrolling
  directionLock: true
  style = {"z-index": 2}

# Define the first page
pageOne = new Layer
    width: page.width,
    height: page.height,
    y: programSchedule.Navbar.height * -1,
    superLayer: page.content,
    backgroundColor: "transparent"
    
# Define second page
pageTwo = new Layer
    width: page.width,
    height: page.height,
    backgroundColor: "transparent"
    
# Define third page
ScheduleTableView = new ScrollComponent({
    width: 640,
    height: 1015,
    scrollHorizontal: false,
    directionLock: true
})

pageThree = new Layer
    width: page.width,
    height: 2129,
    superLayer: ScheduleTableView.content,
    backgroundColor: "transparent",
    image: "images/FullSchedule.png"

# Add the second and third pages to the right  
page.addPage(pageTwo, "right")
page.addPage(ScheduleTableView, "right")

pageTwo.y = programSchedule.Navbar.height * -1

# Places the page component behind the navigationbar
page.placeBehind(programSchedule.Navbar)
programSchedule.NavbarMask.bringToFront()


programSchedule.ShowTitle.superLayer = pageOne
programSchedule.PauseBtn.superLayer = pageOne
programSchedule.DividerProgress.superLayer = pageOne
programSchedule.Divider.superLayer = pageOne

programSchedule.UpNextLabel.superLayer = pageTwo
programSchedule.NextShow.superLayer = pageTwo
programSchedule.TImeline.superLayer = pageTwo
programSchedule.BtnFullSchedule.superLayer = pageTwo
page.superLayer = programSchedule.Live_Player

###############################
# Trigger animations
###############################

# Make play button respond to touch
FullScheduleBtn.on Events.TouchStart, ->
  programSchedule.BtnFullSchedule.states.switch("press")
  
# Push into full Program Schedule view
FullScheduleBtn.on Events.Click, ->
  page.snapToPage(ScheduleTableView)
  programSchedule.BtnFullSchedule.states.switch("initial")
  
 # Push back into Up Next view
BackBtn.on Events.Click, ->
  page.snapToPage(pageTwo)
	  
# Set BG blur behavior
page.on Events.TouchStart, (event, currentPage) ->
  currentPageIndex = page.horizontalPageIndex(currentPage)
  index = 0
  
  programSchedule.Divider.states.switch("expanded")
  
  if currentPageIndex == index
  	programSchedule.BGTile.states.switch("initial")
  else
  	programSchedule.BGTile.states.switch("blur")
  	
  # Blur ProgramTile if we're swiping away from the live player
  programSchedule.BGTile.states.switch("blur")

page.on Events.TouchEnd, (event, currentPage) ->
	currentPageIndex = page.horizontalPageIndex(currentPage)
	index = 0
	
	if currentPageIndex == index
		programSchedule.Divider.states.switch("initial")
  	
page.on "change:currentPage", (currentPage) ->
  currentPageIndex = page.horizontalPageIndex(currentPage)
  index = 0
  
  if currentPageIndex == index
  	programSchedule.BGTile.states.switch("initial")
  else if currentPageIndex == index + 1
  	FullScheduleBtn.bringToFront()
  	BackBtn.sendToBack()
  	MenuIconTop.states.switch("initial")
  	MenuIconBottom.states.switch("initial")
  	programSchedule.LiveLabel.states.switch("visible")
  	programSchedule.ScheduleLabel.states.switch("hidden")
  else
  	programSchedule.BGTile.states.switch("blur")
  	FullScheduleBtn.sendToBack()
  	BackBtn.bringToFront()
  	MenuIconTop.states.switch("engaged")
  	MenuIconBottom.states.switch("engaged")
  	programSchedule.LiveLabel.states.switch("hidden")
  	programSchedule.ScheduleLabel.states.switch("visible")
  