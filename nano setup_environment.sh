#!/bin/bash

# 1. Create directories if they don't exist
for dir in logs configs scripts; do
    if [ -d "$dir" ]; then
        echo "Directory already exists: $dir"
    else
        mkdir "$dir"
    fi
done

# 2. Create files with sample content
# logs/system.log
if [ ! -f logs/system.log ]; then
    echo "System log initialized." > logs/system.log
fi

# configs/app.conf
if [ ! -f configs/app.conf ]; then
    echo "# Sample app configuration" > configs/app.conf
fi

# scripts/backup.sh
if [ ! -f scripts/backup.sh ]; then
    cat <<EOL > scripts/backup.sh
#!/bin/bash
echo "Backup started."
EOL
fi

# 3. Modify permissions
chmod 644 logs/system.log
chmod 444 configs/app.conf
chmod 755 scripts/backup.sh

# 4. Display directory structure and permissions
if command -v tree >/dev/null 2>&1; then
    tree
else
    echo "Install 'tree' to see directory structure."
fi

echo "Permissions Overview:"
ls -lR logs configs scripts
