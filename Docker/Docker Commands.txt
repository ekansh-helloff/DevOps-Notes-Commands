**1.** docker ps --size --format "table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Size}}"

CONTAINER ID   IMAGE                     NAMES            SIZE
cddae31c314f   acme/my-final-image:1.0   my_container_5   0B (virtual 7.75MB)
939b3bf9e7ec   acme/my-final-image:1.0   my_container_4   0B (virtual 7.75MB)
3ed3c1a10430   acme/my-final-image:1.0   my_container_3   5B (virtual 7.75MB)
a5ff32e2b551   acme/my-final-image:1.0   my_container_2   5B (virtual 7.75MB)
40ebdd763416   acme/my-final-image:1.0   my_container_1   5B (virtual 7.75MB)

**2.** docker run -dit --name my_container_1 acme/my-final-image:1.0 bash \

**3.** docker info

**4.**  docker run -d --restart unless-stopped redis
        docker update --restart unless-stopped redis
        docker update --restart unless-stopped $(docker ps -q)

Restart policies are different from the **--live-restore** flag of the dockerd command. Using **--live-restore** lets you to keep your containers running during a Docker upgrade, though networking and user input are interrupted.

Use a restart policy
To configure the restart policy for a container, use the --restart flag when using the docker run command. The value of the --restart flag can be any of the following:

Flag	                        Description
no	                          Don't automatically restart the container. (Default)
on-failure[:max-retries]    	Restart the container if it exits due to an error, which manifests as a non-zero exit code. Optionally, limit the number of times the Docker daemon attempts                               to restart the container using the :max-retries option. The on-failure policy only prompts a restart if the container exits with a failure. It doesn't                                     restart the container if the daemon restarts.
always	                      Always restart the container if it stops. If it's manually stopped, it's restarted only when Docker daemon restarts or the container itself is manually                                    restarted. (See the second bullet listed in restart policy details)
unless-stopped	              Similar to always, except that when the container is stopped (manually or otherwise), it isn't restarted even after Docker daemon restarts.

## Create a Dockerfile that prints the numbers 1 to 5 and then exits.

FROM busybox:latest
COPY --chmod=755 <<"EOF" /start.sh
echo "Starting..."
for i in $(seq 1 5); do
  echo "$i"
  sleep 1
done
echo "Exiting..."
exit 1
EOF
ENTRYPOINT /start.sh

