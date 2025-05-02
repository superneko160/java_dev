# Java_dev

Java環境をWSL上でNixを使って構築

## Setup

### WSL上にパッケージマネージャとしてのNixをインストール

```sh
curl -L https://nixos.org/nix/install | sh
```

### `flake.nix`をもとにJava環境を構築

```sh
nix develop  --experimental-features 'nix-command flakes'
```

## Compile

```sh
javac Hello.java
```

## Run

```sh
java Hello
```
