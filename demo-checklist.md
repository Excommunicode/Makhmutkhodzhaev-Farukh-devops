# Demonstration Checklist (for the video)

## Opening
Name: Farukh | Surname: Makhmutkhodzhaev | Group: IT-2 2314 | Student ID: 37093

## Part A — Linux
```bash
cd ~/devops/makhmutkhodzhaev_farukh
pwd                      # print working directory
ls -la                   # list files with details
mkdir backup && rmdir backup   # create/remove a directory (demo)
touch temp.txt && rm temp.txt  # create/remove a file (demo)
cp config/app.conf config/app.conf.bak && rm config/app.conf.bak  # copy (demo)
mv public.txt public.tmp && mv public.tmp public.txt              # move/rename (demo)
cat Makhmutkhodzhaev_Farukh_info.txt      # print whole file
head -n 5 logs/application.log            # first 5 lines
tail -n 5 logs/application.log            # last 5 lines

find . -name "application.log"            # find the log file
grep "ERROR" logs/application.log         # lines with ERROR
grep "WARNING" logs/application.log       # lines with WARNING
grep -c "ERROR" logs/application.log      # count ERROR lines (2)

ls -l private.txt public.txt              # show permissions
chmod 600 private.txt; chmod 644 public.txt

bash scripts/Makhmutkhodzhaev_Farukh_system.sh

ps aux                                   # process list
ps aux | sort -rk 3 | head -5            # top 5 by CPU
top -l 1 | head -15                      # macOS snapshot (Linux: top)
```

## Part B — Git / GitHub
```bash
git config user.name            # check identity
git config user.email
git status
git log --oneline
git log --oneline --graph --all
cat .gitignore
git status --ignored            # shows ignored files (logs/debug.log)
git branch                      # list branches
```
Branch demo (already done, show result): `development` was created, README committed there, merged into `main`.

## Part C — Docker (run on a machine with Docker)
```bash
docker build -t makhmutkhodzhaev-farukh-devops .
docker images
docker run --name makhmutkhodzhaev-farukh-container -p 8080:8080 \
  -e STUDENT_NAME=Farukh \
  -e STUDENT_SURNAME=Makhmutkhodzhaev \
  -e STUDENT_GROUP="IT-2 2314" \
  -e STUDENT_ID=37093 \
  makhmutkhodzhaev-farukh-devops
docker ps && docker ps -a
docker logs makhmutkhodzhaev-farukh-container
docker exec makhmutkhodzhaev-farukh-container env | grep STUDENT
curl http://localhost:8080
docker stop makhmutkhodzhaev-farukh-container
docker start makhmutkhodzhaev-farukh-container
docker rm -f makhmutkhodzhaev-farukh-container

docker compose up -d && docker ps && docker compose down
```

## Part D — Jenkins
Job name: `Makhmutkhodzhaev_Farukh_DevOps` (pipeline from this Jenkinsfile, GitHub repo as SCM).
Show: pipeline stages (Checkout → Build → Test → Docker Build → Docker Run),
Console Output with student info, `Finished: SUCCESS`,
then `docker images` / `docker ps` on the agent.
