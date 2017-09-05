# Adds prefix to all PNG files within folder specified
gci "C:\Training Slides" -Filter *.png | Rename-Item  -NewName { "300.PEK-" + $_.Name }
