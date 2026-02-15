export interface SEOData {
  title: string;
  description: string;
  canonical?: string;
  ogImage?: string;
  ogType?: string;
  twitterCard?: string;
}

export const businessInfo = {
  name: 'Metro Beat Events',
  phone: '+1-703-555-0100',
  email: 'info@metrobeatevents.com',
  address: {
    street: '123 Main Street',
    city: 'Woodbridge',
    state: 'VA',
    zip: '22191',
    country: 'US'
  },
  coordinates: {
    latitude: 38.6581722,
    longitude: -77.2497049
  },
  serviceRadius: '40 miles',
  socialLinks: {
    facebook: 'https://www.facebook.com/metrobeatevents',
    instagram: 'https://www.instagram.com/metrobeatevents',
    twitter: 'https://twitter.com/metrobeatevents'
  }
};

export const dmvCities = [
  { name: 'Woodbridge', state: 'VA', slug: 'woodbridge-va' },
  { name: 'Washington', state: 'DC', slug: 'washington-dc' },
  { name: 'Arlington', state: 'VA', slug: 'arlington-va' },
  { name: 'Alexandria', state: 'VA', slug: 'alexandria-va' },
  { name: 'Fairfax', state: 'VA', slug: 'fairfax-va' },
  { name: 'Manassas', state: 'VA', slug: 'manassas-va' },
  { name: 'Silver Spring', state: 'MD', slug: 'silver-spring-md' },
  { name: 'Bethesda', state: 'MD', slug: 'bethesda-md' },
  { name: 'Rockville', state: 'MD', slug: 'rockville-md' },
  { name: 'Fredericksburg', state: 'VA', slug: 'fredericksburg-va' }
];

export const services = [
  {
    name: 'Wedding DJ & MC',
    slug: 'wedding-dj-dmv',
    description: 'Professional DJ and MC services for weddings across the DMV'
  },
  {
    name: 'Event Photography',
    slug: 'event-photography-dmv',
    description: 'Professional event photography capturing your special moments'
  },
  {
    name: 'Uplighting & Ambiance',
    slug: 'uplighting-wedding-venue',
    description: 'Transform your venue with stunning uplighting and ambient lighting'
  }
];

export const trustSignals = [
  { icon: '⭐', text: '5.0 Star Rated' },
  { icon: '🎵', text: '500+ Successful Events' },
  { icon: '🛡️', text: 'Fully Insured & Licensed' },
  { icon: '📍', text: '40-Mile Service Radius' },
  { icon: '💯', text: '100% Satisfaction Guarantee' }
];
