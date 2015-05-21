alias reconfig='source ~/.bashrc'
alias exify='chmod u+x'
alias tmp='cd $(mktemp -d)'

rewrite() {
    echo "" > $1
    nano $1
}
