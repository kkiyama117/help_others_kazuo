# Kazuo help
スパコン用のShell script 手伝い

## help writtten with Other Language
-> See docs folder( With in Progress)

# Usage
1. スクリプトを走らせる環境を用意
2. Copy this folder
3. 引数にデータを渡す(cat して パイプする、みたいなのがいいかも)

```bash
cat data/created.festa | bash main.sh > result.festa
```

I also create one file version( フォルダ全部用意しなくても `main_one_file.sh` 用意するだけで動く)

```bash
cat data/created.festa | bash main.sh > result.festa
```
## option
- 引数にとってもPipeしても動きます
``` bash
bash ./main.sh ">1 chr1:1-1111111111\nAAAAAAAAAAAAAAAAAA ... NNNN"
cat data/created.festa | sh main.sh
```
- Bash で動く前提ですが, sh 環境で動きます(zshはちょっといじらないと動かないかも) -> `bash ./ main.sh` と `sh ./main.sh` のどっちでも動くはず
- 通常だと標準出力に出力されます. ファイルに保存したいなら `> (ファイルのパス)` で出力先を指定しましょう.
