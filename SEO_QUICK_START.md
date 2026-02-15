# SEO Quick Start Guide - Metro Beat Events

Fast-track guide to implementing SEO improvements to your existing site.

## 5-Minute Setup

### 1. Update Meta Tags on All Pages

Add to `<head>` of each HTML page:

```html
<!-- Primary Meta Tags -->
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description" content="[Your meta description - 150-160 chars]" />
<meta name="keywords" content="wedding DJ, DMV, Northern Virginia, event photography, uplighting" />
<meta name="author" content="Metro Beat Events" />
<meta name="robots" content="index, follow" />
<link rel="canonical" href="https://metrobeatevents.com[current-page-path]" />

<!-- Open Graph / Facebook -->
<meta property="og:type" content="website" />
<meta property="og:url" content="https://metrobeatevents.com[current-page-path]" />
<meta property="og:title" content="[Your page title]" />
<meta property="og:description" content="[Your meta description]" />
<meta property="og:image" content="https://metrobeatevents.com/images/og-image.jpg" />

<!-- Twitter -->
<meta property="twitter:card" content="summary_large_image" />
<meta property="twitter:url" content="https://metrobeatevents.com[current-page-path]" />
<meta property="twitter:title" content="[Your page title]" />
<meta property="twitter:description" content="[Your meta description]" />
<meta property="twitter:image" content="https://metrobeatevents.com/images/og-image.jpg" />
```

### 2. Add Schema Markup

Add to `<head>` or before `</body>`:

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "LocalBusiness",
  "name": "Metro Beat Events",
  "image": "https://metrobeatevents.com/images/logo.jpg",
  "@id": "https://metrobeatevents.com",
  "url": "https://metrobeatevents.com",
  "telephone": "+1-703-555-0100",
  "email": "info@metrobeatevents.com",
  "priceRange": "$$",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "123 Main Street",
    "addressLocality": "Woodbridge",
    "addressRegion": "VA",
    "postalCode": "22191",
    "addressCountry": "US"
  },
  "geo": {
    "@type": "GeoCoordinates",
    "latitude": 38.6581722,
    "longitude": -77.2497049
  },
  "areaServed": [
    {"@type": "City", "name": "Woodbridge, VA"},
    {"@type": "City", "name": "Washington, DC"},
    {"@type": "City", "name": "Arlington, VA"},
    {"@type": "City", "name": "Alexandria, VA"}
  ],
  "openingHoursSpecification": {
    "@type": "OpeningHoursSpecification",
    "dayOfWeek": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"],
    "opens": "09:00",
    "closes": "22:00"
  },
  "sameAs": [
    "https://www.facebook.com/metrobeatevents",
    "https://www.instagram.com/metrobeatevents",
    "https://twitter.com/metrobeatevents"
  ]
}
</script>
```

### 3. Optimize Images

For every image, add:
```html
<img 
  src="images/dj-setup.jpg" 
  alt="Professional DJ spinning records at Metro Beat Events DMV" 
  title="DJ Setup - Metro Beat Events"
  width="600" 
  height="400"
  loading="lazy"
/>
```

### 4. Create Sitemap

Create `sitemap.xml` in root:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>https://metrobeatevents.com/</loc>
    <lastmod>2026-02-14</lastmod>
    <changefreq>weekly</changefreq>
    <priority>1.0</priority>
  </url>
  <url>
    <loc>https://metrobeatevents.com/about.html</loc>
    <lastmod>2026-02-14</lastmod>
    <changefreq>monthly</changefreq>
    <priority>0.8</priority>
  </url>
  <!-- Add all other pages -->
</urlset>
```

### 5. Update robots.txt

Create/update `robots.txt` in root:
```
User-agent: *
Allow: /

Sitemap: https://metrobeatevents.com/sitemap.xml
```

## Page-Specific Meta Tags

### Homepage
```html
<title>Metro Beat Events | Wedding DJ, Photography & Lighting | Woodbridge, VA</title>
<meta name="description" content="Premier wedding DJ, photography, and lighting services in Woodbridge, VA. Serving DC, Northern Virginia & Maryland within 40 miles. Book your free consultation today!" />
```

### About Page
```html
<title>About Metro Beat Events | Wedding DJ & Entertainment Services</title>
<meta name="description" content="Learn about Metro Beat Events, your trusted wedding DJ and entertainment provider in the DMV area. 500+ successful events, fully insured, and 100% satisfaction guaranteed." />
```

### Services Pages
```html
<!-- Wedding DJ -->
<title>Wedding DJ & MC Services DMV | Metro Beat Events | Woodbridge VA</title>
<meta name="description" content="Professional wedding DJ and MC services across the DMV. Expert music curation, premium sound systems, and professional MC services. Book your wedding DJ today!" />

<!-- Photography -->
<title>Event Photography DMV | Professional Wedding Photography | Metro Beat Events</title>
<meta name="description" content="Professional event photography capturing your special moments. Serving the DMV area with high-quality wedding and event photography services." />

<!-- Uplighting -->
<title>Uplighting & Ambiance Lighting | Wedding Venue Lighting | Metro Beat Events</title>
<meta name="description" content="Transform your wedding venue with stunning uplighting and ambient lighting effects. Professional lighting design for weddings across the DMV." />
```

### Pricing Page
```html
<title>Wedding DJ & Event Pricing | Metro Beat Events | Flexible Packages</title>
<meta name="description" content="Transparent, flexible pricing for wedding DJ, photography, and lighting services. Choose the perfect package for your DMV area event." />
```

### Contact Page
```html
<title>Contact Metro Beat Events | Book Your Wedding DJ & Entertainment</title>
<meta name="description" content="Contact Metro Beat Events for a free consultation. Professional wedding DJ, photography, and lighting services in the DMV area." />
```

### Gallery Page
```html
<title>Event Gallery | Metro Beat Events | Wedding DJ & Photography Portfolio</title>
<meta name="description" content="View our portfolio of professional wedding DJ, photography, and event lighting services. See the magic we create at every celebration." />
```

## Location Pages

For each city (Woodbridge, DC, Arlington, Alexandria, Fairfax, Manassas, Silver Spring, Bethesda, Rockville, Fredericksburg):

```html
<title>Wedding DJ [City], [State] | Metro Beat Events | Local Experts</title>
<meta name="description" content="[City]'s premier wedding DJ service. Local expertise, personalized entertainment, and professional lighting. Serving all [City] venues. Book now!" />
```

## Internal Linking Strategy

### Homepage Links
```html
<a href="/services.html">View Our Services</a>
<a href="/about.html">Learn About Us</a>
<a href="/pricing.html">See Our Pricing</a>
<a href="/contact.html">Book a Consultation</a>
```

### Service Page Links
```html
<a href="/services.html">Back to All Services</a>
<a href="/pricing.html">View Pricing Packages</a>
<a href="/contact.html">Book This Service</a>
<a href="/gallery.html">See Our Work</a>
```

### Location Page Links
```html
<a href="/services.html">Our Services in [City]</a>
<a href="/pricing.html">Pricing for [City] Events</a>
<a href="/contact.html">Book Your [City] DJ</a>
<a href="/locations/arlington-va.html">Also Serving Arlington</a>
```

## Testing Your SEO

### Google Tools
1. **Google Search Console**: https://search.google.com/search-console
   - Add your site
   - Submit sitemap
   - Check for errors

2. **Rich Results Test**: https://search.google.com/test/rich-results
   - Test your schema markup
   - Validate JSON-LD

3. **PageSpeed Insights**: https://pagespeed.web.dev
   - Check performance
   - Get optimization tips

### Other Tools
- **Lighthouse**: Chrome DevTools → Lighthouse tab
- **SEMrush**: Free SEO audit
- **Ahrefs**: Backlink analysis

## Next Steps

1. ✅ Add meta tags to all pages
2. ✅ Add schema markup
3. ✅ Optimize all images
4. ✅ Create sitemap.xml
5. ✅ Update robots.txt
6. ✅ Submit to Google Search Console
7. ⏳ Monitor rankings and traffic
8. ⏳ Build backlinks
9. ⏳ Encourage reviews

## Expected Results

- **Month 1**: Indexed in Google, initial organic traffic
- **Month 2-3**: Ranking for branded keywords
- **Month 3-6**: Ranking for target keywords
- **Month 6+**: Top 10 for "wedding DJ Woodbridge VA"

---

**Start with Step 1 today!** Adding proper meta tags and schema markup will immediately improve your SEO.
