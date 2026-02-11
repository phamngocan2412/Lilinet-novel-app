import subprocess
import os

files_to_keep = [
    "lib/features/video_player/presentation/widgets/player_comments_section.dart",
    "lib/features/video_player/presentation/widgets/expanded_player_content.dart"
]

def main():
    # Get all modified files
    result = subprocess.run(["git", "status", "--porcelain"], capture_output=True, text=True)
    lines = result.stdout.splitlines()

    files_to_revert = []
    for line in lines:
        if not line.strip(): continue
        # Format is " M path/to/file" or "M  path/to/file"
        # Porcelain output: XY PATH. usually columns 0-1 are status.
        path = line[3:]
        # path might be quoted if it contains spaces? assuming no for now.
        if path not in files_to_keep:
            files_to_revert.append(path)

    if files_to_revert:
        print(f"Reverting {len(files_to_revert)} files...")
        # Use batches to avoid command line length limits
        batch_size = 50
        for i in range(0, len(files_to_revert), batch_size):
            batch = files_to_revert[i:i+batch_size]
            subprocess.run(["git", "restore"] + batch)
        print("Done.")
    else:
        print("No files to revert.")

if __name__ == "__main__":
    main()
