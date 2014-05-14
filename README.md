ericmoritz/docker-dev
=======================

`docker-dev` is a [12 Factor](http://12factor.net/) development
environemnt. 

What is a 12 Factor development environment?  It is an development
environment that you can spin up anywhere
[Docker](https://www.docker.io/) lives, is exactly the same no matter
where you spin it up and is treated as disposable.

Why do you want a disposable development enviroment? Well, you can
work from anywhere if you treat your development enviroment as
disposable!

Here's an example:

1. Fire up docker-dev on your laptop
2. make changes, commit, and push remote location
3. Laptop falls into lake
4. Spin up EC2 instance with Docker installed
5. Steal a laptop, SSH into EC2 instance
6. Run `docker pull ericmoritz/docker-dev`
7. Fire up docker-dev and keep working.

Installation and Usage
-----------------------

Installation is easy if you have [Docker installed](https://www.docker.io/gettingstarted/#h_installation)

```
 $ curl -O https://raw.githubusercontent.com/ericmoritz/docker-dev/master/bin/docker-dev
 $ chmod +x ./docker-dev
```

Now that you have the `docker-dev` script, you can start it up

```
 $ ./docker-dev https://github.com/ericmoritz/docker-dev-home.git
```

Or you can set `HOME_REPO_URL` in your environment to make ./docker-dev easier to start

```
  $ export HOME_REPO_URL=https://github.com/ericmoritz/docker-dev-home.git
  $ ./docker-dev
```

Config
-------

`docker-dev` follows the [12 factor
config](http://12factor.net/config) rule by storing the configuration
of your development environment external from `docker-dev`.

Simply create a git repo that resembles your ideal home directory and
point `docker-dev` at it. Bada-bing; bada-boom you have 12-factors!

Projects
---------

`docker-dev` treats your codebases as a [Backing
Service](http://12factor.net/backing-services) in the 12 Factor
parlance.  The current working directory is mounted inside the
container at `/src` and you are free to alter that directory as you
see fit and those changes will persist the next time you fire up
`docker-dev` in that directory.

Keep in mind, you should treat the `docker-dev` container has
temporary and commit any changes you make to version control before
stopping the container.  The `/src` volume ensures you won't lose your
changes if the container stops but doesn't ensure that your changes
will exist if the Docker host dies (Backup!).

If your `PWD` has a file called `.project_profile` this file will be
execute to configure your container for your porject when you start 
up `docker-dev`.



