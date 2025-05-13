## Git and Visual Studio Code Basics

This guide provides step-by-step instructions for using Git, Visual Studio Code, and Azure DevOps or GitHub Repositories. It covers installation, repository management, branching, merging, and best practices for collaboration.

---

## Table of Contents

1. [Install Git](#install-git)
2. [Clone the Repository](#clone-the-repository)
3. [Create a New Branch](#create-a-new-branch)
4. [Merging Changes to Main Branch](#merging-your-changes-to-main-branch)
5. [Commonly Used Git Commands](#commonly-used-git-commands)
6. [Best Practices](#best-practices)

---

## Install Git

From a PowerShell terminal, check if you have `git` installed on your local machine:

```sh
git --version
```

If `git` is installed, this command will display the installed version. If it is not installed, download and install it from this site: [Git - Downloads (git-scm.com)](https://git-scm.com/downloads).

---

## Clone the Repository

1. Open Visual Studio Code.
2. Open the Terminal by selecting `View > Terminal`.
3. Navigate to your Azure DevOps project in a web browser.
4. Copy the repository URL:
   - Go to the **Repos** section.
   - Click on **Clone** and copy the URL.
5. Clone the repository to your local machine:
   ```sh
   git clone <repository-url>
   ```
   Replace `<repository-url>` with the URL you copied.

---

## Create a New Branch

1. Navigate to the repository directory:
   ```sh
   cd <repository-directory>
   ```
   Replace `<repository-directory>` with the path to your cloned repository.

2. Create and switch to a new branch:
   ```sh
   git checkout -b <branch-name>
   ```
   Replace `<branch-name>` with your desired branch name.

Now you are working on your own local branch.

---

## Merging Your Changes to Main Branch

Merge changes from **remote** `main` to local `main`, and then to your branch:

1. Fetch the latest changes from the remote repository:
   ```sh
   git fetch origin
   ```
2. Switch to your local `main` branch:
   ```sh
   git checkout main
   ```
3. Pull the latest changes from the remote `main` branch:
   ```sh
   git pull
   ```
4. Switch to your branch:
   ```sh
   git checkout <branch-name>
   ```
5. Merge the updated `main` branch into your branch:
   ```sh
   git merge main
   ```
6. Resolve any merge conflicts if they arise. Visual Studio Code will highlight conflicts and provide tools to help you resolve them.
7. Commit the merge if there were conflicts that you resolved:
   ```sh
   git commit -m "Merged main into <branch-name>"
   ```
8. Push your changes to the remote repository:
   ```sh
   git push origin <branch-name>
   ```

---

## Commonly Used Git Commands

- Check the status of your repository:
  ```sh
  git status
  ```
- Pull the latest changes:
  ```sh
  git pull
  ```
- Create a new branch:
  ```sh
  git checkout -b <new-branch-name>
  ```
- Switch to an existing branch:
  ```sh
  git checkout <branch-name>
  ```
- Commit changes:
  ```sh
  git commit -m "Your commit message"
  ```
- Push changes to the remote repository:
  ```sh
  git push
  ```

---

## Best Practices

**Sync Your Local Branch with Remote Periodically**

It is a best practice to periodically push updates to the remote branch to ensure your changes are backed up and to integrate updates from your team.

```sh
# Pull the latest changes from the remote branch
git pull origin <branch-name>

# Push your local changes to the remote branch
git push origin <branch-name>
```

**Delete Local Branch After Merging**

Once your pull request is complete and merged, delete your local branch to keep your workspace clean:

```sh
# Switch to the main branch
git checkout main

# Pull the latest changes from the remote main branch
git pull origin main

# Delete the local branch
git branch -d <branch-name>
```

**Reuse Branch Names (Optional, not Recommended)**

If you prefer to reuse branch names, you can clean up the remote and local branches properly before recreating them:

```sh
# Delete the remote branch
git push origin --delete <branch-name>

# Delete the local branch
git branch -D <branch-name>

# Recreate the branch and switch to it
git checkout -b <branch-name>

# Push the new branch to the remote repository
git push origin <branch-name>
```

This ensures that the branch is reset and ready for new work while maintaining a clean repository.
