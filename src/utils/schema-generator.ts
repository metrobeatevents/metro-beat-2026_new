import { businessInfo, dmvCities } from './seo-data';

export function generateLocalBusinessSchema(location?: string) {
  const areaServed = location 
    ? [{ "@type": "City", "name": location }]
    : dmvCities.map(city => ({ "@type": "City", "name": `${city.name}, ${city.state}` }));

  return {
    "@context": "https://schema.org",
    "@type": "LocalBusiness",
    "name": businessInfo.name,
    "image": "https://metrobeatevents.com/images/logo.jpg",
    "@id": "https://metrobeatevents.com",
    "url": "https://metrobeatevents.com",
    "telephone": businessInfo.phone,
    "email": businessInfo.email,
    "priceRange": "$$",
    "address": {
      "@type": "PostalAddress",
      "streetAddress": businessInfo.address.street,
      "addressLocality": businessInfo.address.city,
      "addressRegion": businessInfo.address.state,
      "postalCode": businessInfo.address.zip,
      "addressCountry": businessInfo.address.country
    },
    "geo": {
      "@type": "GeoCoordinates",
      "latitude": businessInfo.coordinates.latitude,
      "longitude": businessInfo.coordinates.longitude
    },
    "areaServed": areaServed,
    "openingHoursSpecification": {
      "@type": "OpeningHoursSpecification",
      "dayOfWeek": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"],
      "opens": "09:00",
      "closes": "22:00"
    },
    "sameAs": [
      businessInfo.socialLinks.facebook,
      businessInfo.socialLinks.instagram,
      businessInfo.socialLinks.twitter
    ]
  };
}

export function generateServiceSchema(serviceType: string, location?: string) {
  return {
    "@context": "https://schema.org",
    "@type": "Service",
    "serviceType": serviceType,
    "provider": {
      "@type": "LocalBusiness",
      "name": businessInfo.name
    },
    "areaServed": location ? {
      "@type": "City",
      "name": location
    } : {
      "@type": "State",
      "name": "Virginia"
    },
    "offers": {
      "@type": "AggregateOffer",
      "priceCurrency": "USD",
      "lowPrice": "1295",
      "highPrice": "2495"
    }
  };
}

export function generateFAQSchema(faqs: Array<{ question: string; answer: string }>) {
  return {
    "@context": "https://schema.org",
    "@type": "FAQPage",
    "mainEntity": faqs.map(faq => ({
      "@type": "Question",
      "name": faq.question,
      "acceptedAnswer": {
        "@type": "Answer",
        "text": faq.answer
      }
    }))
  };
}

export function generateBreadcrumbSchema(items: Array<{ name: string; url: string }>) {
  return {
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    "itemListElement": items.map((item, index) => ({
      "@type": "ListItem",
      "position": index + 1,
      "name": item.name,
      "item": item.url
    }))
  };
}
