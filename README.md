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
- node
- php-fpm
- solr

See the `README.md` in each service for more specific service documentation.

## Setup

### 0. Clone

```
git clone https://github.com/ellioseven/de.git <my-project>
cd <my-project>
rm -rf .git
```

### 1. Source Build

To clone an existing project:

```
git clone <url> src
```

**Note:** Your docroot must live at `src/docroot`.

To create a new project:

```
mkdir -p src/docroot
echo "<?php phpinfo();" >> src/docroot/index.php
```

At this point you can choose to either merge your project into a single
repository, or keep two seperate repositories for the environment and the build.

If you wish to keep your project in a single repository:

```
sed -i 's/\/src//g' .gitignore
mv src/.git ./
git add --all
git commit -m ""
```

If you wish to have seperate repositories:

```
git init
git add --all
git commit -m "Initialise environment"
```

### 2. Configure Environment

Copy `docker-compose.example.yml` and rename to `docker-compose.yml`.

Configure your Docker environment (eg: services) and commit.

```
git add docker-compose.yml
git commit -m "Add docker-compose.yml"
```

To add local specific Docker configuration (eg: extra hosts):

Copy `docker-compose.override.example.yml` and rename to `docker-compose.override`.

### 3. Fire It Up

Boot up the environment with:

```
make up
```

### 4. (Optionally) Add Host

If you have configured extra hosts in `docker-compose.override.yml` in the
previous steps. You may want to add a service to your `/etc/hosts` file. This
can be done with:

```
make SERVICE=<service> host
```

For example, to add the `apache` service to `/etc/hosts`:

```
make SERVICE=apache host
```

## Commands

**Up:**

Boot up the environment:

```
make up
```

**Host:**

Add a service hosts entry to `/etc/hosts`:

```
make SERVICE=<service> host
```

The following will create a hosts entry for the `apache` service:

```
make SERVICE=apache host
```
