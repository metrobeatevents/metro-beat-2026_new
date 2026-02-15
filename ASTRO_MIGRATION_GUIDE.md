# Astro Migration Guide for Metro Beat Events

This guide explains how to migrate from your current HTML structure to a full Astro-based SEO-optimized site.

## Current State

Your existing site has:
- Static HTML pages (index.html, about.html, services.html, etc.)
- CSS styling (css/style-version-c.css)
- JavaScript functionality (js/main.js)
- Image assets (images/)
- Basic structure without comprehensive SEO

## Migration Path

### Option 1: Gradual Migration (Recommended)

Keep your existing HTML pages while adding Astro components gradually.

**Step 1: Set up Astro project structure**
```bash
# Already done - you have src/ folder with layouts and components
```

**Step 2: Create Astro pages alongside HTML pages**
- Create `src/pages/index.astro` (will replace index.html)
- Create `src/pages/about.astro` (will replace about.html)
- Create `src/pages/services.astro` (will replace services.html)
- etc.

**Step 3: Migrate one page at a time**
- Convert HTML to Astro component
- Test thoroughly
- Deploy
- Move to next page

**Step 4: Update navigation**
- Update links to point to new Astro pages
- Set up redirects from old HTML pages

### Option 2: Full Migration

Completely rebuild the site in Astro.

**Step 1: Set up Astro project**
```bash
npm install astro @astrojs/sitemap
```

**Step 2: Create all Astro pages**
- Homepage
- Services (3 pages)
- Locations (10 pages)
- About, Pricing, Contact, Gallery

**Step 3: Migrate content**
- Copy content from HTML pages
- Optimize for SEO
- Add schema markup

**Step 4: Deploy**
- Build: `npm run build`
- Deploy dist/ folder

## File Structure for Astro

```
src/
├── layouts/
│   └── BaseLayout.astro          # Main layout
├── components/
│   ├── SEO.astro                 # SEO meta tags
│   ├── Header.astro              # Navigation
│   ├── Footer.astro              # Footer
│   └── CTASection.astro          # Call-to-action
├── pages/
│   ├── index.astro               # Homepage
│   ├── about.astro               # About
│   ├── pricing.astro             # Pricing
│   ├── contact.astro             # Contact
│   ├── gallery.astro             # Gallery
│   ├── services/
│   │   ├── wedding-dj-dmv.astro
│   │   ├── event-photography-dmv.astro
│   │   └── uplighting-wedding-venue.astro
│   └── locations/
│       └── [slug].astro          # Dynamic location pages
└── utils/
    ├── seo-data.ts               # Business info & SEO data
    └── schema-generator.ts       # Schema markup helpers
```

## Converting HTML to Astro

### Example: Converting index.html to index.astro

**Before (HTML):**
```html
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Metro Beat Events | Wedding DJ, Photography & Lighting</title>
  <meta name="description" content="...">
  <link rel="stylesheet" href="css/style-version-c.css">
</head>
<body>
  <header>...</header>
  <main>...</main>
  <footer>...</footer>
  <script src="js/main.js"></script>
</body>
</html>
```

**After (Astro):**
```astro
---
import BaseLayout from '../layouts/BaseLayout.astro';
import CTASection from '../components/CTASection.astro';
import { generateLocalBusinessSchema } from '../utils/schema-generator';

const schema = generateLocalBusinessSchema();
---

<BaseLayout
  title="Metro Beat Events | Wedding DJ, Photography & Lighting | Woodbridge, VA"
  description="Premier wedding DJ, photography, and lighting services in Woodbridge, VA. Serving DC, Northern Virginia & Maryland within 40 miles. Book your free consultation today!"
  schema={schema}
>
  <!-- Your page content here -->
  <section class="hero">
    <h1>Metro Beat Events - Your DMV Wedding Entertainment Specialists</h1>
    <!-- ... -->
  </section>
  
  <CTASection
    title="Ready to Book Your Event?"
    description="Let's make your celebration unforgettable."
  />
</BaseLayout>
```

## Key Differences

### HTML vs Astro

| Aspect | HTML | Astro |
|--------|------|-------|
| File Extension | .html | .astro |
| Layout | Manual | BaseLayout component |
| Meta Tags | Manual | SEO component |
| Schema Markup | Manual JSON-LD | Schema generators |
| Styling | External CSS | Scoped CSS |
| Reusability | Limited | Components |
| SEO | Basic | Comprehensive |

## Migration Checklist

### Pre-Migration
- [ ] Backup existing HTML files
- [ ] Document current site structure
- [ ] List all pages and their URLs
- [ ] Identify all assets (images, CSS, JS)
- [ ] Plan redirect strategy

### During Migration
- [ ] Create Astro project structure
- [ ] Set up base layout
- [ ] Create reusable components
- [ ] Migrate pages one by one
- [ ] Test each page thoroughly
- [ ] Update internal links
- [ ] Set up redirects

### Post-Migration
- [ ] Test all pages
- [ ] Run Lighthouse audit
- [ ] Check Google Search Console
- [ ] Monitor analytics
- [ ] Fix any issues
- [ ] Optimize performance

## Handling Assets

### Images
```astro
<img 
  src="/images/dj-setup.jpg" 
  alt="Professional DJ spinning records at Metro Beat Events DMV"
  title="DJ Setup - Metro Beat Events"
  width="600"
  height="400"
  loading="lazy"
/>
```

### CSS
```astro
<style>
  .hero {
    background: linear-gradient(135deg, #FF1B6D 0%, #E01860 100%);
    color: white;
    padding: 4rem 0;
  }
</style>
```

### JavaScript
```astro
<script>
  // Client-side JavaScript
  document.addEventListener('DOMContentLoaded', () => {
    // Your code here
  });
</script>
```

## Deployment Strategy

### Option 1: Gradual Rollout
1. Deploy Astro site to subdomain (astro.metrobeatevents.com)
2. Test thoroughly
3. Migrate traffic gradually
4. Retire old HTML site

### Option 2: Full Cutover
1. Build Astro site locally
2. Deploy to production
3. Set up redirects from old pages
4. Monitor for issues

### Option 3: Parallel Running
1. Keep HTML site running
2. Deploy Astro site to new domain
3. Test thoroughly
4. Switch DNS when ready

## Redirects

Set up 301 redirects from old pages to new pages:

```
/index.html → /
/about.html → /about
/services.html → /services/wedding-dj-dmv
/contact.html → /contact
/gallery.html → /gallery
/pricing.html → /pricing
```

## Performance Comparison

### Before (HTML)
- Lighthouse Score: 62
- FCP: 5.0s
- LCP: 12.3s
- CLS: 0.002

### After (Astro)
- Lighthouse Score: 90+
- FCP: < 1.5s
- LCP: < 2.5s
- CLS: < 0.1

## Common Issues & Solutions

### Issue: Images not loading
**Solution**: Ensure images are in `public/` folder and reference with `/images/...`

### Issue: Styles not applying
**Solution**: Use scoped `<style>` tags in Astro components

### Issue: JavaScript not working
**Solution**: Use `<script>` tags in Astro components or import JS files

### Issue: Links broken after migration
**Solution**: Update all internal links to use new Astro routes

## Timeline Estimate

- **Week 1**: Set up Astro project, create base layout and components
- **Week 2**: Migrate core pages (homepage, about, contact)
- **Week 3**: Migrate service pages and create location pages
- **Week 4**: Test, optimize, and deploy

## Support Resources

- [Astro Documentation](https://docs.astro.build/)
- [Astro SEO Guide](https://docs.astro.build/en/guides/integrations-guide/sitemap/)
- [Schema.org Documentation](https://schema.org/)
- [Google Search Essentials](https://developers.google.com/search)

---

**Ready to migrate?** Start with Option 1 (Gradual Migration) for the safest approach.
