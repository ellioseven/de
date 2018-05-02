# Development Environment

## About

This is a flexible and highly configurable Drupal development environment.

The repository acts as a starting point for a simple and sharable environment.
Environments should be as easy as cloning and booting up.

## Compatibility

Currently only tested on Linux, but should run on UNIX like systems such as
MacOS.

## Setup

### 0. Clone

```
git clone https://github.com/ellioseven/de.git <my-project>
cd <my-project>
```

### 1. Source Build

Clone/create your project as `src`:

```
git clone <url> src
```

or:

```
mkdir src
```

### 2. Configure Environment

Copy `docker-compose.example.yml` and rename to `docker-compose.yml`.

Configure your Docker environment (services, extra hosts, etc.)

### 3. Fire It Up

Boot up the environment with:

```
make up
```

### 4. (Optionally) Add Host

If you have configured extra hosts in the previous steps. You may want to add
a service to your `/etc/hosts` file. This can be done with:

```
make SERVICE=<service> host
```
