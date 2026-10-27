# Makhmutkhodzhaev-Farukh-devops


# VIDEO


DevOps Laboratory Work 1 — Linux, Git, Docker and Jenkins.



## Student Information

| Field      | Value                  |
|------------|------------------------|
| Name       | Farukh                 |
| Surname    | Makhmutkhodzhaev       |
| Group      | IT-2 2314              |
| Student ID | 37093                  |
| Course     | DevOps                 |

## Project Structure

```
makhmutkhodzhaev_farukh/
├── app/
│   ├── .gitkeep
│   └── app.py                        # Python web app (Docker)
├── backup/
│   └── .gitkeep
├── config/
│   └── app.conf
├── logs/
│   └── application.log               # demo log (tracked), other *.log ignored
├── scripts/
│   └── Makhmutkhodzhaev_Farukh_system.sh
├── Dockerfile
├── docker-compose.yml
├── Jenkinsfile
├── Makhmutkhodzhaev_Farukh_info.txt
├── private.txt                       # chmod 600
├── public.txt                        # chmod 644
└── .gitignore
```

## DevOps Workflow

```
Linux  →  Git  →  GitHub  →  Jenkins  →  Build  →  Test  →  Docker Build  →  Docker Run  →  SUCCESS
```

- **Linux** — project is developed on a Linux-like system (files, scripts, permissions, processes).
- **Git** — tracks every meaningful change (commit history).
- **GitHub** — remote repository: `https://github.com/Excommunicode/Makhmutkhodzhaev-Farukh-devops`.
- **Jenkins** — job `Makhmutkhodzhaev_Farukh_DevOps` checks out the code from GitHub, builds, tests, builds the container image and runs the container.
- **Podman** (Docker-compatible engine, drop-in replacement for Docker) — image `makhmutkhodzhaev-farukh-devops`, container `makhmutkhodzhaev-farukh-container`, port 8080. The `Dockerfile` format is shared by Docker and Podman.

## Local Usage

### Run the Linux system script

```bash
bash scripts/Makhmutkhodzhaev_Farukh_system.sh
```

### Run the application with Podman

```bash
podman build -t makhmutkhodzhaev-farukh-devops .
podman run --name makhmutkhodzhaev-farukh-container -p 8080:8080 \
  -e STUDENT_NAME=Farukh \
  -e STUDENT_SURNAME=Makhmutkhodzhaev \
  -e STUDENT_GROUP="IT-2 2314" \
  -e STUDENT_ID=37093 \
  makhmutkhodzhaev-farukh-devops
```

Then open `http://localhost:8080`.

Container management:

```bash
podman ps && podman ps -a
podman logs makhmutkhodzhaev-farukh-container
podman exec makhmutkhodzhaev-farukh-container env
podman stop makhmutkhodzhaev-farukh-container
podman start makhmutkhodzhaev-farukh-container
podman rm makhmutkhodzhaev-farukh-container
```

### Run with Compose

```bash
podman-compose up
podman-compose down
```
