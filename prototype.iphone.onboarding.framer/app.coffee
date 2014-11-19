# This imports all the layers for "onboarding" into onboardingLayers
onboarding = Framer.Importer.load "imported/onboarding"

# Create layer for SVG animation
onboarding.Spinner = new Layer()
onboarding.Spinner.backgroundColor = "transparent"
onboarding.Spinner.x = 226
onboarding.Spinner.y = 825
onboarding.Spinner.width = 184
onboarding.Spinner.height = 184
onboarding.Spinner.html = "<svg class='spinner' width='188px' height='188px' viewBox='0 0 66 66' xmlns='http://www.w3.org/2000/svg'><circle class='path' fill='none' stroke-width='1' stroke-linecap='round' cx='33' cy='33' r='30'></circle></svg>"


###############################
# Set up device attributes
###############################

# Set canvas BG image
Framer.Device.background.image = "http://a.scpr.org/i/7a376d4259ccd459d68495f8ee6f7e0f/86185-full.jpg"


###############################
# Set up initial layer states
###############################

# Onboarding BG Tile
onboarding.ShowTile.blur = 20
onboarding.ShowTile.brightness = 80
onboarding.ShowTile.scale = 1.1

# Player elements
onboarding.PauseBtn.opacity = 0
onboarding.TrackProgress.opacity = 0
onboarding.DividerProgress.opacity = 0
onboarding.ShowTitle.opacity = 0

# Rewind Onboarding elements
onboarding.Spinner.opacity = 0
onboarding.HintRewind.opacity = 0
onboarding.LensRewind.opacity = 0
onboarding.RewindLabel.opacity = 0
onboarding.RewindBtn.opacity = 0

# NavBar elements
onboarding.NavBar.opacity = 0
onboarding.NavBarTitle.opacity = 0
onboarding.StatusBar.opacity = 0

# Menu Onboarding elements
onboarding.NavBarMenuTop.opacity = 0
onboarding.NavBarMenuMiddle.opacity = 0
onboarding.NavBarMenuBottom.opacity = 0
onboarding.LensMenu.opacity = 0
onboarding.Menu.y = -600
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
# Set some animation styles
###############################

curve1 = "spring(200,20,30)"
curve2 = "spring(130,20,10)"


###############################
# Establish states for layers
###############################

# Program Tile Image BG
onboarding.ShowTile.states.add({
    blur: {blur:20, brightness:60, scale:1},
    infocus: {blur:0, brightness:100, scale:1},
    initialblur: {blur:20, brightness:80, scale:1}
})
onboarding.ShowTile.states.animationOptions = {
  curve: "linear",
  time: 0.4
}
