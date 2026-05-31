# Cargo-fmt (part of rustfmt)
complete -c cargo-fmt -s h -l help -d "Display help message"
complete -c cargo-fmt -s V -l version -d "Display version"
complete -c cargo-fmt -s v -l verbose -d "Use verbose output"
complete -c cargo-fmt -s q -l quiet -d "No output printed to stdout"
complete -c cargo-fmt -l package -s p -r -d "Format only the specified packages"
complete -c cargo-fmt -l all -d "Format all packages"
complete -c cargo-fmt -l check -d "Run in 'check' mode"
