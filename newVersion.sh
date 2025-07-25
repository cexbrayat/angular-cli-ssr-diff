#!/bin/bash

set -e

versions=$(npm view @angular/cli versions --json)

versions=${versions//\"/}
versions=${versions//\[/}
versions=${versions//\]/}
versions=${versions//\,/}

versions=(${versions})

blocklist=(1.0.0-beta.28.3 1.0.0-beta.29 1.0.0-beta.30 1.0.0-beta.31 1.0.0-beta.32
1.0.0-beta.32.2 1.0.0-beta.32.3 1.0.0-beta.33 1.0.0-beta.33.1
1.0.0-rc.0 1.0.0-rc.1 1.0.0-rc.2 1.0.0-rc.3 1.0.0-rc.4
1.0.0 1.0.1 1.0.2 1.0.3 1.0.4 1.0.5 1.0.6
1.1.0-beta.0 1.1.0-beta.1 1.1.0-rc.0 1.1.0-rc.1 1.1.0-rc.2
1.1.0 1.1.1 1.1.2 1.1.3
1.2.0-beta.0 1.2.0-beta.1 1.2.0-rc.0 1.2.0-rc.1
1.2.0 1.2.1 1.2.2 1.2.3 1.2.4 1.2.5 1.2.6 1.2.7 1.2.8
1.3.0-beta.0 1.3.0-beta.1
1.3.0-rc.0 1.3.0-rc.1 1.3.0-rc.2 1.3.0-rc.3 1.3.0-rc.4 1.3.0-rc.5
1.3.0 1.3.1 1.3.2
1.4.0-beta.0 1.4.0-beta.1 1.4.0-beta.2
1.4.0-rc.0 1.4.0-rc.1 1.4.0-rc.2
1.4.0 1.4.1 1.4.2 1.4.3 1.4.4 1.4.5 1.4.6 1.4.7 1.4.8 1.4.9 1.4.10
1.5.0-beta.0 1.5.0-beta.1 1.5.0-beta.2 1.5.0-beta.3 1.5.0-beta.4
1.5.0-rc.0 1.5.0-rc.1 1.5.0-rc.2 1.5.0-rc.3 1.5.0-rc.4 1.5.0-rc.5 1.5.0-rc.6 1.5.0-rc.7 1.5.0-rc.8
1.5.0 1.5.1 1.5.2 1.5.3 1.5.4 1.5.5 1.5.6
1.6.0-beta.0 1.6.0-beta.1 1.6.0-beta.2
1.6.0-rc.0 1.6.0-rc.1 1.6.0-rc.2
1.6.0 1.6.1 1.6.2 1.6.3 1.6.4 1.6.5 1.6.6 1.6.7 1.6.8
1.7.0-beta.0 1.7.0-beta.1 1.7.0-beta.2 1.7.0-beta.3
1.7.0-rc.0
1.7.0 1.7.1 1.7.2 1.7.3 1.7.4
6.0.0-beta.2 6.0.0-beta.3 6.0.0-beta.4 6.0.0-beta.5 6.0.0-beta.6 6.0.0-beta.7 6.0.0-beta.8 6.0.0-beta.9
6.0.0-rc.0 6.0.0-rc.1 6.0.0-rc.2 6.0.0-rc.3 6.0.0-rc.4 6.0.0-rc.5 6.0.0-rc.6 6.0.0-rc.7 6.0.0-rc.8 6.0.0-rc.9 6.0.0-rc.10
6.0.0 6.0.1 6.0.2 6.0.3 6.0.4 6.0.5 6.0.7 6.0.8
6.1.0-beta.0 6.1.0-beta.2
6.1.0-rc.0 6.1.0-rc.1 6.1.0-rc.2 6.1.0-rc.3
6.1.0 6.1.1 6.1.2 6.1.3 6.1.4 6.1.5
6.2.0-beta.0 6.2.0-beta.1 6.2.0-beta.2 6.2.0-beta.3
6.2.0-rc.0 6.2.0-rc.1
6.2.0 6.2.1 6.2.2 6.2.3 6.2.4 6.2.5 6.2.6 6.2.7 6.2.8 6.2.9
7.0.0-beta.0 7.0.0-beta.1 7.0.0-beta.2 7.0.0-beta.3 7.0.0-beta.4
7.0.0-rc.0 7.0.0-rc.1 7.0.0-rc.2 7.0.0-rc.3
7.0.1 7.0.2 7.0.3 7.0.4 7.0.5 7.0.6 7.0.7
7.1.0-beta.0 7.1.0-beta.1 7.1.0-rc.0
7.1.0 7.1.1 7.1.2 7.1.3 7.1.4
7.2.0-beta.0 7.2.0-beta.1 7.2.0-beta.2 7.2.0-rc.0
7.2.0 7.2.1 7.2.2 7.2.3 7.2.4
7.3.0-beta.0 7.3.0-rc.0
7.3.0 7.3.1 7.3.2 7.3.3 7.3.4 7.3.5 7.3.6 7.3.7 7.3.8 7.3.9 7.3.10
8.0.0-beta.0 8.0.0-beta.1 8.0.0-beta.2 8.0.0-beta.4 8.0.0-beta.5 8.0.0-beta.6 8.0.0-beta.7
8.0.0-beta.8 8.0.0-beta.9 8.0.0-beta.10 8.0.0-beta.11 8.0.0-beta.12 8.0.0-beta.13 8.0.0-beta.14
8.0.0-beta.15 8.0.0-beta.16 8.0.0-beta.17 8.0.0-beta.18
8.0.0-rc.0 8.0.0-rc.1 8.0.0-rc.2 8.0.0-rc.3 8.0.0-rc.4
8.0.0 8.0.1 8.0.2 8.0.3 8.0.4 8.0.5 8.0.6
8.1.0-beta.0 8.1.0-beta.1 8.1.0-beta.2 8.1.0-beta.3 8.1.0-rc.0 8.1.0 8.1.1 8.1.2 8.1.3
8.2.0-next.0 8.2.0-next.1 8.2.0-rc.0 8.2.0 8.2.1 8.2.2
8.3.0-next.0 8.3.0-next.1 8.3.0-next.2 8.3.0-rc.0
8.3.0 8.3.1 8.3.2 8.3.3 8.3.4 8.3.5 8.3.6 8.3.7 8.3.8 8.3.9 8.3.10 8.3.12 8.3.13
8.3.14 8.3.15 8.3.16 8.3.17 8.3.18 8.3.19 8.3.20 8.3.21 8.3.22 8.3.23 8.3.24 8.3.25 8.3.26 8.3.27 8.3.28 8.3.29
9.0.0-next.0 9.0.0-next.1 9.0.0-next.2 9.0.0-next.3 9.0.0-next.4 9.0.0-next.5 9.0.0-next.6 9.0.0-next.7 9.0.0-next.8 9.0.0-next.9
9.0.0-next.10 9.0.0-next.11 9.0.0-next.12 9.0.0-next.13 9.0.0-next.14 9.0.0-next.15 9.0.0-next.16 9.0.0-next.17 9.0.0-next.18 9.0.0-next.19
9.0.0-rc.0 9.0.0-rc.1 9.0.0-rc.2 9.0.0-rc.3 9.0.0-rc.4 9.0.0-rc.5 9.0.0-rc.6 9.0.0-rc.7 9.0.0-rc.8 9.0.0-rc.9 9.0.0-rc.10 9.0.0-rc.11 9.0.0-rc.12 9.0.0-rc.13 9.0.0-rc.14
9.0.0 9.0.1 9.0.2 9.0.3 9.0.4 9.0.5 9.0.6 9.0.7
9.1.0-next.0 9.1.0-next.1 9.1.0-next.2 9.1.0-next.3 9.1.0-next.4 9.1.0-rc.0
9.1.0 9.1.1 9.1.2 9.1.3 9.1.4 9.1.5 9.1.6 9.1.7 9.1.8 9.1.9 9.1.10 9.1.11 9.1.12 9.1.13 9.1.14 9.1.15
10.0.0-next.0 10.0.0-next.1 10.0.0-next.2 10.0.0-next.3 10.0.0-next.4 10.0.0-next.5 10.0.0-next.6 10.0.0-rc.0 10.0.0-rc.1 10.0.0-rc.2 10.0.0-rc.3 10.0.0-rc.4 10.0.0-rc.5
10.0.0 10.0.1 10.0.2 10.0.3 10.0.4 10.0.5 10.0.6 10.0.7 10.0.8
10.1.0-next.0 10.1.0-next.1 10.1.0-next.2 10.1.0-next.3 10.1.0-next.4 10.1.0-next.5 10.1.0-next.6 10.1.0-next.7 10.1.0-rc.0
10.1.0 10.1.1 10.1.2 10.1.3 10.1.4 10.1.5 10.1.6 10.1.7
10.2.0 10.2.1 10.2.2 10.2.3 10.2.4
11.0.0-next.0 11.0.0-next.1 11.0.0-next.2 11.0.0-next.3 11.0.0-next.4 11.0.0-next.5 11.0.0-next.6 11.0.0-next.7
11.0.0-rc.0 11.0.0-rc.1 11.0.0-rc.2 11.0.0-rc.3
11.0.0 11.0.1 11.0.2 11.0.3 11.0.4 11.0.5 11.0.6 11.0.7
11.1.0-next.0 11.1.0-next.1 11.1.0-next.2 11.1.0-next.3 11.1.0-next.4 11.1.0-rc.0
11.1.0 11.1.1 11.1.2 11.1.3 11.1.4
11.2.0-next.0 11.2.0-rc.0 11.2.0-rc.1
11.2.0 11.2.1 11.2.2 11.2.3 11.2.4 11.2.5 11.2.6 11.2.7 11.2.8 11.2.9 11.2.10 11.2.11 11.2.12 11.2.13 11.2.14 11.2.15 11.2.16 11.2.17 11.2.18 11.2.19
12.0.0-next.0 12.0.0-next.1 12.0.0-next.2 12.0.0-next.3 12.0.0-next.4 12.0.0-next.5 12.0.0-next.6 12.0.0-next.7 12.0.0-next.8 12.0.0-next.9 12.0.0-rc.0 12.0.0-rc.1 12.0.0-rc.2 12.0.0-rc.3
12.0.0 12.0.1 12.0.2 12.0.3 12.0.4 12.0.5
12.1.0-next.2 12.1.0-next.3 12.1.0-next.4 12.1.0-next.5 12.1.0-next.6
12.1.0 12.1.1 12.1.2 12.1.3 12.1.4
12.2.0-next.0 12.2.0-next.2 12.2.0-next.3 12.2.0-rc.0
12.2.0 12.2.1 12.2.2 12.2.3 12.2.4 12.2.5 12.2.6 12.2.7 12.2.8 12.2.9 12.2.10 12.2.11 12.2.12 12.2.13 12.2.14 12.2.15 12.2.16 12.2.17 12.2.18
13.0.0-next.0 13.0.0-next.1 13.0.0-next.2 13.0.0-next.3 13.0.0-next.4 13.0.0-next.5 13.0.0-next.6 13.0.0-next.7 13.0.0-next.8 13.0.0-next.9
13.0.0-rc.0 13.0.0-rc.1 13.0.0-rc.2 13.0.0-rc.3
13.0.0 13.0.1 13.0.2 13.0.3 13.0.4
13.1.0-next.0 13.1.0-next.1 13.1.0-next.2 13.1.0-next.3 13.1.0-rc.0
13.1.0 13.1.1 13.1.2 13.1.3 13.1.4
13.2.0-next.0 13.2.0-next.1 13.2.0-next.2 13.2.0-rc.0 13.2.0-rc.1
13.2.0 13.2.1 13.2.2 13.2.3 13.2.4 13.2.5 13.2.6
13.3.0 13.3.1 13.3.2 13.3.3 13.3.4 13.3.5 13.3.6 13.3.7 13.3.8 13.3.9 13.3.10 13.3.11
14.0.0-next.0 14.0.0-next.1 14.0.0-next.2 14.0.0-next.3 14.0.0-next.4 14.0.0-next.5 14.0.0-next.6 14.0.0-next.7 14.0.0-next.8 14.0.0-next.9 14.0.0-next.10 14.0.0-next.11 14.0.0-next.12 14.0.0-next.13
14.0.0-rc.0 14.0.0-rc.1 14.0.0-rc.2 14.0.0-rc.3
14.0.0 14.0.1 14.0.2 14.0.3 14.0.4 14.0.5 14.0.6 14.0.7
14.1.0-next.0 14.1.0-next.1 14.1.0-next.2 14.1.0-next.3 14.1.0-next.4 14.1.0-rc.0 14.1.0-rc.1 14.1.0-rc.2 14.1.0-rc.3
14.1.0 14.1.1 14.1.2 14.1.3
14.2.0-next.0 14.2.0-next.1 14.2.0-next.2 14.2.0-rc.0
14.2.0 14.2.1 14.2.2 14.2.3 14.2.4 14.2.5 14.2.6 14.2.7 14.2.8 14.2.9 14.2.10 14.2.11 14.2.12 14.2.13
15.0.0-next.0 15.0.0-next.1 15.0.0-next.2 15.0.0-next.3 15.0.0-next.4 15.0.0-next.5 15.0.0-next.6
15.0.0-rc.0 15.0.0-rc.1 15.0.0-rc.2 15.0.0-rc.3 15.0.0-rc.4 15.0.0-rc.5
15.0.0 15.0.1 15.0.2 15.0.3 15.0.4 15.0.5
15.1.0-next.0 15.1.0-next.1 15.1.0-next.2 15.1.0-next.3 15.1.0-rc.0
15.1.0 15.1.1 15.1.2 15.1.3 15.1.4 15.1.5 15.1.6
15.2.0-next.0 15.2.0-next.1 15.2.0-next.2 15.2.0-next.3 15.2.0-next.4 15.2.0-rc.0
15.2.0 15.2.1 15.2.2 15.2.3 15.2.4 15.2.5 15.2.6 15.2.7 15.2.8 15.2.9 15.2.10 15.2.11
16.0.0-next.0 16.0.0-next.1 16.0.0-next.2 16.0.0-next.3 16.0.0-next.4 16.0.0-next.5 16.0.0-next.6 16.0.0-next.7
16.0.0-rc.0 16.0.0-rc.1 16.0.0-rc.2 16.0.0-rc.3 16.0.0-rc.4
16.0.0 16.0.1 16.0.2 16.0.3 16.0.4 16.0.5 16.0.6
16.1.0-next.0 16.1.0-next.1 16.1.0-next.2 16.1.0-rc.0
16.1.0 16.1.1 16.1.2 16.1.3 16.1.4 16.1.5 16.1.6 16.1.7 16.1.8
16.2.0-next.0 16.2.0-next.1 16.2.0-next.2 16.2.0-next.3 16.2.0-next.4
16.2.0-rc.0 16.2.0-rc.1
16.2.0 16.2.1 16.2.2 16.2.3 16.2.4 16.2.5 16.2.6 16.2.7 16.2.8 16.2.9 16.2.10 16.2.11 16.2.12 16.2.13 16.2.14 16.2.15 16.2.16
17.0.0-next.0 17.0.0-next.1 17.0.0-next.2 17.0.0-next.3 17.0.0-next.4 17.0.0-next.5 17.0.0-next.6)

lastVersion="17.0.0-next.6"
rebaseNeeded=false

for version in "${versions[@]}"
do

  echo "Processing ${version}"

  # --ssr is only applicable for version > 17.0.0-next.6
  if [[ " ${blocklist[@]} " =~ " ${version} " ]]
  then
    echo "Skipping blocklisted ${version}"
    continue
  fi

  if [ `git branch --list ${version}` ] || [ `git branch --list --remote origin/${version}` ]
  then
    echo "${version} already generated."
    git checkout ${version}
    if [ ${rebaseNeeded} = true ]
    then
      git rebase --onto ${lastVersion} HEAD~ ${version} -X theirs
      diffStat=`git --no-pager diff HEAD~ --shortstat`
      git push origin ${version} -f
      diffUrl="[${lastVersion}...${version}](https://github.com/cexbrayat/angular-cli-ssr-diff/compare/${lastVersion}...${version})"
      git checkout master
      # rewrite stats in README after rebase
      sed -i.bak -e "/^${version}|/ d" README.md && rm README.md.bak
      sed -i.bak -e 's/----|----|----/----|----|----\
NEWLINE/g' README.md && rm README.md.bak
      sed -i.bak -e "s@NEWLINE@${version}|${diffUrl}|${diffStat}@" README.md && rm README.md.bak
      git commit -a --amend --no-edit
      git checkout ${version}
    fi
    lastVersion=${version}
    continue
  fi

  echo "Generate ${version}"
  rebaseNeeded=true
  git checkout -b ${version}
  # delete app
  rm -rf ponyracer
  # generate lib with new CLI version
  flags="--no-interactive --ssr --skip-install"
    # --server-routing is only applicable for version >=19.0.0-rc.3 and <20.0.0-next.2
  if [ `npx semver ${version} --include-prerelease --range ">=19.0.0-rc.3"` ] && [ `npx semver ${version} --include-prerelease --range "<20.0.0-next.2"` ]
  then
    flags="${flags} --server-routing"
  fi
  npx --yes @angular/cli@${version} new ponyracer ${flags}
  # if there is a package-lock.json, remove it
  if [ -f package-lock.json ]
  then
    rm package-lock.json
  fi
  git add ponyracer
  git commit -am "chore: version ${version}"
  diffStat=`git --no-pager diff HEAD~ --shortstat`
  git push origin ${version} -f
  git checkout master
  diffUrl="[${lastVersion}...${version}](https://github.com/cexbrayat/angular-cli-ssr-diff/compare/${lastVersion}...${version})"
  # insert a row in the version table of the README
  sed -i.bak "/^${version}|/ d" README.md && rm README.md.bak
  sed -i.bak 's/----|----|----/----|----|----\
NEWLINE/g' README.md && rm README.md.bak
  sed -i.bak "s@NEWLINE@${version}|${diffUrl}|${diffStat}@" README.md && rm README.md.bak
  # commit
  git commit -a --amend --no-edit
  git checkout ${version}
  lastVersion=${version}

done

git checkout master
git push origin master -f
