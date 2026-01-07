# How to Add a "Book" Tab to Your Main Website

This guide shows you how to add a "Book" tab to your main website at https://abhinavananddwivedi.github.io/

## Step 1: Identify Your Website Structure

First, you need to know what technology your main website uses. Check your main website repository (`abhinavananddwivedi.github.io`) for:

- **Jekyll**: Look for `_config.yml` file
- **Hugo**: Look for `config.toml` or `config.yaml`
- **Plain HTML**: Look for `index.html`
- **R Markdown**: Look for `_site.yml`

## Step 2: Add the Book Link

### For Jekyll Sites

1. Clone your main website repository:
```bash
git clone https://github.com/abhinavananddwivedi/abhinavananddwivedi.github.io.git
cd abhinavananddwivedi.github.io
```

2. Find your navigation configuration. Common locations:
   - `_config.yml`
   - `_data/navigation.yml`
   - `_includes/navigation.html`

3. Add the Book link. For example, in `_config.yml`:
```yaml
# Navigation
navigation:
  - title: Home
    url: /
  - title: Book
    url: /book/
  - title: Research
    url: /research/
```

4. Commit and push:
```bash
git add .
git commit -m "Add Book tab to navigation"
git push
```

### For Plain HTML Sites

1. Open your `index.html` or main HTML file

2. Find the navigation section (usually looks like):
```html
<nav>
  <ul>
    <li><a href="/">Home</a></li>
    <li><a href="/research/">Research</a></li>
  </ul>
</nav>
```

3. Add the Book link:
```html
<nav>
  <ul>
    <li><a href="/">Home</a></li>
    <li><a href="/book/">Book</a></li>
    <li><a href="/research/">Research</a></li>
  </ul>
</nav>
```

4. If you have a separate CSS file, you may need to style it to match existing tabs.

5. Commit and push changes.

### For Hugo Sites

1. Edit `config.toml` (or `config.yaml`):

```toml
[menu]
  [[menu.main]]
    name = "Home"
    url = "/"
    weight = 1

  [[menu.main]]
    name = "Book"
    url = "/book/"
    weight = 2
    
  [[menu.main]]
    name = "Research"
    url = "/research/"
    weight = 3
```

2. Commit and push.

### For R Markdown Sites

1. Edit `_site.yml`:

```yaml
name: "my-website"
navbar:
  title: "Abhinav Anand"
  left:
    - text: "Home"
      href: index.html
    - text: "Book"
      href: book/
    - text: "Research"
      href: research.html
```

2. Rebuild your site:
```r
rmarkdown::render_site()
```

3. Commit and push.

## Step 3: Verify the Link

1. Wait a few minutes for GitHub Pages to rebuild (usually 1-5 minutes)

2. Visit your main website: https://abhinavananddwivedi.github.io/

3. You should see a new "Book" tab in the navigation

4. Click it - it should take you to: https://abhinavananddwivedi.github.io/book/

## Troubleshooting

### Link doesn't work (404 error)

Make sure:
- Your book repository is properly deployed at `/book/` subdirectory
- The book's `docs/` folder is built and pushed to GitHub
- GitHub Pages is enabled for the book repository with `/docs` as source

### Tab appears but no styling

You may need to add CSS for the new tab. Find your main CSS file and ensure the navigation styling applies to all tabs.

### Tab doesn't appear at all

1. Check that you edited the correct navigation file
2. Clear your browser cache
3. Try in an incognito/private window
4. Check browser console for errors (F12 → Console)

## Alternative: Add Link in Footer or Sidebar

If you don't want to modify the main navigation, you can add a link elsewhere:

**In the sidebar:**
```html
<div class="sidebar">
  <h3>Resources</h3>
  <ul>
    <li><a href="/book/">📚 My Stochastic Calculus Book</a></li>
  </ul>
</div>
```

**In the footer:**
```html
<footer>
  <p>Check out my <a href="/book/">online book on Stochastic Calculus</a>!</p>
</footer>
```

## Need Help?

If you're unsure about your website structure, you can:

1. Share the structure of your `abhinavananddwivedi.github.io` repository
2. Look for template documentation (Jekyll themes, Hugo themes, etc.)
3. Check existing navigation code to see the pattern

Most websites follow similar patterns - just add `book/` as a new navigation item!
