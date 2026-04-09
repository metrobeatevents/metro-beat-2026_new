#!/bin/bash

# Script to update canonical tags and Open Graph URLs to www domain and clean URLs

echo "Updating canonical tags and Open Graph URLs..."

# Array of files and their canonical paths
FILES=(
    "index.html:/"
    "services.html:/services"
    "packages.html:/packages"
    "weddings.html:/weddings"
    "quinceanera.html:/quinceanera"
    "gallery.html:/gallery"
    "about.html:/about"
    "contact.html:/contact"
    "quote.html:/quote"
    "privacy-policy.html:/privacy-policy"
    "thank-you.html:/thank-you"
    "woodbridge-va.html:/woodbridge-va"
    "alexandria-va.html:/alexandria-va"
    "arlington-va.html:/arlington-va"
    "fairfax-va.html:/fairfax-va"
    "fredericksburg-va.html:/fredericksburg-va"
    "manassas-va.html:/manassas-va"
    "richmond-va.html:/richmond-va"
    "bethesda-md.html:/bethesda-md"
    "rockville-md.html:/rockville-md"
    "silver-spring-md.html:/silver-spring-md"
    "washington-dc.html:/washington-dc"
)

update_file() {
    local filepath=$1
    local canonical_path=$2
    local canonical_url="https://www.metrobeatevents.com${canonical_path}"
    
    if [ ! -f "$filepath" ]; then
        return
    fi
    
    echo "  $filepath -> $canonical_url"
    
    # Update canonical tag
    sed -i.bak "s|<link rel=\"canonical\" href=\"https://metrobeatevents.com[^\"]*\">|<link rel=\"canonical\" href=\"${canonical_url}\">|g" "$filepath"
    
    # Update Open Graph URL
    sed -i.bak "s|<meta property=\"og:url\" content=\"https://metrobeatevents.com[^\"]*\">|<meta property=\"og:url\" content=\"${canonical_url}\">|g" "$filepath"
    
    # Update Twitter URL
    sed -i.bak "s|<meta property=\"twitter:url\" content=\"https://metrobeatevents.com[^\"]*\">|<meta property=\"twitter:url\" content=\"${canonical_url}\">|g" "$filepath"
    
    # Remove backup file
    rm -f "${filepath}.bak"
}

# Process root directory files
for entry in "${FILES[@]}"; do
    filename="${entry%%:*}"
    path="${entry##*:}"
    update_file "$filename" "$path"
done

# Process public directory files
echo ""
echo "Updating public/ directory..."
for entry in "${FILES[@]}"; do
    filename="${entry%%:*}"
    path="${entry##*:}"
    update_file "public/$filename" "$path"
done

echo ""
echo "✅ Done!"
