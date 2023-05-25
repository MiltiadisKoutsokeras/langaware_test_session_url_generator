# How to develop on this project

## Development environment setup

1. Install [node.js](https://nodejs.org) version **16.X.Y LTS**. There is an
   automated script that can do that for your local account using the
   [nvm](https://github.com/nvm-sh/nvm) installer:

   ```Bash
   # This will install the proper node.js version in your account
   .github/scripts/install_nodejs.sh
   ```

   This method only works in POSIX-compliant shell (sh, dash, ksh, zsh, bash),
   in particular on these platforms: unix, macOS, and windows WSL.

   **CAUTION:** DO NOT execute the script above if you have already a proper
   `node.js` installation.

2. Install the Git hooks required for applying source code policies.

   ```Bash
   cd /project/root/folder
   cp -v .github/git-hooks/* .git/hooks/
   ```

   If you skip step, your commits will be rejected when pushed to the repository
   origin.

3. To launch the application locally in development mode, execute:

    ```Bash
    npm ci && npm run dev
    ```

## Source code editing instructions

1. Follow the general guidelines in
   [Confluence](https://langaware.atlassian.net/wiki/spaces/EN/pages/571736068/Source+Code+Guidelines)
2. Setup your IDE to automatically use on save the appropriate Linter and
   Formatter. See table below for proper linter and formatter for specific file
   types. If you do not use Visual Studio Code, please collaborate with the rest
   of the team in order to avoid formatting conflicts and patch size increase.

| Source code file type  | Linter to use | Formatter to use                                                                |
| :--------------------- | :------------ | :------------------------------------------------------------------------------ |
| CSS (.css)             |               | Visual Studio Code `CSS Language features`                                      |
| JSON (.json)           |               | Visual Studio Code `JSON Language features`                                     |
| Javascript (.js)       |               | Visual Studio Code `Typescript and Javascript Language features`                |
| Markdown (.md)         |               | Markdown All in One (Visual Studio Code extension `yzhang.markdown-all-in-one`) |
| Typescript (.ts, .tsx) |               | Visual Studio Code `Typescript and Javascript Language features`                |

**CAUTION**: Committing unformatted code is not allowed, so a pre-commit script
checks all files in the commit staging area and if a file of supported languages
is not properly formatted, it will not allow the commit to happen.

## Git Workflow

Read the instructions
[here](https://langaware.atlassian.net/wiki/spaces/EN/pages/500400153/GitHub+Repositories#Git-Workflow).
