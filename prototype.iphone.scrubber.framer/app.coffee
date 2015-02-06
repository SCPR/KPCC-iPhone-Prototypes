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
scrubber.TrackProgressEngaged.opacity = 0
scrubber.TrackLengthEngaged.opacity = 0
scrubber.Forward30.opacity = 0
scrubber.Back30.opacity = 0