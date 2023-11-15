# l33th4x0r
This repo contains some simple tools designed to let YOU become the ULTIMATE HACKER 😎

## Compiling
`gcc --std=c11 -pedantic -Wall -o "${1%.*}" "$1"`
where $1 is the source file name

## Running
`./h4x`: interactive mode! press ^D to exit.
`./h4x <file.txt`: take in file.txt and print the hacked output to the terminal
`./h4x <file.txt > hacked.txt`: take in file.txt and print it out to hacked.txt

`./unh4x` operates the same, except it unhacks you. So `./unh4x <hacked.txt` will give you back your file.txt, to the best of its ability. `[,]` indicates multiple possibilites for the original character.

## Performance

Haven't done any performance testing yet.

```
 _ __________ _   _     _  _        ___       
| |___ /___ /| |_| |__ | || |__  __/ _ \ _ __ 
| | |_ \ |_ \| __| '_ \| || |\ \/ / | | | '__|
| |___) |__) | |_| | | |__   _>  <| |_| | |   
|_|____/____/ \__|_| |_|  |_|/_/\_\\___/|_|   
                                              
```
