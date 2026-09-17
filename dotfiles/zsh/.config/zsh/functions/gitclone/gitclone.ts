import { Command } from "commander";

const exit = () => process.exit(1);
const program = new Command();

program
    .name("gitclone")
    .description("Clone only specific files or folders from a GitHub repository")
    .argument("<owner and repository>", "owner and repository")
    .argument("<directory>", "output directory")
    .argument("<wanted-files/folders...>", "files and folders to copy")
    .parse();

const [owner_repo, dir, ...wanteds] = program.args;

if (owner_repo.split("/").length !== 2) {
    console.log(
        `echo 'Error: the "owner and repository" argument must bein this format "owner/repository" '`
    );
    exit();
}

const [owner, repo] = owner_repo.split("/");

console.log(`
tmpdir=$(mktemp -d)
trap 'rm -rf "$tmpdir"' EXIT INT TERM

echo "Cloning repository..."

if git clone --depth=1 "https://github.com/${owner}/${repo}" "$tmpdir/${repo}" &>/dev/null; then
    echo "Repository cloned successfully."

    mkdir -p "${dir}" || {
        echo "Failed to create output directory."
  exit 1        
    }

    copied=0

    echo "Checking requested files..."

${wanteds
        .map(
            (w) => `
    if [[ -e "$tmpdir/${repo}/${w}" ]]; then
        mv "$tmpdir/${repo}/${w}" "${dir}/"
        echo "✓ ${w}"
        ((copied++))
    else
        echo "✗ ${w} does not exist"
    fi
`
        )
        .join("\n")}

    if (( copied == 0 )); then
        echo "No requested files or directories were found."
exit 1
fi

    echo
    echo "Copied $copied item(s) successfully."
exit 0
else
    echo "Repository '${owner}/${repo}' does not exist or could not be cloned."
exit 1
fi
`);
