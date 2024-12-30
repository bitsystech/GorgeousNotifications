#!/bin/sh

currentUser=$(stat -f '%Su' /dev/console)
##FreeSpace=$( /usr/sbin/diskutil info / | /usr/bin/grep  -E 'Free Space|Available Space|Container Free Space' | /usr/bin/awk -F ":\s*" '{ print $2 }' | awk -F "(" '{ print $1 }' | xargs)

# Get the macOS version
macos_version=$(sw_vers -productVersion)
 
# Convert macOS version to a format suitable for comparison
macos_version_numeric=$(echo $macos_version | awk -F '.' '{ printf("%d.%d\n", $1, $2); }')
 

# Define our file pathszxcgg hj
dialogPath="/usr/local/bin/dialog"
bannerPath="/usr/local/Utils/eol-macs.png"

# Define our messaging for this proof of concept
dialogTitle="It's time to replace your Mac"
dialogMessage="Dear Mac User, <br>  <br> This Mac has done a great job serving us for more than 5 years and it's time we should let it retire now. 🙂 <br>Kindly order a new Mac by asking your PMO to submit hardware request.  <br> <br>It's a good idea to backup your files to OneDrive so you can download them when a new Mac is assigned to you.  <br> <br> ❤️ Mac Team" 




# Now lets draw our actual dialog window. I use backslashes to make this more readable

sualertMBA () {
$dialogPath \
--bannerimage "$bannerPath" \
--title "" \
--message "$dialogMessage" \
--messagefont "size=14" \
--alignment "left" \
--width 620 \
--height 320 \
--button1text "Open Self Service" \
--button1action "https://onboarding.bitsystechnologies.com/cat=df03se972a0ddud893ndjkd" \
--button2text "I'll do later" \

}


sualertMBP () {
$dialogPath \
--bannerimage "$bannerPath" \
--title "" \
--message "$dialogMessage" \
--messagefont "size=14" \
--alignment "left" \
--width 620 \
--height 320 \
--button1text "Open Self Service" \
--button1action "https://onboarding.bitsystechnologies.com/cat=df03se972a0ddud893ndjkd" \
--button2text "I will do later" \

}




sualertMac () {
$dialogPath \
--bannerimage "$bannerPath" \
--title "" \
--message "$dialogMessage" \
--messagefont "size=14" \
--alignment "left" \
--iconsize "160" \
--width 620 \
--height 320 \
--button1text "Open Self Service" \
--button1action "https://onboarding.bitsystechnologies.com/cat=df03se972a0ddud893ndjkd" \
--button2text "I'll do later" \

}



# Get the model name
model_name=$(system_profiler SPHardwareDataType | grep "Model Name" | awk -F ": " '{print $2}')

# Check if it's a MacBook Pro or MacBook Air
if [[ "$model_name" == *"MacBook Pro"* ]]; then
    echo "This is a MacBook Pro."
    sualertMBP
elif [[ "$model_name" == *"MacBook Air"* ]]; then
    echo "This is a MacBook Air."
    sualertMBA
else
    echo "This is neither a MacBook Pro nor a MacBook Air."
    sualertMac
fi