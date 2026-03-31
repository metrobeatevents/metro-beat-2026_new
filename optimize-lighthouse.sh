#!/bin/bash

# Lighthouse Optimization Script for Metro Beat Events
# This script applies performance optimizations to all HTML files

echo "Starting Lighthouse optimization..."

# List of HTML files to optimize (excluding node_modules and DEPLOY_VERSION_C)
FILES=(
    "index.html"
    "services.html"
    "contact.html"
    "about.html"
    "packages.html"
    "weddings.html"
    "quinceanera.html"
    "quote.html"
    "gallery.html"
    "woodbridge-va.html"
    "alexandria-va.html"
    "arlington-va.html"
    "fairfax-va.html"
    "manassas-va.html"
    "richmond-va.html"
    "fredericksburg-va.html"
    "washington-dc.html"
    "silver-spring-md.html"
    "bethesda-md.html"
    "rockville-md.html"
)

# Function to optimize a single file
optimize_file() {
    local file=$1
    echo "Optimizing $file..."
    
    # Backup original file
    cp "$file" "${file}.bak"
    
    # 1. Add preload for critical CSS (if not already present)
    if ! grep -q "preload.*style-version-c.css" "$file"; then
        perl -i -pe 's|(<link rel="stylesheet" href="css/style-version-c.css">)|<link rel="preload" href="css/style-version-c.css" as="style">\n    $1|' "$file"
    fi
    
    # 2. Add preconnect to CDN (if not already present)
    if ! grep -q 'preconnect.*cdn.jsdelivr.net' "$file"; then
        perl -i -pe 's|(    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>)|$1\n    <link rel="preconnect" href="https://cdn.jsdelivr.net">|' "$file"
    fi
    
    # 3. Optimize Google Fonts - reduce font weights
    perl -i -pe 's|family=Inter:wght@300;400;500;600;700;800|family=Inter:wght@400;600;700|g' "$file"
    
    # 4. Add defer to main.js if not present
    perl -i -pe 's|<script src="js/main.js"></script>|<script src="js/main.js" defer></script>|g' "$file"
    
    # 5. Add main landmark if not present
    if ! grep -q "<main>" "$file"; then
        # Add <main> after </header>
        perl -i -pe 's|(    </header>)|$1\n\n    <main>|' "$file"
        # Add </main> before <footer>
        perl -i -pe 's|(    <!-- Footer -->)|    </main>\n\n$1|' "$file"
    fi
    
    echo "✓ Completed $file"
}

# Optimize each file
for file in "${FILES[@]}"; do
    if [ -f "$file" ]; then
        optimize_file "$file"
    else
        echo "⚠ File not found: $file"
    fi
done

# Also optimize public directory files
echo ""
echo "Optimizing public/ directory..."
for file in "${FILES[@]}"; do
    if [ -f "public/$file" ]; then
        optimize_file "public/$file"
    fi
done

echo ""
echo "✅ Lighthouse optimization complete!"
echo ""
echo "Key improvements applied:"
echo "  • Preload critical CSS"
echo "  • Preconnect to external domains"
echo "  • Optimized Google Fonts (reduced font weights)"
echo "  • Deferred JavaScript loading"
echo "  • Added <main> landmark for accessibility"
echo ""
echo "Next steps:"
echo "  1. Test locally to ensure no visual regressions"
echo "  2. Run Lighthouse again to verify improvements"
echo "  3. Deploy to production"
echo ""
echo "Backup files created with .bak extension"
