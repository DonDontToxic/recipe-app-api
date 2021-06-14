#!/bin/bash

sudo docker login --username=_ --password=SKz6QsE6L5EJ4i9L1H+03qNouvc5ZRfj/5a8EqZ/gfvySqdJokffgiGHFwmz5VEoDGu9uBQ9RZdVpjnbJpk5FSExSV9zpDdJFENYmsf7AjQ3ysl+WAQBv6cmdxed6xylbV001vxFY9FPulbyO963JpSgxG6Re9Ed13cIa0rOJ7qULhfuJsXpAhYAkqcAEGkTkxEuWLkQE2BHRMUqUGAfCyjcJVm0qKd4Jniw21yURBnWO596BbyPRZpyWyiipgFxXP5P1uvZOJ8wuvkLiW99m48QuoZs1zFozOaFsshmFf7TcoznKy1/1tHEqZBQOxFma4zFphCbL9cBFfUmn+oxDv6Q69RH/PJQO7Jo86Eugxd7YKmzP1RWeiEFYyHrceDPAcRWeMQ3R1hnTPL3zxGZzaWCyXkerVpmv/6Rthx/YK54ufHYq6SN1hi4T/qpOVHr9QlPcpgieIt0PuX95hX9bjA8BJHUsXRTkVzsRa5c3rEXETZGGeNbymb3asEWolBIfIYg3+mLRiGOCg4cbYGlBbq21dSw6Q9XLVH8tAZRh+Up858itAgy0uB338RNszhPlS5E6q/+KjjKa/E7YsGXxv3wBMSvdtRWvUMldQKiZns3qBx0lUZ30WlZEiwMoZhqCgwzW0sxlk8kyWOUFd1yLCstTy1mekiV8OhD8OX+oC0= registry.heroku.com
sudo docker tag favrecipe-be:latest registry.heroku.com/favrecipe-be/web
if [ $TRAVIS_BRANCH == "main" ] && [ $TRAVIS_PULL_REQUEST == "false" ]; then sudo docker push registry.heroku.com/favrecipe-be/web; fi

chmod +x heroku-container-release.sh
sudo chown $USER:docker ~/.docker
sudo chown $USER:docker ~/.docker/config.json
sudo chmod g+rw ~/.docker/config.json

./heroku-container-release.sh