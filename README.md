# docker-be4
Be4 tools for building data for rok4 server http://www.rok4.org https://github.com/rok4/rok4


## Build

```
docker build -t be4 --build-arg http_proxy=$http_proxy --build-arg https_proxy=$https_proxy . 
```

## Test by generate a 1:1 000 000 map of France

```
bash test/test.sh
```

Start a rok4 server :

```
docker run -it --rm -p 80:80 -v $PWD/test/Tuto_1_SCAN1000/pyramids/:/rok4/config/pyramids rok4/rok4
```

and go to [http://127.0.0.1/rok4?service=WMS&request=GetMap&crs=CRS:84&bbox=-6.50391,40.9799,9.84375,51.2894&version=1.3.0&format=image/jpeg&LAYERS=SCAN1000_PYR-JPG_FXX_PM&STYLES=&width=2048&height=2048]