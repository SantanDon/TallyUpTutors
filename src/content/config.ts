import { defineCollection, z } from 'astro:content';

const homeCollection = defineCollection({
  type: 'content',
  schema: z.object({
    title: z.string().optional(),
    intro: z.string().optional(),
    heroTitle: z.string().optional(),
    heroSubtitle: z.string().optional(),
    heroDescription: z.string().optional(),
    freeTrialBadge: z.string().optional(),
    stats: z.array(z.object({
      value: z.string(),
      label: z.string()
    })).optional(),
    features: z.array(z.string()).optional(),
    subjects: z.array(z.object({
      title: z.string(),
      gradeRange: z.string(),
      tags: z.array(z.string()),
      featured: z.boolean().default(false)
    })).optional(),
    pricingCards: z.array(z.object({
      hours: z.string(),
      rate: z.number(),
      monthlyTotal: z.number(),
      monthlyHours: z.string(),
      featured: z.boolean().default(false)
    })).optional(),
    address: z.string().optional(),
    phone1: z.string().optional(),
    phone2: z.string().optional(),
    whatsapp: z.string().optional(),
    formspree: z.string().optional(),
    officeHours: z.array(z.object({
      day: z.string(),
      time: z.string()
    })).optional(),
    brand: z.string().optional(),
    year: z.string().optional(),
    badge: z.string().optional(),
    tagline: z.string().optional()
  })
});

const settingsCollection = defineCollection({
  type: 'data',
  schema: z.object({
    siteName: z.string(),
    tagline: z.string(),
    whatsapp: z.string(),
    formspree: z.string(),
    navLinks: z.array(z.object({
      label: z.string(),
      url: z.string()
    }))
  })
});

export const collections = {
  'home': homeCollection,
  'settings': settingsCollection
};
