# docker-atlassian-plugin-sdk
Dockerized environment to run commands from Atlassian Plugin SDK

# How to use
[Download the `atlas.sh` script](https://github.com/russoz/docker-atlassian-plugin-sdk/raw/master/atlas.sh),
remember to `chmod +x`, then run:

    $ ./atlas.sh create-jira-plugin
    ...
    $ ./atlas.sh run
    $ ./atlas.sh       (to open a bash prompt in the docker image)

The script will trigger the docker image using your current `uid` and the current working directory.

We strongly recommend following Atlassian's
[Create a Hello World Plugin](https://developer.atlassian.com/server/framework/atlassian-sdk/create-a-helloworld-plugin-project/)
tutorial to get a primer on its usage.

# Features
* No setup necessary, just execute `atlas.sh`
* Utilize the user's Maven configuration out-of-the-box (when using the `atlas.sh` script), dramatically improving
  the execution time after the first run
* Automatic publishing of port 2990 when command is *run* or *atlas-run*
* Based on Alpine Linux => very small disk footprint

# To-Do
* Allow picking distinct versions of the Atlassian SDK (hardcoded to latest now)
* Improve/allow running `atlas-update` as a non-root id (if possible?)
* Build with different base images
* Build with different JDKs and JDK versions
* Allowing for links using the same name as of the SDK binaries to be created pointing to atlas.sh, then detecting
  this configuration and running the proper script in the container
  * It would be nice to have an installation script that downloads atlas.sh and create all the necessary links

# Motivations
DISCLAIMER: This is the first real-use docker image I publish, and there's certainly a lot of room for improvement.
Comments and suggestions are welcome.

I have been wanting to study JIRA plugin writing for a while, so I decided to start creating a repeatable build 
process for it. Being in a Delivery Services role at the company did that to me.

# Source
Source code is available at: https://github.com/russoz/docker-atlassian-plugin-sdk

# References
* Atlassian
  * SDK
    * [Install the Atlassian SDK on a Linux or Mac system](https://developer.atlassian.com/server/framework/atlassian-sdk/install-the-atlassian-sdk-on-a-linux-or-mac-system/)
    * [Create a HelloWorld plugin project](https://developer.atlassian.com/server/framework/atlassian-sdk/create-a-helloworld-plugin-project/)
    * [SDK: Getting started](https://developer.atlassian.com/server/framework/atlassian-sdk/)
  * [JIRA Latest Updates](https://developer.atlassian.com/server/jira/platform/)
  * [Developer Atlassian Docs](https://developer.atlassian.com/docs/)
* [Official Maven docker image](https://hub.docker.com/_/maven)
  * [Github repository](https://github.com/carlossg/docker-maven)
* Stackoverflow 
  * [Difference between _JAVA_OPTIONS JAVA_TOOL_OPTIONS and JAVA_OPTS](https://stackoverflow.com/questions/28327620/difference-between-java-options-java-tool-options-and-java-opts)
* Github
  * [codeclou / docker-atlassian-sdk](https://github.com/codeclou/docker-atlassian-sdk)
