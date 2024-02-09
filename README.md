# OpenPycharmGitBase
 Add a few custom context menu entries to Windows Explorer

- `IntelliJ Open Git Base` will open a git repository in IntelliJ at the git base directory level, and non-git repositories at the current directory level.
- `PyCharm Open Git Base` similar to the IntelliJ context menu.
- `VSCode Open Git Base` similar to the IntelliJ context menu.
- `Take Ownership of Folder` will grand Administrator and Current user full read/write access to a directory (running `takeown /f "%~1" /r /d y & icacls "%~1" /grant administrators:F /t & icacls "%~1" /grant "%USERNAME%":F /t`)
