# This script is used in the release cycle
echo "Sets versioning tags (vX.Y.Z, vX.Y-latest, vX-latest, latest)"
echo "Requires 'rc' (release candidate) tag set"
echo ""
if [$# -ne 3]; then
  echo "ERROR: exactly 3 version components as arguments are required"
  echo "Usage: ./set_tags.sh MAJOR MINOR PATCH"
  echo "Use spaces to delimit version components"
  exit 1
fi
git checkout rc
git tag -f "v$1.$2.$3"
git tag -f "v$1.$2-latest"
git tag -f "v$1-latest"
git tag -f "latest"
git push -f origin "v$1.$2.$3"
git push -f origin "v$1.$2-latest"
git push -f origin "v$1-latest"
git push -f origin "latest"
# get back where HEAD has been before running this script
git checkout -
read -t 5 -p "15 seconds pause..."
