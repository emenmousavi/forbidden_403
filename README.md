
# Forbidden 403 Fix Script

This script automates the process of fixing the Forbidden 403 error by checking and uploading the `index.php` file to a specified SFTP server.

## Features:
- Checks if the `index.php` file exists on the server.
- Downloads the `index.php` file from GitHub if it's missing.
- Uploads the `index.php` file to the appropriate directory on the server.
- Provides user-friendly messages, including success and error notifications.

## Usage:
1. Clone the repository or download the script `fix_403.sh`.
2. Give the script executable permissions:
    ```bash
    chmod +x fix_403.sh
    ```
3. Run the script:
    ```bash
    ./fix_403.sh
    ```
4. Follow the prompts to enter your SFTP credentials (host, username, and port).
5. The script will check for the `index.php` file, download and upload it if necessary.

## Requirements:
- `curl` installed on the system.
- SFTP access to the server.

## License:
This project is licensed under the MIT License.
