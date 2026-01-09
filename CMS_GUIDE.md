# Decap CMS Setup Guide for TallyUpTutors

## Overview

This project uses **Decap CMS** (formerly Netlify CMS) with **Astro** to create a static website with an easy-to-use content management system.

## What You Need

- **GitHub Account** (for storing content)
- **Netlify Account** (for free hosting)

## Step 1: Push to GitHub

```bash
# Initialize git if not already done
git init
git add .
git commit -m "Initial commit with Decap CMS"

# Create a new repository on GitHub (tallyuptutors-website)
# Then push:
git remote add origin https://github.com/YOUR_USERNAME/tallyuptutors-website.git
git push -u origin main
```

## Step 2: Deploy to Netlify

1. Go to [netlify.com](https://netlify.com) and sign up
2. Click "Add new site" → "Import an existing project"
3. Select GitHub and choose your `tallyuptutors-website` repository
4. Netlify auto-detects:
   - Build command: `npm run build`
   - Publish directory: `dist`
5. Click "Deploy site"

## Step 3: Enable Decap CMS

### Option A: Netlify Identity (Recommended)

1. In Netlify dashboard, go to **Identity** → **Enable Identity**
2. Go to **Identity** → **Settings** → **Git Gateway** → **Enable Git Gateway**
3. Go to **Identity** → **Users** → **Invite user**
   - Enter YOUR email to create admin account
   - You'll receive an invitation email
   - Set your password

### Option B: Simple Setup (No Auth)

Edit `public/admin/config.yml` and change:

```yaml
backend:
  name: git-gateway
  branch: main

# Add this for open access (not recommended for production):
# local_backend: true
```

## Step 4: Access the CMS

Once deployed:

```
https://YOUR-Netlify-Site-Name.netlify.app/admin/
```

Login with your Netlify Identity credentials.

## What Clients Can Edit

| Section | What They Can Change |
|---------|---------------------|
| **Hero** | Title, subtitle, description, stats |
| **About** | Section title, intro, features list |
| **Subjects** | Subject cards, grades, tags, featured |
| **Pricing** | All pricing cards, rates, featured |
| **Contact** | Address, phone numbers, form URL |
| **Office Hours** | Days and times |
| **Footer** | Brand text, year |
| **Settings** | Site name, WhatsApp link, navigation |

## How to Make Changes

1. Go to `/admin/`
2. Login with your credentials
3. Click on the section you want to edit
4. Make changes in the form fields
5. Click "Publish" to save
6. Site automatically rebuilds and deploys!

## Image Uploads

- Go to "Media" in the CMS
- Click "Upload" to add images
- Images are stored in `public/uploads/`

## Troubleshooting

### CMS Shows 404
- Check that `public/admin/index.html` exists
- Verify `netlify.toml` redirect rules

### Changes Not Saving
- Ensure Git Gateway is enabled in Netlify
- Check that the repo is connected in Netlify

### Login Issues
- Use Netlify Identity to reset password
- Check spam folder for invitation emails

## After Client Pays for .co.za Domain

1. Go to Netlify → Domain Management
2. Add custom domain
3. Update DNS as instructed by Netlify
4. SSL certificate auto-generates

## Monthly Cost

| Item | Cost |
|------|------|
| Hosting (Netlify) | FREE |
| CMS (Decap) | FREE |
| Domain (.co.za) | ~R60-120/year |
| **Total** | **~R5-10/month** |
