# Rustfmt Completions
complete -c rustfmt -s h -l help -d "Display help message"
complete -c rustfmt -s V -l version -d "Display version"
complete -c rustfmt -l check -d "Run in 'check' mode"
complete -c rustfmt -l emit -r -f -a "files\t'' stdout\t'' coverage\t'' checkstyle\t'' json\t''" -d "What data to emit and how"
complete -c rustfmt -l backup -d "Backup any modified files"
complete -c rustfmt -l config-path -r -d "Recursively searches the ancestors of the input file for rustfmt.toml"
complete -c rustfmt -l edition -r -f -a "2015\t'' 2018\t'' 2021\t''" -d "Rust edition to use"
