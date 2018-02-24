# Fork Wiki
This tool helps you copy all wiki content after fork some repo

## Usage
1. fork the repo
2. create the first page for the new fork repo
3. make sure you have right permission on current machine
4. run the fork wiki with appropriate parameter as below

sh fork_wiki.sh source_auth target_auth repo_name

- source_auth is the original user name
- target_auth is the target user name
- repo_name is which repo wiki you need

e.g. sh fork_wiki.sh PikaLabs CatKang zeppelin
