import os
import paramiko
import requests

def print_banner():
    print("="*60)
    print(" 🔐  Smart 403 Forbidden Error Fixer - By Amin Mousavi  ")
    print("="*60)

def download_index_php(local_path):
    url = "https://raw.githubusercontent.com/WordPress/WordPress/master/index.php"
    try:
        print("🌐 Downloading index.php from WordPress GitHub...")
        response = requests.get(url)
        if response.status_code == 200:
            with open(local_path, "w", encoding="utf-8") as f:
                f.write(response.text)
            print("✅ index.php downloaded successfully.")
            return True
        else:
            print(f"❌ Failed to download file. Status code: {response.status_code}")
            return False
    except Exception as e:
        print(f"❌ Error downloading file: {str(e)}")
        return False

def main():
    print_banner()

    host = input("🌐 Enter SFTP Host: ")
    port = int(input("🔢 Enter Port (e.g. 55100): "))
    username = input("👤 Enter Username: ")
    password = input("🔑 Enter Password (visible): ")

    local_file = "index.php"
    remote_path = "/home/wplive/web/wp-live/index.php"

    if not os.path.exists(local_file):
        success = download_index_php(local_file)
        if not success:
            return

    try:
        print("📡 Connecting to SFTP...")
        transport = paramiko.Transport((host, port))
        transport.connect(username=username, password=password)
        sftp = paramiko.SFTPClient.from_transport(transport)

        print("🔍 Checking for existing file on server...")
        file_exists = False
        try:
            sftp.stat(remote_path)
            file_exists = True
        except FileNotFoundError:
            file_exists = False

        if file_exists:
            print("⚠️ File 'index.php' already exists at the destination.")
            choice = input("❓ Do you want to replace it? (yes/no): ").strip().lower()
            if choice == "yes":
                sftp.put(local_file, remote_path)
                print("✅ Original index.php is replaced.")
            else:
                print("ℹ️ File was not replaced.")
        else:
            sftp.put(local_file, remote_path)
            print(f"📤 File 'index.php' uploaded to {remote_path}")

        sftp.close()
        transport.close()

    except Exception as e:
        print(f"❌ Error: {str(e)}")

    input("\nPress Enter to exit...")

if __name__ == "__main__":
    main()
