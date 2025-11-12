<!-- markdownlint-disable-next-line -->
<div align="center">

  <!-- markdownlint-disable-next-line -->
  # Chirpy Jekyll Theme

  A minimal, responsive, and feature-rich Jekyll theme for technical writing.

  [![Open in Dev Containers](https://img.shields.io/static/v1?label=Dev%20Containers&logo=visualstudiocode&message=Open&color=deepskyblue)][open-container]&nbsp;
  [![Gem Version](https://img.shields.io/gem/v/jekyll-theme-chirpy?&logo=RubyGems&logoColor=ghostwhite&label=gem&color=tomato)][gem]&nbsp;
  [![GitHub license](https://img.shields.io/github/license/cotes2020/jekyll-theme-chirpy)][license]&nbsp;
  [![CI](https://img.shields.io/github/actions/workflow/status/cotes2020/jekyll-theme-chirpy/ci.yml?logo=github)][ci]&nbsp;
  [![Codacy Badge](https://app.codacy.com/project/badge/Grade/4e556876a3c54d5e8f2d2857c4f43894)][codacy]

  [**Live Demo** →][demo]

  [![Devices Mockup](https://chirpy-img.netlify.app/commons/devices-mockup.png)][demo]

</div>

## Features

- Dark Theme
- Localized UI language
- Pinned Posts on Home Page
- Hierarchical Categories
- Trending Tags
- Table of Contents
- Last Modified Date
- Syntax Highlighting
- Mathematical Expressions
- Mermaid Diagrams & Flowcharts
- Dark Mode Images
- Embed Media
- Comment Systems
- Built-in Search
- Atom Feeds
- PWA
- Web Analytics
- SEO & Performance Optimization

## Documentation

To learn how to use, develop, and upgrade the project, please refer to the [Wiki][wiki].

## Deployment

This repository includes a GitHub Actions workflow that builds the Jekyll site and (optionally) publishes it to the `gh-pages` branch so GitHub Pages can serve the generated site.

- Workflow path: `.github/workflows/jekyll-build.yml`
- The workflow runs on push to `master`/`main` and on pull requests. It performs these steps:
  1. Installs Ruby and project gems (Bundler).  
  2. Runs `bundle exec jekyll build` to generate `_site`.  
  3. Uploads `_site` as an artifact.  
  4. Deploys `_site` to the `gh-pages` branch using `peaceiris/actions-gh-pages` (uses `GITHUB_TOKEN`).

How to trigger and verify the build

- Push your branch to GitHub (or open a PR). The workflow will run automatically.  
- On GitHub: Repository → Actions → choose the workflow run to inspect logs.  
- After a successful run the `site` artifact is available in the run page. Download it to inspect the generated HTML.

To publish using GitHub Pages

1. After the workflow creates/updates the `gh-pages` branch, open your repository on GitHub → Settings → Pages and ensure the source is set to the `gh-pages` branch (root). GitHub will publish the site at your repository Pages URL.
2. If you prefer automatic publishing without visiting settings, the workflow already publishes to `gh-pages` using `GITHUB_TOKEN` — GitHub Pages will pick it up automatically in most cases.

Local build (no-admin guidance)

If you prefer to build locally but cannot run admin installers, try a per-user gem install and run Jekyll from the repository. These commands are for Command Prompt (cmd.exe) or PowerShell when Ruby is already available.

Check Ruby/gem availability:

```powershell
ruby -v
gem -v
```

Install Bundler and Jekyll into your user gem directory:

```powershell
gem install --user-install bundler jekyll
# Optionally configure bundler to install to project-local folder:
bundle config set --local path 'vendor/bundle'
bundle install --jobs 4 --retry 3
```

Make the per-user gem bin directory available in the current session (example for cmd.exe):

```cmd
set GEM_HOME=%USERPROFILE%\.gem\ruby\<ruby_version>
set PATH=%USERPROFILE%\.gem\ruby\<ruby_version>\bin;%PATH%
# replace <ruby_version> with the folder name under %USERPROFILE%\.gem\ruby\
```

Build the site locally:

```powershell
bundle exec jekyll build
# or serve locally:
bundle exec jekyll serve --livereload
```

Notes
- If Ruby is not installed and you cannot run an installer due to admin restrictions, use the GitHub Actions workflow (no local tools required).  
- The CI workflow already included in this repo provides a convenient way to verify generated output and publish to GitHub Pages without local setup.

## Contributing

Contributions (_pull requests_, _issues_, and _discussions_) are what make the open-source community such an amazing place
to learn, inspire, and create. Any contributions you make are greatly appreciated.
For details, see the "[Contributing Guidelines][contribute-guide]".

## Credits

### Contributors

Thanks to [all the contributors][contributors] involved in the development of the project!

[![all-contributors](https://contrib.rocks/image?repo=cotes2020/jekyll-theme-chirpy&columns=16)][contributors]
<sub> — Made with [contrib.rocks](https://contrib.rocks)</sub>

### Third-Party Assets

This project is built on the [Jekyll][jekyllrb] ecosystem and some [great libraries][lib], and is developed using [VS Code][vscode] as well as tools provided by [JetBrains][jetbrains] under a non-commercial open-source software license.

The avatar and favicon for the project's website are from [ClipartMAX][clipartmax].

## License

This project is published under [MIT License][license].

[gem]: https://rubygems.org/gems/jekyll-theme-chirpy
[ci]: https://github.com/cotes2020/jekyll-theme-chirpy/actions/workflows/ci.yml?query=event%3Apush+branch%3Amaster
[codacy]: https://app.codacy.com/gh/cotes2020/jekyll-theme-chirpy/dashboard?utm_source=gh&utm_medium=referral&utm_content=&utm_campaign=Badge_grade
[license]: https://github.com/cotes2020/jekyll-theme-chirpy/blob/master/LICENSE
[open-container]: https://vscode.dev/redirect?url=vscode://ms-vscode-remote.remote-containers/cloneInVolume?url=https://github.com/cotes2020/jekyll-theme-chirpy
[jekyllrb]: https://jekyllrb.com/
[clipartmax]: https://www.clipartmax.com/middle/m2i8b1m2K9Z5m2K9_ant-clipart-childrens-ant-cute/
[demo]: https://cotes2020.github.io/chirpy-demo/
[wiki]: https://github.com/cotes2020/jekyll-theme-chirpy/wiki
[contribute-guide]: https://github.com/cotes2020/jekyll-theme-chirpy/blob/master/docs/CONTRIBUTING.md
[contributors]: https://github.com/cotes2020/jekyll-theme-chirpy/graphs/contributors
[lib]: https://github.com/cotes2020/chirpy-static-assets
[vscode]: https://code.visualstudio.com/
[jetbrains]: https://www.jetbrains.com/?from=jekyll-theme-chirpy
