# Linux Commands Cheat Sheet

## 1. File and Directory Navigation (Most Common)
| Command | Description |
|---------|-------------|
| `pwd` | Print working directory. |
| `ls` | List files/folders (`-l` for long, `-a` for hidden). |
| `cd <dir>` | Change directory (`..` goes up one level). |
| `mkdir <dir>` | Create a new directory. |
| `rmdir <dir>` | Remove an empty directory. |
| `tree` | Show directory structure as a tree (may require installation). |

---

## 2. File Management
| Command | Description |
|---------|-------------|
| `touch <file>` | Create an empty file or update timestamp. |
| `cp <src> <dest>` | Copy files or directories (`-r` for recursive). |
| `mv <src> <dest>` | Move/rename files or directories. |
| `rm <file>` | Delete a file (`-r` recursive, `-f` force). |
| `cat <file>` | Display file contents. |
| `less <file>` | View file contents page by page. |
| `head <file>` | Show first 10 lines (`-n <num>` for custom). |
| `tail <file>` | Show last 10 lines (`-n <num>` for custom). |
| `wc <file>` | Count lines, words, and characters. |

---

## 3. Searching and Finding
| Command | Description |
|---------|-------------|
| `grep "text" <file>` | Search for text in a file. |
| `grep -r "text" <dir>` | Search recursively in a directory. |
| `find <path> -name "<pattern>"` | Search for files/folders by name. |
| `which <command>` | Show location of an executable. |
| `locate <file>` | Quickly find files (requires `updatedb`). |

---

## 4. File Permissions and Ownership
| Command | Description |
|---------|-------------|
| `chmod 755 <file>` | Change file permissions. |
| `chown user:group <file>` | Change file owner/group. |
| `ls -l` | View file permissions and ownership. |

---

## 5. Disk Usage and System Info
| Command | Description |
|---------|-------------|
| `df -h` | Show disk space usage. |
| `du -sh <dir>` | Show disk usage of a directory. |
| `free -h` | Show memory usage. |
| `top` / `htop` | Monitor processes and resources. |
| `uname -a` | Show kernel and system info. |
| `uptime` | Show system uptime and load. |

---

## 6. Package Management
**Debian/Ubuntu:**
```bash
apt update        # Update package list
apt upgrade       # Upgrade installed packages
apt install <pkg> # Install a package
apt remove <pkg>  # Remove a package
