#!/bin/bash

# Script to update canonical tags and Open Graph URLs to www domain and clean URLs
# For Metro Beat Events SEO canonicalization

echo "Updating canonical tags and Open Graph URLs..."

# Define page mappings: filename -> canonical path
declare -A PAGES=(
    ["index.html"]="/"
    ["services.html"]="/services"
    ["packages.html"]="/packages"
    ["weddings.html"]="/weddings"
    ["quinceanera.html"]="/quinceanera"
    ["gallery.html"]="/gallery"
    ["about.html"]="/about"
    ["contact.html"]="/contact"
    ["quote.html"]="/quote"
    ["privacy-policy.html"]="/privacy-policy"
    ["thank-you.html"]="/thank-you"
    ["woodbridge-va.html"]="/woodbridge-va"
    ["alexandria-va.html"]="/alexandria-va"
    ["arlington-va.html"]="/arlington-va"
    ["fairfax-va.html"]="/fairfax-va"
    ["fredericksburg-va.html"]="/fredericksburg-va"
    ["manassas-va.html"]="/manassas-va"
    ["richmond-va.html"]="/richmond-va"
    ["bethesda-md.html"]="/bethesda-md"
    ["rockville-md.html"]="/rockville-md"
    ["silver-spring-md.html"]="/silver-spring-md"
    ["washington-dc.html"]="/washington-dc"
)

# Function to update a single file
update_file() {
    local file=$1
    local canonical_path=$2
    local canonical_url="https://www.metrobeatevents.com${canonical_path}"
    
    if [ ! -f "$file" ]; then
        echo "  ⚠ File not found: $file"
        return
    fi
    
    echo "  Processing: $file -> $canonical_url"
    
    # Update canonical tag (non-www to www, .html to clean)
    perl -i -pe "s|<link rel=\"canonical\" href=\"https://metrobeatevents.com/[^\"]*\">|<link rel=\"canonical\" href=\"$canonical_url\">|g" "$file"
    
    # Update Open Graph URL (non-www to www, .html to clean)
    perl -i -pe "s|<meta property=\"og:url\" content=\"https://metrobeatevents.com/[^\"]*\">|<meta property=\"og:url\" content=\"$canonical_url\">|g" "$file"
    
    # Update Twitter URL (non-www to www, .html to clean)
    perl -i -pe "s|<meta property=\"twitter:url\" content=\"https://metrobeatevents.com/[^\"]*\">|<meta property=\"twitter:url\" content=\"$canonical_url\">|g" "$file"
    
    # Update schema.org @id if present
    perl -i -pe "s|\"@id\": \"https://metrobeatevents.com[^\"]*\"|\"@id\": \"$canonical_url\"|g" "$file"
    perl -i -pe "s|\"url\": \"https://metrobeatevents.com[^\"]*\"|\"url\": \"$canonical_url\"|g" "$file"
}

# Update files in root directory
for filename in "${!PAGES[@]}"; do
    canonical_path="${PAGES[$filename]}"
    update_file "$filename" "$canonical_path"
done

# Update files in public directory
echo ""
echo "Updating public/ directory..."
for filename in "${!PAGES[@]}"; do
    canonical_path="${PAGES[$filename]}"
    update_file "public/$filename" "$canonical_path"
done

echo ""
echo "✅ Canonical tags and Open Graph URLs updated!"
echo ""
echo "Summary:"
echo "  • All canonical tags now point to https://www.metrobeatevents.com"
echo "  • All URLs use clean format (no .html extension)"
echo "  • Open Graph and Twitter URLs updated"
echo "  • Schema.org URLs updated"
