echo "Used in the release cycle"
echo "Sets versioning tags (vX.Y.Z, vX-latest, latest)"
echo "Usage: ./set_tags.sh MAJOR MINOR PATCH"
echo "Use spaces to delimit version components!"
git checkout rc
git tag -f "v$1.$2.$3"
git tag -f "v$1.$2-latest"
git tag -f "v$1-latest"
git tag -f "latest"
git push -f origin "v$1.$2.$3"
git push -f "v$1.$2-latest"
git push -f "v$1-latest"
git push -f "latest"
# get back where HEAD has been before running this script
git checkout -
read -t 5 -p "15 seconds pause..."
