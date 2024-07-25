# ramenaru's CLI Tools Collection

A collection of useful CLI tools designed for Linux-based operating systems, simplifying various daily tasks. This project includes scripts for media downloading, system setup, development tools, and more. Each tool is designed to be user-friendly and highly functional, enhancing your command-line experience.

## Table of Contents

1. [Features](#features)
2. [Tools Included](#tools-included)
   - [YT Custom Downloader](#yt-custom-downloader)
   - [Arch Linux Package Installer](#arch-linux-package-installer)
3. [Contributing](#contributing)
4. [License](#license)
5. [Author](#author)

## Features

- **YT Custom Downloader**: Download YouTube videos as MP4 or MP3, select video resolution, choose audio bitrate, and trim the video/audio to a specific time range.
- **Automated Package Installer**: Simplifies the initial setup process on Arch Linux by offering an interactive menu to install various package groups.
- **Future Tools**: This collection will expand with more CLI tools to aid in various tasks.

## Tools Included

## YT Custom Downloader

A CLI application to download YouTube videos as either video (MP4) or audio (MP3). The tool also allows specifying the resolution for video downloads and the bitrate for audio downloads, as well as trimming the video/audio to a specific time range.

#### Requirements

- Python 3.x
- `yt-dlp`
- `ffmpeg`
- `pyfiglet`
- `questionary`

### Installation

#### 1. Clone the repository:
   ```sh
   git clone https://github.com/ramenaru/utility-scripts
   ```

#### 2. Install Python and pip if they are not already installed.

#### 3. Install the required Python packages:
   ```sh
   pip install pyfiglet questionary yt-dlp
   ```

#### 4. Install `ffmpeg`. On Arch Linux, or any distros/os:
   ```sh
   sudo pacman -S ffmpeg
   ```

#### 5. Run the scripts:
   ```sh
   python yt-downloader.py
   ```
---

## Arch Linux Package Installer

This project provides a script designed to automate the installation of various package groups on Arch Linux.

#### Requirements

- `Arch Linux`
- `base-devel`
- `yay | AUR`
- `pacman`

### Installation

#### 1. Clone the repository:
   ```sh
   git clone https://github.com/ramenaru/utility-scripts
   ```

#### 2. Navigate to script directory
   ```sh
   cd utils.sh
   ```
   
#### 3. Make the script executable
   ```sh
   chmod +x installer.sh
   ```

#### 4. Run the scripts:
   ```sh
   sudo ./installer.sh
   ```

### Contributing
Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are `greatly appreciated`.

#### Steps
1.Fork the Project

2.Create your Feature Branch `(git checkout -b feature/AmazingFeature)`

3.Commit your Changes `(git commit -m 'Add some AmazingFeature')`

4.Push to the Branch `(git push origin feature/AmazingFeature)`

5.Open a Pull Request

### License
Distributed under the MIT License. See [LICENSE](LICENSE) for more information.

### Author
this project created by <a href="https://github.com/ramenaru">ramenaru</a>
