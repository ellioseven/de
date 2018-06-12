# Drupal Development Environment

Version 0.0.1

## About

This is a flexible and highly configurable docker based Drupal development
environment.

The repository acts as a starting point for a simple and sharable environment.
Environments should be as easy as cloning and booting up.

## Compatibility

Currently only tested on Linux, but should run on UNIX like systems such as
MacOS.

## Services

- apache
- mailhog
- mysql
- ngrok
- node
- php-fpm
- solr

See the `README.md` in each service for more specific service documentation.

## Setup

### 0. Create Project

```
# Create project.
mkdir <project> && cd <project>
git init
```

### 1. Create Environment

```
# Clone de.
git submodule add git@github.com:ellioseven/de.git .de

# Create configuration.
cp .de/.gitignore.example .gitignore
cp .de/docker-compose.example.yml docker-compose.yml
cp .de/docker-compose.override.example.yml docker-compose.override.yml

# Configure environment.
edit docker-compose.yml
edit docker-compose.override.yml

# Commit to VCS.
git add --all && git commit -m "Add environment"
```

### 2. Clone/Create Build

For existing builds:

```
# Clone existing build and commit to environment.
git submodule add <git-location> src
git add --all && git commit -m "Add build"
```

For new builds:

```
# Create new build and commit to environment.
mkdir -p src/docroot
git init src
echo "<?php phpinfo();" >> src/docroot/index.php
git -C src add --all && git -C src commit -m "Create build"
```

Boot up the environment with:

```
./.de/bin/docker-up.sh
```

Push the environment to a repository:

```
git remote add origin <origin>
git push origin master
```

### 4. (Optionally) Add Host

If you have configured extra hosts in `docker-compose.override.yml` in the
previous steps. You may want to add a service to your `/etc/hosts` file. This
can be done with:

```
./.de/bin/docker-host.sh <service>
```

For example, to add the `apache` service to `/etc/hosts`:

```
./.de/bin/docker-host.sh apache
```
