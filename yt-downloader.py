import subprocess
import os
import pyfiglet
import questionary

def download_video(url, resolution, output_format, start_time, end_time, output_path, bitrate):
    format_string = f'bestvideo[height<={resolution}]+bestaudio/best[height<={resolution}]' if output_format == 'mp4' else 'bestaudio/best'
    ydl_opts = {
        'format': format_string,
        'outtmpl': 'downloaded_video.%(ext)s'
    }

    ydl_cmd = ['yt-dlp', url, '-f', ydl_opts['format'], '-o', ydl_opts['outtmpl']]
    try:
        subprocess.run(ydl_cmd, check=True)
    except subprocess.CalledProcessError as e:
        print(f"Error downloading video: {e}")
        return

    downloaded_files = [f for f in os.listdir() if f.startswith('downloaded_video')]
    if not downloaded_files:
        print("Error: Downloaded file not found.")
        return

    downloaded_file = downloaded_files[0]

    if output_format == 'mp3':
        output_file = f'{output_path}.mp3'
        ffmpeg_cmd = [
            'ffmpeg', '-i', downloaded_file,
            '-ss', start_time, '-to', end_time,
            '-b:a', bitrate, '-map', 'a', output_file
        ]
    else:
        output_file = f'{output_path}.mp4'
        ffmpeg_cmd = [
            'ffmpeg', '-i', downloaded_file,
            '-ss', start_time, '-to', end_time,
            '-c', 'copy', output_file
        ]
    
    try:
        subprocess.run(ffmpeg_cmd, check=True)
    except subprocess.CalledProcessError as e:
        print(f"Error processing video: {e}")
        return

    try:
        os.remove(downloaded_file)
    except OSError as e:
        print(f"Error removing temporary file: {e}")

    print(f"Downloaded and processed file saved as: {output_file}")

def main():
    ascii_title = pyfiglet.figlet_format("YT Downloader")
    custom_note = "YT Custom Downloader by ramenaru"
    print(ascii_title)
    print(custom_note)
    print("="*len(custom_note))
    
    url = questionary.text("Enter the YouTube URL:").ask()
    output_path = questionary.text("Enter the output file path (without extension):").ask()
    output_format = questionary.select(
        "Select the output format:",
        choices=["mp4", "mp3"]
    ).ask()
    
    if output_format == 'mp4':
        resolution = questionary.select(
            "Select the maximum resolution:",
            choices=["2160", "1440", "1080", "720", "480", "360", "240"]
        ).ask()
        bitrate = None  
    else:
        resolution = None
        bitrate = questionary.select(
            "Select the bitrate:",
            choices=["320k", "256k", "192k", "128k", "96k"]
        ).ask()

    start_time = questionary.text("Enter the start time (HH:MM:SS):", default="00:00:00").ask()
    end_time = questionary.text("Enter the end time (HH:MM:SS):", default="00:00:00").ask()

    download_video(url, resolution, output_format, start_time, end_time, output_path, bitrate)

if __name__ == '__main__':
    main()

