# AGENTS.md - TallyUpTutors Project Guidelines

## Overview

Astro 5.x tuition centre website (Mathematics, Science, Accounting - grades 8-12). Uses TypeScript, vanilla JavaScript, and CSS custom properties.

## Build, Lint, and Test Commands

```bash
npm run dev          # Start dev server at localhost:4321
npm run build        # Build production site to ./dist/
npm run preview      # Preview production build locally
npx astro check      # Run TypeScript and Astro type checks
```

**Adding tests:**
```bash
# Vitest (recommended)
npm install -D vitest
npx vitest run --reporter=verbose --testNamePattern="specific test"  # Run single test

# Playwright (E2E)
npm install -D @playwright/test
npx playwright test test.spec.ts  # Run single test file
```

## Code Style Guidelines

### File Structure

```
src/
├── components/          # Reusable Astro components
│   ├── Navbar.astro
│   └── Squares.astro
├── layouts/            # Page layouts
│   └── Layout.astro
├── pages/              # File-based routing
│   ├── index.astro
│   ├── privacy.astro
│   └── thank-you.astro
└── styles/
    └── global.css      # Global styles and CSS custom properties
```

### Astro Component Structure

```astro
---
// Frontmatter (server-side) - can be empty
import Layout from '../layouts/Layout.astro';

interface Props {
  title: string;
  description?: string;
}

const { title, description = "Default" } = Astro.props;
---

<!-- Template markup -->
<Layout title={title}>
  <main><!-- content --></main>
</Layout>

<!-- Component-scoped styles -->
<style>
  .selector { /* styles */ }
</style>

<!-- Client-side script -->
<script>
  // Vanilla JS or TypeScript with <script lang="ts">
  document.addEventListener('DOMContentLoaded', () => { });
</script>
```

**Key patterns:**
- Frontmatter can be empty: `---\n---` (see Navbar.astro)
- Use `<script is:inline>` for external libraries (e.g., particles.js)
- Pass data to client scripts via `data-` attributes
- Use `class:list` for conditional classes

### TypeScript & Naming Conventions

| Type | Convention | Example |
|------|-----------|---------|
| Components | PascalCase | `Navbar.astro` |
| Pages | kebab-case | `privacy.astro` |
| CSS classes | kebab-case | `.hero-section` |
| Variables/functions | camelCase | `initTheme` |
| Constants | SCREAMING_SNAKE_CASE | `MAX_WIDTH` |
| Props | camelCase | `title`, `isFeatured` |

```typescript
interface Props {
  title: string;
  variant?: 'primary' | 'accent';
}

const { variant = 'primary' } = Astro.props;
```

### Imports

```astro
---
import Layout from '../layouts/Layout.astro';
import Navbar from '../components/Navbar.astro';
import '../styles/global.css';
---
```

### CSS Conventions

**Design Tokens** (in `src/styles/global.css`):
- Use `--color-primary`, `--color-accent`, `--space-md`, etc.
- Glassmorphism: `--glass-bg`, `--glass-blur`

**Dark Mode:**
```css
[data-theme="dark"] .selector {
  background: var(--color-bg-dark);
  color: var(--color-text-dark);
}
```

**Responsive Design:**
- Mobile-first: default styles, then `@media (max-width: 768px)`

### Error Handling

```typescript
try {
  const result = await fetchData();
} catch (error) {
  console.error('Failed:', error);
  // Show user-friendly message
}
```

### Accessibility

- `aria-label` on icon-only buttons
- Semantic HTML (`<main>`, `<nav>`, `<section>`)
- Focus states on interactive elements
- `alt` attributes on images

### Performance

- CSS transforms over layout changes
- Minimal client-side JavaScript
- Lazy load images when adding

### Git Conventions

Use conventional commits: `feat:`, `fix:`, `docs:`, `style:`, `refactor:`
