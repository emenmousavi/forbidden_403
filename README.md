
# Forbidden 403 Fix Script

This script automates the process of fixing the Forbidden 403 error by checking and uploading the `index.php` file to a specified SFTP server.

## Features:
- Checks if the `index.php` file exists on the server.
- Downloads the `index.php` file from GitHub if it's missing.
- Uploads the `index.php` file to the appropriate directory on the server.
- Provides user-friendly messages, including success and error notifications.

## Requirements
Please run:
    ```
    pip install -r requirements.txt
    ```
The requirements.txt includes the following Python libraries:
- paramiko: For SFTP file transfer and SSH communication.
- requests: To download the index.php file from GitHub.

## Usage:
1. Clone the repository or download the script `run.py`.
2. Run the script:
    ```bash
    python3 run.py
    ```
4. Follow the prompts to enter your SFTP credentials (host, username, and port).
5. The script will check for the `index.php` file, download and upload it if necessary.

## Requirements:
- `curl` installed on the system.
- SFTP access to the server.

## License:
This project is licensed under the MIT License.
