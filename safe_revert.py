import subprocess
import os

files_to_restore = [
    "lib/features/video_player/presentation/widgets/player_comments_section.dart",
    "lib/features/video_player/presentation/widgets/expanded_player_content.dart"
]

def main():
    content_map = {}
    print("Reading files...")
    for f in files_to_restore:
        with open(f, 'r') as file:
            content_map[f] = file.read()

    print("Reverting ALL changes...")
    subprocess.run(["git", "restore", "."], check=True)

    print("Restoring my files...")
    for f, content in content_map.items():
        with open(f, 'w') as file:
            file.write(content)

    print("Done. Git status should show only 2 modified files.")

if __name__ == "__main__":
    main()
