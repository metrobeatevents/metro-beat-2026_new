# SEO Integration Guide for Metro Beat Events

This guide explains how to integrate the new SEO-optimized Astro components and utilities with your existing metro-beat-events site.

## Files Added

### Utility Files
- `src/utils/seo-data.ts` - Centralized business information and SEO data
- `src/utils/schema-generator.ts` - Schema.org markup generators

These files provide:
- Centralized business information (name, phone, email, address, coordinates)
- DMV city data for location pages
- Service information
- Trust signals
- Schema markup generators for LocalBusiness, Service, FAQ, and BreadcrumbList

## How to Use

### 1. Update Business Information

Edit `src/utils/seo-data.ts` to update:
```typescript
export const businessInfo = {
  name: 'Metro Beat Events',
  phone: '+1-703-555-0100',  // Update with real phone
  email: 'info@metrobeatevents.com',  // Update with real email
  address: {
    street: '123 Main Street',  // Update with real address
    city: 'Woodbridge',
    state: 'VA',
    zip: '22191',
    country: 'US'
  },
  // ... rest of config
};
```

### 2. Generate Schema Markup

Use the schema generators in your pages:

```typescript
import { generateLocalBusinessSchema, generateFAQSchema } from '../utils/schema-generator';

// In your page component
const schema = generateLocalBusinessSchema();
const faqSchema = generateFAQSchema([
  { question: 'How far do you travel?', answer: 'We serve a 40-mile radius from Woodbridge, VA.' }
]);
```

### 3. Add Schema to HTML

Add schema markup to your HTML pages:

```html
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "LocalBusiness",
  "name": "Metro Beat Events",
  "telephone": "+1-703-555-0100",
  "email": "info@metrobeatevents.com",
  "address": {
    "@type": "PostalAddress",
    "streetAddress": "123 Main Street",
    "addressLocality": "Woodbridge",
    "addressRegion": "VA",
    "postalCode": "22191",
    "addressCountry": "US"
  }
}
</script>
```

## SEO Best Practices for Your Existing Pages

### Homepage (index.html)
- Title: "Metro Beat Events | Wedding DJ, Photography & Lighting | Woodbridge, VA"
- Meta Description: "Premier wedding DJ, photography, and lighting services in Woodbridge, VA. Serving DC, Northern Virginia & Maryland within 40 miles. Book your free consultation today!"
- H1: "Metro Beat Events - Your DMV Wedding Entertainment Specialists"
- Add LocalBusiness schema

### Service Pages
- Each service page should have unique title and description
- Use Service schema markup
- Include FAQ schema for common questions
- Internal links to related services and locations

### Location Pages
- Create location-specific pages for each DMV city
- Title: "Wedding DJ [City], [State] | Metro Beat Events | Local Experts"
- Meta Description: "[City]'s premier wedding DJ service. Local expertise, personalized entertainment, and professional lighting. Serving all [City] venues. Book now!"
- H1: "Wedding DJ Services in [City], [State]"
- Use LocalBusiness schema with city-specific data
- Include FAQ schema with location-specific questions

### Contact Page
- Title: "Contact Metro Beat Events | Book Your Wedding DJ & Entertainment"
- Meta Description: "Contact Metro Beat Events for a free consultation. Professional wedding DJ, photography, and lighting services in the DMV area."
- Include contact form with proper fields
- Add FAQ schema for common questions

## Image Optimization

For all images, add:
- Descriptive alt text with keywords
- Title attribute for hover text
- Explicit width and height attributes
- Use WebP format with JPG fallback

Example:
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

## Internal Linking Strategy

### From Homepage
- Link to all 3 service pages
- Link to top 10 location pages
- Link to about, pricing, contact

### From Location Pages
- Link to relevant service pages
- Link to nearby location pages (3-5 related cities)
- Link back to homepage
- Link to contact page

### From Service Pages
- Link to related services
- Link to top location pages
- Link to pricing
- Link to gallery

Use keyword-rich anchor text:
```html
<!-- Good -->
<a href="/services/wedding-dj-dmv">wedding DJ services in the DMV</a>

<!-- Avoid -->
<a href="/services/wedding-dj-dmv">click here</a>
```

## Meta Tags Checklist

Every page should have:
- [ ] Unique, descriptive title (50-60 characters)
- [ ] Compelling meta description (150-160 characters)
- [ ] Canonical URL
- [ ] Open Graph tags (og:title, og:description, og:image)
- [ ] Twitter Card tags
- [ ] Viewport meta tag
- [ ] Charset declaration

## Schema Markup Checklist

- [ ] LocalBusiness schema on all pages
- [ ] Service schema on service pages
- [ ] FAQ schema on pages with FAQs
- [ ] BreadcrumbList schema for navigation
- [ ] Organization schema in footer
- [ ] Validate with Google's Rich Results Test

## Performance Optimization

- [ ] Add explicit width/height to all images
- [ ] Use lazy loading for below-fold images
- [ ] Minify CSS and JavaScript
- [ ] Enable GZIP compression
- [ ] Set up browser caching
- [ ] Optimize images (WebP with JPG fallback)
- [ ] Remove render-blocking resources

## Testing & Validation

### Google Tools
1. **Google Search Console**: https://search.google.com/search-console
   - Submit sitemap
   - Monitor indexing
   - Check for errors

2. **Google Rich Results Test**: https://search.google.com/test/rich-results
   - Test schema markup
   - Validate JSON-LD

3. **PageSpeed Insights**: https://pagespeed.web.dev
   - Check performance
   - Get optimization suggestions

### Other Tools
- **Lighthouse**: Built into Chrome DevTools
- **SEMrush**: Comprehensive SEO audit
- **Ahrefs**: Backlink analysis
- **Moz**: Keyword research and tracking

## Next Steps

1. Update business information in `src/utils/seo-data.ts`
2. Add schema markup to existing HTML pages
3. Optimize meta tags on all pages
4. Improve internal linking
5. Optimize images
6. Test with Google tools
7. Submit sitemap to Google Search Console
8. Monitor performance and rankings

## Additional Resources

- [Google Search Essentials](https://developers.google.com/search)
- [Schema.org Documentation](https://schema.org/)
- [Astro SEO Guide](https://docs.astro.build/en/guides/integrations-guide/sitemap/)
- [Web.dev SEO Guide](https://web.dev/lighthouse-seo/)

---

For questions or additional SEO optimization needs, refer to the comprehensive documentation in the PROJECT_SUMMARY.md and DEPLOYMENT_GUIDE.md files.
