# SEO Canonicalization QA Checklist

## Post-Deployment Testing Checklist

### 1. Domain Canonicalization Tests

#### Non-WWW to WWW Redirects
- [ ] Visit `http://metrobeatevents.com/` → Should redirect to `https://www.metrobeatevents.com/`
- [ ] Visit `https://metrobeatevents.com/` → Should redirect to `https://www.metrobeatevents.com/`
- [ ] Visit `http://metrobeatevents.com/services` → Should redirect to `https://www.metrobeatevents.com/services`
- [ ] Visit `https://metrobeatevents.com/contact` → Should redirect to `https://www.metrobeatevents.com/contact`

**Expected Result:** All non-www URLs should 301 redirect to www equivalents

#### HTTP to HTTPS Redirects
- [ ] Visit `http://www.metrobeatevents.com/` → Should redirect to `https://www.metrobeatevents.com/`
- [ ] Visit `http://www.metrobeatevents.com/about` → Should redirect to `https://www.metrobeatevents.com/about`

**Expected Result:** All HTTP URLs should 301 redirect to HTTPS

### 2. Clean URL Tests

#### .HTML Extension Redirects
- [ ] Visit `https://www.metrobeatevents.com/index.html` → Should redirect to `https://www.metrobeatevents.com/`
- [ ] Visit `https://www.metrobeatevents.com/services.html` → Should redirect to `https://www.metrobeatevents.com/services`
- [ ] Visit `https://www.metrobeatevents.com/contact.html` → Should redirect to `https://www.metrobeatevents.com/contact`
- [ ] Visit `https://www.metrobeatevents.com/quote.html` → Should redirect to `https://www.metrobeatevents.com/quote`
- [ ] Visit `https://www.metrobeatevents.com/woodbridge-va.html` → Should redirect to `https://www.metrobeatevents.com/woodbridge-va`

**Expected Result:** All .html URLs should 301 redirect to clean URL equivalents

#### Clean URLs Work
- [ ] Visit `https://www.metrobeatevents.com/services` → Page loads (200 status)
- [ ] Visit `https://www.metrobeatevents.com/packages` → Page loads (200 status)
- [ ] Visit `https://www.metrobeatevents.com/contact` → Page loads (200 status)
- [ ] Visit `https://www.metrobeatevents.com/about` → Page loads (200 status)

**Expected Result:** Clean URLs should load successfully without redirecting

### 3. Canonical Tag Verification

#### Homepage
- [ ] Visit `https://www.metrobeatevents.com/`
- [ ] View page source (Ctrl+U or Cmd+Option+U)
- [ ] Find: `<link rel="canonical" href="https://www.metrobeatevents.com/">`

#### Services Page
- [ ] Visit `https://www.metrobeatevents.com/services`
- [ ] View page source
- [ ] Find: `<link rel="canonical" href="https://www.metrobeatevents.com/services">`

#### Contact Page
- [ ] Visit `https://www.metrobeatevents.com/contact`
- [ ] View page source
- [ ] Find: `<link rel="canonical" href="https://www.metrobeatevents.com/contact">`

#### Location Page Example
- [ ] Visit `https://www.metrobeatevents.com/woodbridge-va`
- [ ] View page source
- [ ] Find: `<link rel="canonical" href="https://www.metrobeatevents.com/woodbridge-va">`

**Expected Result:** Every page should have a self-referencing canonical tag using www domain and clean URL

### 4. Open Graph URL Verification

#### Check OG Tags
- [ ] View source on any page
- [ ] Find: `<meta property="og:url" content="https://www.metrobeatevents.com/...">`
- [ ] Verify URL uses www domain
- [ ] Verify URL uses clean format (no .html)

#### Check Twitter Tags
- [ ] View source on any page
- [ ] Find: `<meta property="twitter:url" content="https://www.metrobeatevents.com/...">`
- [ ] Verify URL uses www domain
- [ ] Verify URL uses clean format (no .html)

**Expected Result:** All social meta tags should use canonical www URLs

### 5. Sitemap Verification

#### Sitemap Accessibility
- [ ] Visit `https://www.metrobeatevents.com/sitemap.xml`
- [ ] Sitemap loads successfully
- [ ] XML is properly formatted

#### Sitemap Content
- [ ] All URLs start with `https://www.metrobeatevents.com`
- [ ] No URLs contain .html extension
- [ ] No duplicate URLs present
- [ ] Homepage is listed as `https://www.metrobeatevents.com/` (not /index.html)
- [ ] Count total URLs (should be 21)

**Expected Result:** Sitemap contains only canonical www URLs with clean format

### 6. Robots.txt Verification

- [ ] Visit `https://www.metrobeatevents.com/robots.txt`
- [ ] Find: `Sitemap: https://www.metrobeatevents.com/sitemap.xml`
- [ ] Verify sitemap URL uses www domain

**Expected Result:** Robots.txt points to canonical sitemap URL

### 7. Internal Navigation Tests

#### Main Navigation
- [ ] Click "Services" in nav → URL should be `/services` (not `/services.html`)
- [ ] Click "Packages" in nav → URL should be `/packages`
- [ ] Click "Contact" in nav → URL should be `/contact`
- [ ] Click "About" in nav → URL should be `/about`

#### Footer Links
- [ ] Click footer links → All should use clean URLs
- [ ] Click location links → All should use clean URLs (e.g., `/woodbridge-va`)

#### CTA Buttons
- [ ] Click "Get Quote" buttons → Should go to `/quote`
- [ ] Click "Contact Us" buttons → Should go to `/contact`

**Expected Result:** All internal links should use clean URL format

### 8. Redirect Chain Test

#### Check for Redirect Chains
- [ ] Visit `http://metrobeatevents.com/services.html`
- [ ] Use browser dev tools Network tab or online redirect checker
- [ ] Count redirects (should be 2 maximum):
  1. `http://metrobeatevents.com/services.html` → `https://www.metrobeatevents.com/services.html` (301)
  2. `https://www.metrobeatevents.com/services.html` → `https://www.metrobeatevents.com/services` (301)
  3. Final: `https://www.metrobeatevents.com/services` (200)

**Expected Result:** Maximum 2 redirects to reach final canonical URL

### 9. Functionality Tests

#### Forms Still Work
- [ ] Contact form submits successfully
- [ ] Quote form submits successfully
- [ ] Form redirects to `/thank-you` (not `/thank-you.html`)

#### Navigation Still Works
- [ ] All pages load correctly
- [ ] No broken links
- [ ] Images load properly
- [ ] CSS and JS load correctly

#### Language Toggle
- [ ] Language toggle still functions
- [ ] Content switches between English and Spanish
- [ ] URLs remain clean (don't change to .html)

**Expected Result:** All site functionality remains intact

### 10. Google Tools Verification

#### Google Search Console
- [ ] Submit new sitemap: `https://www.metrobeatevents.com/sitemap.xml`
- [ ] Check for sitemap errors
- [ ] Monitor coverage report over next few weeks
- [ ] Verify canonical URL selection matches our preference

#### Google PageSpeed Insights
- [ ] Test `https://www.metrobeatevents.com/`
- [ ] Verify page loads correctly
- [ ] Check for any new errors

#### Rich Results Test
- [ ] Test homepage for structured data
- [ ] Verify LocalBusiness schema still validates

**Expected Result:** All Google tools recognize canonical URLs

## Testing Tools

### Browser-Based
- **Chrome DevTools Network Tab** - Check redirect status codes
- **View Page Source** - Verify canonical tags
- **Inspect Element** - Check meta tags

### Online Tools
- **Redirect Checker:** https://httpstatus.io/
- **Canonical Tag Checker:** https://www.screamingfrog.co.uk/seo-spider/
- **Sitemap Validator:** https://www.xml-sitemaps.com/validate-xml-sitemap.html
- **Google Rich Results Test:** https://search.google.com/test/rich-results

### Command Line
```bash
# Check redirect status
curl -I https://metrobeatevents.com/

# Check canonical tag
curl -s https://www.metrobeatevents.com/ | grep canonical

# Check sitemap
curl https://www.metrobeatevents.com/sitemap.xml
```

## Priority Testing Order

### Critical (Test Immediately After Deployment)
1. ✅ Homepage loads at `https://www.metrobeatevents.com/`
2. ✅ Non-www redirects to www
3. ✅ .html URLs redirect to clean URLs
4. ✅ Canonical tags are correct
5. ✅ Sitemap is accessible and correct

### Important (Test Within 24 Hours)
6. ✅ All internal navigation works
7. ✅ Forms still submit correctly
8. ✅ All pages load without errors
9. ✅ No redirect chains >2 hops

### Monitor (Test Over Next Week)
10. ✅ Google Search Console shows canonical URLs
11. ✅ No increase in 404 errors
12. ✅ Crawl stats remain healthy

## Issue Resolution

### If Redirects Don't Work
1. Check Netlify deployment status
2. Verify `netlify.toml` was deployed
3. Clear browser cache and test in incognito
4. Check Netlify function logs for errors

### If Canonical Tags Are Wrong
1. Verify HTML files were updated and deployed
2. Clear CDN cache if applicable
3. Hard refresh browser (Ctrl+Shift+R)

### If Sitemap Has Issues
1. Validate XML syntax
2. Verify file is accessible at root
3. Resubmit to Google Search Console

## Sign-Off

- [ ] All critical tests passed
- [ ] All important tests passed
- [ ] Monitoring plan in place
- [ ] Google Search Console updated
- [ ] Team notified of changes

**Tested By:** _______________  
**Date:** _______________  
**Status:** _______________  

---

**Note:** Keep this checklist and mark items as you test them. If any test fails, document the issue and fix before proceeding.
