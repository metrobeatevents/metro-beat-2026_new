# Image Optimization Guide

## Current Issue
Lighthouse reports **810 KiB potential savings** from image optimization.

## Quick Wins (No Code Changes Needed)

### Option 1: Use Online Tools (Easiest)
1. **TinyPNG** (https://tinypng.com/)
   - Upload your JPEG images
   - Download compressed versions
   - Replace originals in `/images/` folder
   - Expected savings: 60-80%

2. **Squoosh** (https://squoosh.app/)
   - Google's image compression tool
   - Convert JPEG → WebP for better compression
   - Adjust quality slider to 80-85%

### Option 2: Automated Script (Recommended)

Install ImageMagick (if not already installed):
```bash
brew install imagemagick webp
```

Then run this script to optimize all images:

```bash
#!/bin/bash
# Image optimization script

cd images

# Create backup
mkdir -p ../images-backup
cp *.jpeg *.jpg *.png ../images-backup/ 2>/dev/null

# Optimize JPEG images (reduce quality to 85%, strip metadata)
for img in *.jpeg *.jpg; do
    if [ -f "$img" ]; then
        echo "Optimizing $img..."
        convert "$img" -quality 85 -strip "$img"
    fi
done

# Optimize PNG images
for img in *.png; do
    if [ -f "$img" ]; then
        echo "Optimizing $img..."
        convert "$img" -strip "$img"
    fi
done

echo "✅ Image optimization complete!"
echo "Backup saved in images-backup/"
```

### Option 3: Convert to WebP (Best Performance)

WebP provides 25-35% better compression than JPEG.

```bash
#!/bin/bash
cd images

# Convert all JPEG to WebP
for img in *.jpeg *.jpg; do
    if [ -f "$img" ]; then
        filename="${img%.*}"
        echo "Converting $img to WebP..."
        cwebp -q 85 "$img" -o "${filename}.webp"
    fi
done
```

Then update HTML to use WebP with JPEG fallback:
```html
<!-- Before -->
<img src="images/first_dance.jpeg" alt="..." width="600" height="400">

<!-- After -->
<picture>
  <source srcset="images/first_dance.webp" type="image/webp">
  <img src="images/first_dance.jpeg" alt="..." width="600" height="400">
</picture>
```

## Priority Images to Optimize

Based on file sizes, optimize these first:

1. **Hero/LCP Images:**
   - `Metro_Beat_Main_Logo_Dark_BG.png` (logo - appears on every page)
   - Any hero background images

2. **Gallery Images:**
   - `dj_od_spinning.jpeg`
   - `large_event_lighting.jpeg`
   - `kids_dancing.jpeg`
   - `dj_od_atwork.jpeg`
   - `lights.jpeg`
   - `event_atmosphere.jpeg`
   - `event_party.jpeg`
   - `metro_beat_get_on_the_floor.jpeg`
   - `table_setup.jpeg`

3. **Content Images:**
   - `first_dance.jpeg`
   - `DJ_O_D.jpeg`
   - `dj_od_all_smiles.jpeg`
   - `event_setup.jpeg`
   - `smoke_show_wedding.jpeg`
   - `primer_baile.jpeg`

## Recommended Settings

- **JPEG Quality:** 80-85 (sweet spot for web)
- **WebP Quality:** 85 (better compression than JPEG)
- **Max Width:** 1920px (no need for larger on web)
- **Strip Metadata:** Yes (removes EXIF data)

## Expected Results

After optimization:
- **File size reduction:** 60-80%
- **Lighthouse savings:** 810 KiB → ~200 KiB
- **Performance score:** +5-10 points
- **LCP improvement:** 0.5-1.0s faster

## Quick Command (All-in-One)

```bash
# Install tools
brew install imagemagick webp

# Backup images
cp -r images images-backup

# Optimize all images
cd images
for img in *.jpeg *.jpg; do
    [ -f "$img" ] && convert "$img" -quality 85 -strip -resize '1920x1920>' "$img"
done

for img in *.png; do
    [ -f "$img" ] && convert "$img" -strip "$img"
done

echo "Done! Check file sizes with: du -sh *"
```

## Verification

After optimization, check file sizes:
```bash
cd images
du -h *.jpeg *.jpg *.png | sort -h
```

Look for files >200KB - those may need additional optimization.

---

**Note:** Image optimization is the biggest remaining opportunity for performance improvement. The code optimizations we've done will help, but compressing images will have the most dramatic impact on load times.
