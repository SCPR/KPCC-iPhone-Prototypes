# This imports all the layers for "ProgramSchedule" into programscheduleLayers
programSchedule = Framer.Importer.load "imported/ProgramSchedule"

###############################
# Set up device attributes
###############################

# Set canvas BG image
Framer.Device.background.image = "http://a.scpr.org/i/7a376d4259ccd459d68495f8ee6f7e0f/86185-full.jpg"

programSchedule.NavbarMask.z = 400


###############################
# Establish states for layers
###############################

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

###############################
# Set up initial layer states
###############################


# This page component holds the horizontally aligned pages
page = new PageComponent
  y: 0
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
    superLayer: page.content,
    backgroundColor: "transparent"
    
# Define second page
pageTwo = new Layer
    width: page.width,
    height: page.height,
    backgroundColor: "transparent"

# Add the second page to the right  
page.addPage(pageTwo, "right")

# Places the page component behind the navigationbar
page.placeBehind(programSchedule.Navbar)
programSchedule.NavbarMask.bringToFront()


programSchedule.ShowTitle.superLayer = pageOne
programSchedule.PauseBtn.superLayer = pageOne
programSchedule.DividerProgress.superLayer = pageOne
programSchedule.Divider.superLayer = pageOne
programSchedule.LiveLabel.superLayer = pageOne

programSchedule.UpNextLabel.superLayer = pageTwo
programSchedule.NextShow.superLayer = pageTwo
programSchedule.TImeline.superLayer = pageTwo
programSchedule.BtnFullSchedule.superLayer = pageTwo
programSchedule.ScheduleLabel.superLayer = pageTwo
page.superLayer = programSchedule.Live_Player

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
	programSchedule.Divider.states.switch("initial")
  	
page.on "change:currentPage", (currentPage) ->
  currentPageIndex = page.horizontalPageIndex(currentPage)
  index = 0
  
  if currentPageIndex == index
  	programSchedule.BGTile.states.switch("initial")
  else
  	programSchedule.BGTile.states.switch("blur")
  