# Tmux Minithemes

Minimal and elegant theme system for tmux with multiple color schemes and customizable layouts.

[![TPM](https://img.shields.io/badge/tpm--support-true-blue)](https://github.com/tmux-plugins/tpm)
[![License](https://img.shields.io/badge/License-MIT-brightgreen.svg)](https://opensource.org/licenses/MIT)

## 👀 Examples

<img width="1910" height="72" alt="1000" src="https://github.com/user-attachments/assets/a87d1fad-f973-4842-bfb7-f56821358c00" />
<br/><br/>
<img width="1910" height="72" alt="1001" src="https://github.com/user-attachments/assets/b7af0b00-88f6-47f8-bfcc-f0420f9a6dae" />
<br/><br/>
<img width="1910" height="24" alt="1002" src="https://github.com/user-attachments/assets/4c4fde01-2400-410a-b959-e5e0308a9a20" />
<br/><br/>
<img width="1910" height="24" alt="1003" src="https://github.com/user-attachments/assets/bd600e99-bc19-4358-85be-5773e7aabd9f" />

## ✨ Features

- **Session Information**: Displays session name with visual prefix highlighting
- **Window & Pane Counts**: Shows the number of windows and panes with custom icons
- **Current Directory**: Displays the current working directory (shortens `~/` from home)
- **User & Host**: Shows username and hostname
- **Prefix Highlighting**: Visual feedback when tmux prefix is active
- **Customizable Borders**: Themed pane borders and active pane highlighting
- **Multiple Layouts**: Choose between simple and modern visual styles
- **Rich Color Schemes**: 9 pre-defined themes with carefully chosen color palettes

## 📥 Installation

**Install manually**

Clone the repo somewhere and source it in `.tmux.conf`:

```tmux
run-shell "/path/to/tmux-minithemes.tmux"
```

*NOTE: Options should be set before sourcing.*

**Install using [TPM](https://github.com/tmux-plugins/tpm)**

```tmux
set -g @plugin 'pavlemmm/tmux-minithemes'
```

Then press `prefix + I` to install the plugin.

## 🎨 Themes

### Tokyo Night (default)
```bash
set -g @tmux_minithemes_theme 'tokyonight'
```
Blue and orange color scheme inspired by the popular Tokyo Night theme.

### Gold
```bash
set -g @tmux_minithemes_theme 'gold'
```
Warm yellow and pink color scheme.

### Everforest
```bash
set -g @tmux_minithemes_theme 'everforest'
```
Green nature-inspired color palette.

### Gruvbox
```bash
set -g @tmux_minithemes_theme 'gruvbox'
```
Retro warm colors from the popular Gruvbox theme.

### Catppuccin
```bash
set -g @tmux_minithemes_theme 'catppuccin'
```
Pastel blue and orange color scheme.

### Nord
```bash
set -g @tmux_minithemes_theme 'nord'
```
Cool blue and gray color palette.

### Dracula
```bash
set -g @tmux_minithemes_theme 'dracula'
```
Purple and pink dark theme.

### One Dark
```bash
set -g @tmux_minithemes_theme 'onedark'
```
Blue and red theme inspired by VS Code's One Dark.

### Rose Pine
```bash
set -g @tmux_minithemes_theme 'rosepine'
```
Rose, pink, and purple color scheme.

## 🎯 Styles

### Simple Style (default)
Clean separator-based layout with minimal visual clutter.

```bash
set -g @tmux_minithemes_style 'simple'
```

### Modern Style
Arrow-based powerline layout for a more dynamic appearance.

```bash
set -g @tmux_minithemes_style 'modern'
```

## ⚙️ Customization

You can customize various aspects of the theme to suit your preferences.

### Theme and Style
```tmux
# Set theme (see available themes above)
set -g @tmux_minithemes_theme 'tokyonight'

# Set style (simple or modern)
set -g @tmux_minithemes_style 'simple'
```

### Arrow and Separator Icons
```tmux
set -g @tmux_minithemes_right_arrow_icon ''
set -g @tmux_minithemes_left_arrow_icon ''
set -g @tmux_minithemes_right_separator_icon ''
set -g @tmux_minithemes_left_separator_icon ''
set -g @tmux_minithemes_secondary_separator_modern ''
set -g @tmux_minithemes_secondary_separator_simple ''
```

### Content Icons
```tmux
set -g @tmux_minithemes_user_icon ' '
set -g @tmux_minithemes_folder_icon ' '
set -g @tmux_minithemes_windows_icon ' '
set -g @tmux_minithemes_panes_icon '󰝘 '
```

## 📋 Requirements

- **tmux** 2.6 or newer
- **Nerd Fonts** for proper icon rendering (recommended: [JetBrains Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts))

## 📄 License

[MIT](https://opensource.org/licenses/MIT) License
