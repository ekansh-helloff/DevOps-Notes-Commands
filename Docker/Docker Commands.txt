1. docker ps --size --format "table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Size}}"

CONTAINER ID   IMAGE                     NAMES            SIZE
cddae31c314f   acme/my-final-image:1.0   my_container_5   0B (virtual 7.75MB)
939b3bf9e7ec   acme/my-final-image:1.0   my_container_4   0B (virtual 7.75MB)
3ed3c1a10430   acme/my-final-image:1.0   my_container_3   5B (virtual 7.75MB)
a5ff32e2b551   acme/my-final-image:1.0   my_container_2   5B (virtual 7.75MB)
40ebdd763416   acme/my-final-image:1.0   my_container_1   5B (virtual 7.75MB)

2. docker run -dit --name my_container_1 acme/my-final-image:1.0 bash \
3. docker info
