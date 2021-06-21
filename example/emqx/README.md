# Build images
cd emqtt-bench
make docker

# Test
docker run -it emqtt_bench:0.3.2-29-ge965efa conn -c 10 -i 10 -h 103.98.152.188
docker run -it emqtt_bench:0.3.2-29-ge965efa pub -c 100 -I 10 -t bench -s 256 -h 103.98.152.188
docker run -it emqtt_bench:0.3.2-29-ge965efa sub -c 10 -t bench/test -q 2 -h 103.98.152.188 -p 1883