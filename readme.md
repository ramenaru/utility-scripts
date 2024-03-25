# Arch Linux Auto Script

## About The Project

This project provides a script designed to automate the installation of various package groups on Arch Linux. It simplifies the initial setup process by offering an interactive menu to users, allowing them to choose which package groups to install. The script supports multiple categories, including media packages, essential system packages, development tools, and others, with room for easy expansion or customization.

### Built With

- Bash

## Getting Started

To get a local copy up and running follow these simple steps.

### Prerequisites

This script is intended for use on Arch Linux with `pacman` installed. Ensure your system meets this requirement before proceeding.

### Installation

#### 1. Clone the repository:
   ```sh
   git clone https://github.com/ramenaru/utils.sh
   ```

#### 2. Navigate to script directory
   ```sh
   cd utils.sh
   ```
   
#### 3. Make the script executable
   ```sh
   chmod +x installer.sh
   ```

### Usage
To use the script, run it as root or with `sudo` to start the installation process. You will be prompted to confirm the installation of each package group
   ```sh
   sudo ./installer.sh
   ```

Follow the prompts to select which package groups you wish to install. The script facilitates a more engaging and personalized setup experience for Arch Linux users.

### Contributing
Contributions are what make the open-source community such an amazing place to learn, inspire, and create. Any contributions you make are `greatly appreciated`.

#### Steps
1.Fork the Project

2.Create your Feature Branch (git checkout -b feature/AmazingFeature)

3.Commit your Changes (git commit -m 'Add some AmazingFeature')

4.Push to the Branch (git push origin feature/AmazingFeature)

5.Open a Pull Request

### License
Distributed under the MIT License. See `LICENSE` for more information.

### Author
this project created by <a href="https://github.com/ramenaru">ramenaru</a>
