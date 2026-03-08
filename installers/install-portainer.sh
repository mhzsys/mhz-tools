#!/bin/bash

# clear
# echo '  __  __ _    _ ______ _______     _______ '
# echo ' |  \/  | |  | |___  // ____\ \   / / ____|'
# echo ' | \  / | |__| |  / /| (___  \ \_/ / (___  '
# echo ' | |\/| |  __  | / /  \___ \  \   / \___ \ '
# echo ' | |  | | |  | |/ /__ ____) |  | |  ____) |'
# echo ' |_|  |_|_|  |_/_____|_____/   |_| |_____/ '
./scripts/header-mhzsys.sh
echo '        Portainer Easy Installer '
sleep 1

CURRENTDIR=$(pwd)

echo 'Verifying Docker is installed'
function update_portainer() {
    # === CONFIGURATION ===
    local TARGET_VERSION="2.39.0"  # ← Update this when you want to upgrade
    local PORTAINER_NAME="portainer"
    local CONTAINER_EXISTS=false
    local INSTALLED_VERSION=""

    # === VALIDATE DOCKER ===
    if ! command -v docker >/dev/null 2>&1; then
        echo "❌ Docker is not installed. Please install Docker first."
        return 1
    fi

    # === CHECK IF PORTAINER CONTAINER EXISTS ===
    if docker ps -a --format '{{.Names}}' | grep -qx "$PORTAINER_NAME"; then
        CONTAINER_EXISTS=true
        echo "🔍 Portainer container '$PORTAINER_NAME' found."

        # Get installed version from image tag (e.g., "portainer/portainer-ce:2.38.1")
        local image_tag
        image_tag=$(docker inspect --format '{{.Config.Image}}' "$PORTAINER_NAME" 2>/dev/null | sed -n 's|.*/portainer-ce:\([^:]*\)$|\1|p')

        if [[ -n "$image_tag" ]]; then
            INSTALLED_VERSION="$image_tag"
            echo "📦 Installed Portainer version: $INSTALLED_VERSION"
        else
            echo "⚠️ Could not determine installed version (may be a non-tag image). Proceeding with update."
        fi
    else
        echo "📦 Portainer container not installed."
    fi

    # === VERSION COMPARISON (semantic sort) ===
    local should_update=false
    if [[ -z "$INSTALLED_VERSION" ]]; then
        should_update=true
        echo "ℹ️ No version info — will install/update."
    else
        # Use `sort -V` (version sort) to compare
        if [[ $(printf '%s\n%s' "$INSTALLED_VERSION" "$TARGET_VERSION" | sort -V | tail -n1) == "$TARGET_VERSION" ]] && \
           [[ "$INSTALLED_VERSION" != "$TARGET_VERSION" ]]; then
            should_update=true
            echo "✅ Target version ($TARGET_VERSION) is newer than installed ($INSTALLED_VERSION)."
        else
            echo "✅ Already on latest version ($TARGET_VERSION) — skipping update."
        fi
    fi

    # === UPDATE OR INSTALL ===
    if [[ "$should_update" == true ]]; then
        echo "🔄 Updating Portainer to v$TARGET_VERSION..."

        # Stop & remove existing container
        if [[ "$CONTAINER_EXISTS" == true ]]; then
            echo "🛑 Stopping and removing existing Portainer container..."
            docker stop "$PORTAINER_NAME" 2>/dev/null || true
            docker rm "$PORTAINER_NAME" 2>/dev/null || true
        else
            echo "🚀 Installing Portainer v$TARGET_VERSION..."
        fi

        # Remove old image to save space (optional but recommended)
        local old_image
        old_image=$(docker images --format '{{.Repository}}:{{.Tag}}' | grep "^portainer/portainer-ce" | head -1)
        if [[ -n "$old_image" ]]; then
            echo "🗑️ Removing old Portainer image: $old_image"
            docker rmi "$old_image" 2>/dev/null || echo "⚠️ Failed to remove old image (may still be in use)."
        fi

        # Pull latest image with explicit tag
        echo "📥 Pulling portainer/portainer-ce:$TARGET_VERSION..."
        docker pull "portainer/portainer-ce:$TARGET_VERSION"

        # Create volume (idempotent — safe to run multiple times)
        docker volume create portainer_data 2>/dev/null || true

        # Start new container (note: no sudo needed if user in docker group)
        echo "🚀 Starting new Portainer container..."
        docker run -d \
            -p 8000:8000 \
            -p 9443:9443 \
            --name "$PORTAINER_NAME" \
            --restart=always \
            -v /var/run/docker.sock:/var/run/docker.sock \
            -v portainer_data:/data \
            "portainer/portainer-ce:$TARGET_VERSION"

        # Wait for container to start
        sleep 5

        if docker inspect --format='{{.State.Status}}' "$PORTAINER_NAME" | grep -qx 'running'; then
            echo "✅ Portainer v$TARGET_VERSION successfully updated/installed!"
            echo "🌐 Access Portainer at: https://localhost:9443"
            return 0
        else
            echo "❌ Portainer failed to start. Check logs: docker logs $PORTAINER_NAME"
            return 1
        fi

    else
        echo "✅ No update needed. Portainer is up-to-date at v$INSTALLED_VERSION."
        return 0
    fi
}

# Call the function
update_portainer

cd $CURRENTDIR

# Return to main menu
echo 'press enter to return to menu'
while true
do
  read -s -n 1 key  # -s: do not echo input character. -n 1: read only 1 character (separate with space)

# double brackets to test, single equals sign, empty string for just 'enter' in this case...
# if [[ ... ]] is followed by semicolon and 'then' keyword
  if [[ $key = "" ]]; then 
    # echo 'You pressed enter!'
    ./installers/installer-menu.sh
  else
    echo "'$key' is not a valid option."
  fi
done
