#!/bin/bash

# Advanced Lighthouse Optimization Script v2
# Addresses remaining issues: render blocking (1,700ms), image delivery (810 KiB), font display (70ms)

echo "Starting advanced performance optimizations..."

# List of main HTML files
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
)

# Function to optimize each file
optimize_file() {
    local file=$1
    echo "Optimizing $file..."
    
    # Backup
    cp "$file" "${file}.bak2"
    
    # 1. Make Google Fonts async to eliminate render blocking
    perl -i -pe 's|<link href="https://fonts.googleapis.com/css2\?family=Inter:wght=400;600;700&display=swap" rel="stylesheet">|<link rel="preload" href="https://fonts.googleapis.com/css2?family=Inter:wght=400;600;700&display=swap" as="style" onload="this.onload=null;this.rel='\''stylesheet'\''"><noscript><link href="https://fonts.googleapis.com/css2?family=Inter:wght=400;600;700&display=swap" rel="stylesheet"></noscript>|g' "$file"
    
    # 2. Add fetchpriority="high" to logo image (LCP element)
    perl -i -pe 's|(<img src="images/Metro_Beat_Main_Logo_Dark_BG.png" alt="Metro Beat Events Logo" class="logo-image" width="266" height="160">)|<img src="images/Metro_Beat_Main_Logo_Dark_BG.png" alt="Metro Beat Events Logo" class="logo-image" width="266" height="160" fetchpriority="high">|g' "$file"
    
    # 3. Add decoding="async" to non-critical images
    perl -i -pe 's|(<img src="images/[^"]*" alt="[^"]*"[^>]*loading="lazy"[^>]*)>|$1 decoding="async">|g' "$file"
    
    echo "✓ Completed $file"
}

# Optimize each file
for file in "${FILES[@]}"; do
    if [ -f "$file" ]; then
        optimize_file "$file"
    fi
done

# Also optimize public directory
echo ""
echo "Optimizing public/ directory..."
for file in "${FILES[@]}"; do
    if [ -f "public/$file" ]; then
        optimize_file "public/$file"
    fi
done

echo ""
echo "✅ Advanced optimizations complete!"
echo ""
echo "Key improvements:"
echo "  • Async Google Fonts loading (eliminates render blocking)"
echo "  • Added fetchpriority='high' to LCP image"
echo "  • Added decoding='async' to lazy-loaded images"
echo ""
echo "Expected improvements:"
echo "  • Render blocking: 1,700ms → <500ms"
echo "  • Font display: 70ms → <20ms"
echo "  • LCP: Faster discovery and rendering"
