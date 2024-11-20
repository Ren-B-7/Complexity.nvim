#!/bin/bash

# Create the fonts directory if it doesn't exist
mkdir -p ~/.local/share/fonts

# Navigate to the fonts directory
cd ~/.local/share/fonts

# Clone the Nerd Fonts repository using sparse checkout
git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts.git

# Navigate into the cloned directory
cd nerd-fonts

# Checkout the 'patched-fonts' directory
git sparse-checkout add patched-fonts

# Run the installation script
bash install.sh

# Return to the parent directory
cd ..

# Remove the 'nerd-fonts' repository
sudo rm -rf nerd-fonts

# Refresh the font cache
fc-cache -fv
