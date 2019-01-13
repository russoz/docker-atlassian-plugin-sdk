# docker-atlassian-plugin-sdk
Dockerized environment to run commands from Atlassian Plugin SDK

# How to use
Download the `atlas.sh` script, then:

    $ atlas.sh create-jira-plugin
    ...
    $ atlas.sh run

The script will trigger the docker image using your current `uid` and the current working directory.

# Motivations
DISCLAIMER: This is the first real-use docker image I publish, and there's certainly a lot of room for improvement.
Comments and suggestions are welcome.

I have been wanting to study JIRA plugin writing for a while, so I decided to start creating a repeatable build 
process for it. Being in a Delivery Services role at the company did that to me.

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
