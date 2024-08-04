# Git Backup

- add git remotes to `all_repos.txt`, one line per remote in the format: `github.com@christopher-besch/git_backup`
- `source ~/.venv/bin/activate`
- `GITHUB_USERNAME=[username] GITHUB_PASSWORD=[token] python3 get_repos.py >> all_repos.txt`
- `cp <(cat all_repos.txt | sort | uniq) all_repos.txt`
- `rm -rf repos`
- `./script.sh`
