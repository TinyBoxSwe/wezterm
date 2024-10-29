# WezTerm Configuration with Catppuccin and Wallpaper Cycling

This is a well-structured WezTerm configuration that offers a delightful terminal experience with the popular Catppuccin color scheme and dynamic wallpapers.

## Features

* **Catppuccin Color Schemes:** Choose between beautiful Catppuccin themes like Latte and Mocha to enhance your terminal aesthetics.
* **Customizable Wallpaper Cycling:** Cycle through a set of predefined wallpapers with keyboard shortcuts to personalize your workspace.
* **Adaptable Key Bindings:** Modify the key bindings for wallpaper cycling to suit your preferences.
* **Performance-Focused:** Enjoy a smooth and responsive terminal experience without compromising visual appeal.

## Installation

**1. Install WezTerm:**

Head to the official WezTerm website (https://wezfurlong.org/wezterm/index.html) for installation instructions specific to your operating system.

**2. Set Up the Configuration:**

There are two options for configuring WezTerm with this setup:

**Option A: Clone the Repository**

1. Clone this repository to your local machine using a terminal ( note: the config should be in ~/.config ):

   ```bash
   git clone https://github.com/TinyBoxSwe/wezterm.git
   ```

## Option B: Download the Configuration File

1. Download the `wezterm.lua` file from the repository.

2. Locate the appropriate directory for WezTerm configurations. This typically depends on your operating system:

   * **Single user:** `$HOME/.wezterm.lua`
   * **X11/Wayland systems with multiple users:** `$XDG_CONFIG_HOME/wezterm/wezterm.lua`
   * **Other systems with multiple users:** `$HOME/.config/wezterm/wezterm.lua`

3. Apply the Configuration:

   Copy the downloaded `wezterm.lua` file to the chosen directory identified in step 2.

4. Start WezTerm:

   Launch WezTerm to experience your customized terminal environment.

5. Key binds:
   
   CTRL + ] to cycle wallpaper forwards
   CTRL + [ to cycle wallpaper backwards

6. Personalize Key Bindings (Optional):

   This configuration provides default keyboard shortcuts for cycling wallpapers. You can modify these bindings within the `wezterm.lua` file for a more personalized experience. Refer to the WezTerm documentation for key binding customization: https://github.com/wez/wezterm/blob/main/docs/config/keys.md.

**NOTE**
   
   Make sure to change the username of the image folder path in wezterm.lua "/home/{your username}/.config/wezterm" 

Enjoy your enhanced WezTerm experience with Catppuccin flair and dynamic wallpapers!
