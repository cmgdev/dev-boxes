# dev-boxes

As great as Vagrant is for developers, I find myself copy/pasting Vagrantfiles and puppet modules from one project to another, with mostly small changes in between. Except that now I want to play with this other app/library and have to figure out how to get that running, making major changes to Vagrant/Puppet.

And as great as Docker is I hate having to manage images and containers and shit. There are lots of public Dockerfiles though, but the ones on Docker Hub are so often out of date.

So, this is my attempt to fix those things.

To start a really simple node app running in Docker on Vagrant:

1. Make your project directory
2. Clone this project to that directory
3. Cd to the cloned dir
4. vagrant up

Going forward:

1. Edit the Vagrantfile with ports and puppet tags (currently only core (stuff I like to have everywhere) and node are available)
2. Edit the bootstrap-puppet.sh with puppet modules you need
3. Probably copy some sample files because I hate starting a new project and thinking "Well, shit, how do I bootstrap this app/library I haven't used in 6 or more months?" and then spending the next hour hunting down examples that actually work.- TBD
