#!/bin/bash
# script to retrieve text hidden in an image using steghide

# in case the receiver is a different person and doesn't have steghide installed
sudo apt-get -y steghide

read -p "Save your embedded jpeg image in Documents folder, and enter it's name. " image

# checking if the image exists in the folder and exit the script if not.
if [ ! -f "~/Documents/$image.jpg" ];
then
    echo "$0: Image not found. Please enter a valid image name next time. "
    exit 0
fi

steghide extract -sf $image.jpg
# enter the passphrase when prompted

clear
echo "Your secret is:

"
more secret.txt
rm secret.txt

echo "

You can trust me!

"
