# [Project Euler](https://projecteuler.net) in Pascal

```
 _______                                    _____    __               
(   _   )                                  |  ___)   \ \              
 | | | | ___   ___  _   __  _____   _____  | |_  _   _\ \   ___  ___  
 | | | |/ _ \ / _ \| | /  \/ __) \ / (   ) |  _)| | | |> \ / __)/ _ \ 
 | | | | |_) | (_) ) || || > _) \ v / | |  | |__| |_| / ^ \> _)| |_) )
 |_| |_|  __/ \___/ \_   _/\___) > <   \_) |_____)___/_/ \_\___)  __/ 
       | |            | |       / ^ \                          | |    
       |_|            |_|      /_/ \_\                         |_|    
```

## Adding FPTest to a project in Lazarus IDE

1. Clone [FPTest](http://wiki.freepascal.org/FPTest) like so `git clone https://github.com/graemeg/fptest`
2. Open your [Lazarus](https://www.lazarus-ide.org/) project and go to `Package -> Open Package File(.ipk)...`
3. Select `fptest.ipk` from `fptest` repo you just cloned
4. In the package explorer window click `Compile` and then `Use -> Add to Project`

You are done. Now the `uses` statement should be able to find FPTest related types and methods.