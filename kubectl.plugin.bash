if [[ -n $(basher package-path ahmetb/kubectl-aliases) ]]; then
    . $(basher package-path ahmetb/kubectl-aliases)/.kubectl_aliases

    function kubectl() {
        echo "+ kubectl $@"
        command kubectl $@
    }
fi

