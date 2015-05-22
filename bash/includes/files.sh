alias reconfig='source ~/.bashrc'
alias exify='chmod u+x'
alias gpgify='gpg --encrypt --recipient $GPGKEY --trust-model always'
alias tmp='cd $(mktemp -d)'

rewrite() {
    echo "" > $1
    nano $1
}
