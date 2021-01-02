# hls-debug

- no error with stack
- type check error with hls

```
File:     /home/ishiy/tmp/hls-debug/src/Main.hs
Hidden:   no
Range:    10:12-10:39
Source:   typecheck
Severity: DsError
Message:
  • Exception when trying to run compile-time code:
  greeting.txt: hGetContents: invalid argument (invalid byte sequence)
  Code: embedFile "greeting.txt"
  • In the untyped splice: $(embedFile "greeting.txt")
```

The error comes from reading a file which includes Japanese with Template Haskell.
[Haskell with UTF-8](https://serokell.io/blog/haskell-with-utf8) may be helpful.

## My env
Arch Linux

```
$ locale
LANG=en_US.UTF-8
LC_CTYPE="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_PAPER="en_US.UTF-8"
LC_NAME="en_US.UTF-8"
LC_ADDRESS="en_US.UTF-8"
LC_TELEPHONE="en_US.UTF-8"
LC_MEASUREMENT="en_US.UTF-8"
LC_IDENTIFICATION="en_US.UTF-8"
LC_ALL=en_US.UTF-8
```

## stack log

```
$ stack --version
Version 2.5.1, Git revision d6ab861544918185236cf826cb2028abb266d6d5 (dirty) (8249 commits) x86_64
...
$ stack build
Building all executables for `hls-debug' once. After a successful build of all of them, only specified executables will be rebuilt.
hls-debug> configure (exe)
Configuring hls-debug-0.1.0.0...
hls-debug> build (exe)
Preprocessing executable 'hls-debug' for hls-debug-0.1.0.0..
Building executable 'hls-debug' for hls-debug-0.1.0.0..
[1 of 2] Compiling Lib
[2 of 2] Compiling Main
Linking .stack-work/dist/x86_64-linux-tinfo6/Cabal-3.0.1.0/build/hls-debug/hls-debug ...
hls-debug> copy/register
Installing executable hls-debug in /home/ishiy/tmp/hls-debug/.stack-work/install/x86_64-linux-tinfo6/c5edbd47b0c198b85fbf7c5004bc29839215a5df670df1181884a7dd0709cf8d/8.8.4/bin
$ stack run
こんにちは
```

## hls log

```
$ haskell-language-server-wrapper --version
haskell-language-server version: 0.7.1.0 (GHC: 8.10.1) (PATH: /home/ishiy/.ghcup/bin/haskell-language-server-wrapper-0.7.1) (GIT hash: e4f677e1780fe85a02b99a09404a0a3c3ab5ce7c)
% haskell-language-server-wrapper .
Found "/home/ishiy/tmp/hls-debug/hie.yaml" for "/home/ishiy/tmp/hls-debug/a"
Module "/home/ishiy/tmp/hls-debug/a" is loaded by Cradle: Cradle {cradleRootDir = "/home/ishiy/tmp/hls-debug", cradleOptsProg = CradleAction: Stack}
Run entered for haskell-language-server-wrapper(haskell-language-server-wrapper) Version 0.7.1.0, Git revision e4f677e1780fe85a02b99a09404a0a3c3ab5ce7c (dirty) x86_64 ghc-8.10.1
Current directory: /home/ishiy/tmp/hls-debug
Operating system: linux
Arguments: ["."]
Cradle directory: /home/ishiy/tmp/hls-debug
Cradle type: Stack

Tool versions found on the $PATH
cabal:          3.2.0.0
stack:          2.5.1
ghc:            8.10.2


Consulting the cradle to get project GHC version...
Project GHC version: 8.8.4
haskell-language-server exe candidates: ["haskell-language-server-8.8.4","haskell-language-server-8.8","haskell-language-server"]
Launching haskell-language-server exe at:/home/ishiy/.ghcup/bin/haskell-language-server-8.8.4
haskell-language-server version: 0.7.1.0 (GHC: 8.8.4) (PATH: /home/ishiy/.ghcup/bin/haskell-language-server-8.8.4~0.7.1) (GIT hash: e4f677e1780fe85a02b99a09404a0a3c3ab5ce7c)
(haskell-language-server)Ghcide setup tester in /home/ishiy/tmp/hls-debug.
Report bugs at https://github.com/haskell/haskell-language-server/issues

Tool versions found on the $PATH
cabal:          3.2.0.0
stack:          2.5.1
ghc:            8.10.2


Step 1/4: Finding files to test in /home/ishiy/tmp/hls-debug
Found 3 files

Step 2/4: Looking for hie.yaml files that control setup
Found 1 cradle

Step 3/4: Initializing the IDE

Step 4/4: Type checking the files
[INFO] Consulting the cradle for "src/Lib.hs"
Output from setting up the cradle Cradle {cradleRootDir = "/home/ishiy/tmp/hls-debug", cradleOptsProg = CradleAction: Stack}
> Using main module: 1. Package `hls-debug' component hls-debug:exe:hls-debug with main-is file: /home/ishiy/tmp/hls-debug/src/Main.hs
> hls-debug> configure (exe)
> Configuring hls-debug-0.1.0.0...
> hls-debug> initial-build-steps (exe)
> Configuring GHCi with the following packages: hls-debug
> /home/ishiy/tmp/hls-debug/.stack-work/install/x86_64-linux-tinfo6/c5edbd47b0c198b85fbf7c5004bc29839215a5df670df1181884a7dd0709cf8d/8.8.4/pkgdb:/home/ishiy/.stack/snapshots/x86_64-linux-tinfo6/c5edbd47b0c198b85fbf7c5004bc29839215a5df670df1181884a7dd0709cf8d/8.8.4/pkgdb:/home/ishiy/.stack/programs/x86_64-linux/ghc-tinfo6-8.8.4/lib/ghc-8.8.4/package.conf.d
[INFO] Using interface files cache dir: ghcide
[INFO] Making new HscEnv[main]
[INFO] Consulting the cradle for "Setup.hs"
Output from setting up the cradle Cradle {cradleRootDir = "/home/ishiy/tmp/hls-debug", cradleOptsProg = CradleAction: Stack}
File:     /home/ishiy/tmp/hls-debug/Setup.hs
Hidden:   no
Range:    1:1-2:1
Source:   cradle
Severity: DsError
Message:
  Multi Cradle: No prefixes matched
  pwd: /home/ishiy/tmp/hls-debug
  filepath: /home/ishiy/tmp/hls-debug/Setup.hs
  prefixes:
  ("./src/Main.hs",Stack {component = Just "hls-debug:exe:hls-debug", stackYaml = Nothing})
  ("./src/Lib.hs",Stack {component = Just "hls-debug:exe:hls-debug", stackYaml = Nothing})
File:     /home/ishiy/tmp/hls-debug/src/Main.hs
Hidden:   no
Range:    10:12-10:39
Source:   typecheck
Severity: DsError
Message:
  • Exception when trying to run compile-time code:
  greeting.txt: hGetContents: invalid argument (invalid byte sequence)
  Code: embedFile "greeting.txt"
  • In the untyped splice: $(embedFile "greeting.txt")
[INFO] finish: User TypeCheck (took 0.22s)
Files that failed:
 * /home/ishiy/tmp/hls-debug/Setup.hs
 * /home/ishiy/tmp/hls-debug/src/Main.hs

Completed (1 file worked, 2 files failed)
haskell-language-server-wrapper: callProcess: /home/ishiy/.ghcup/bin/haskell-language-server-8.8.4 "." (exit 2): failed
```

