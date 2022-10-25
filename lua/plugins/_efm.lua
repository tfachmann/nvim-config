local efm = {};

efm.black = {
    formatCommand = "black --fast ${-l:lineLength} -",
    formatStdin = true,
}

efm.isort = {
    formatCommand = "isort --stdout ${-l:lineLength} --profile black -",
    formatStdin = true,
}

efm.mypy = {
    lintCommand = "mypy --show-column-numbers --ignore-missing-imports --show-error-codes",
    lintFormats = {
        "%f:%l:%c: %trror: %m",
        "%f:%l:%c: %tarning: %m",
        "%f:%l:%c: %tote: %m",
    },
    lintSource = "mypy",
}

efm.flake8 = {
    lintCommand = "flake8 --max-line-length 160 --format '%(path)s:%(row)d:%(col)d: %(code)s %(code)s %(text)s' --stdin-display-name ${INPUT} -",
    lintStdin = true,
    lintIgnoreExitCode = true,
    lintFormats = { "%f:%l:%c: %t%n%n%n %m" },
    lintSource = "flake8",
}

return efm
