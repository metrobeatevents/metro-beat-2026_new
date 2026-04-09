#!/bin/bash

# Script to update internal navigation links from .html to clean URLs
# For Metro Beat Events SEO canonicalization

echo "Updating internal navigation links to clean URLs..."

# List of HTML files to update
FILES=(
    "index.html"
    "services.html"
    "packages.html"
    "weddings.html"
    "quinceanera.html"
    "gallery.html"
    "about.html"
    "contact.html"
    "quote.html"
    "privacy-policy.html"
    "thank-you.html"
    "woodbridge-va.html"
    "alexandria-va.html"
    "arlington-va.html"
    "fairfax-va.html"
    "fredericksburg-va.html"
    "manassas-va.html"
    "richmond-va.html"
    "bethesda-md.html"
    "rockville-md.html"
    "silver-spring-md.html"
    "washington-dc.html"
)

update_links() {
    local file=$1
    
    if [ ! -f "$file" ]; then
        return
    fi
    
    # Update navigation links (href="page.html" to href="/page")
    sed -i.bak 's|href="index\.html"|href="/"|g' "$file"
    sed -i.bak 's|href="services\.html"|href="/services"|g' "$file"
    sed -i.bak 's|href="packages\.html"|href="/packages"|g' "$file"
    sed -i.bak 's|href="weddings\.html"|href="/weddings"|g' "$file"
    sed -i.bak 's|href="quinceanera\.html"|href="/quinceanera"|g' "$file"
    sed -i.bak 's|href="gallery\.html"|href="/gallery"|g' "$file"
    sed -i.bak 's|href="about\.html"|href="/about"|g' "$file"
    sed -i.bak 's|href="contact\.html"|href="/contact"|g' "$file"
    sed -i.bak 's|href="quote\.html"|href="/quote"|g' "$file"
    sed -i.bak 's|href="privacy-policy\.html"|href="/privacy-policy"|g' "$file"
    sed -i.bak 's|href="thank-you\.html"|href="/thank-you"|g' "$file"
    
    # Update location page links
    sed -i.bak 's|href="woodbridge-va\.html"|href="/woodbridge-va"|g' "$file"
    sed -i.bak 's|href="alexandria-va\.html"|href="/alexandria-va"|g' "$file"
    sed -i.bak 's|href="arlington-va\.html"|href="/arlington-va"|g' "$file"
    sed -i.bak 's|href="fairfax-va\.html"|href="/fairfax-va"|g' "$file"
    sed -i.bak 's|href="fredericksburg-va\.html"|href="/fredericksburg-va"|g' "$file"
    sed -i.bak 's|href="manassas-va\.html"|href="/manassas-va"|g' "$file"
    sed -i.bak 's|href="richmond-va\.html"|href="/richmond-va"|g' "$file"
    sed -i.bak 's|href="bethesda-md\.html"|href="/bethesda-md"|g' "$file"
    sed -i.bak 's|href="rockville-md\.html"|href="/rockville-md"|g' "$file"
    sed -i.bak 's|href="silver-spring-md\.html"|href="/silver-spring-md"|g' "$file"
    sed -i.bak 's|href="washington-dc\.html"|href="/washington-dc"|g' "$file"
    
    # Remove backup file
    rm -f "${file}.bak"
}

# Update root directory files
for file in "${FILES[@]}"; do
    echo "  Updating: $file"
    update_links "$file"
done

# Update public directory files
echo ""
echo "Updating public/ directory..."
for file in "${FILES[@]}"; do
    echo "  Updating: public/$file"
    update_links "public/$file"
done

echo ""
echo "✅ Internal navigation links updated to clean URLs!"
