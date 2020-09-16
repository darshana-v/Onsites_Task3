#!/bin/bash
# script to hide text in an image using steghide


# installing steghide in case it's not already installed
sudo apt-get -y steghide

read -p "Enter only the name of jpeg image (without extension) to save the secret text after saving it in ~/Documents folder. " image

# check if the image exists in the folder and exit the script if not.
if [ ! -f "~/Documents/$image.jpg" ];
then
    echo "$0: Image not found. Please enter a valid image name next time. "
    exit 0
fi


read -p "Enter your secret text. " text
echo "$text" | sudo tee ~/Documents/secret.txt

# embedding the secret message inside the image
steghide embed -ef secret.txt -cf $image.jpg
# Enter passphrase when prompted

rm -f secret.txt
clear
echo "Your secret is safe with me!"
