# Stochastic Calculus from Scratch

This is a bookdown project for an online book on stochastic calculus with applications to finance.

## Prerequisites

Install R and the necessary packages:

```r
install.packages(c("bookdown", "rmarkdown", "knitr"))
```

## Building the Book

### Local Build

To build the book locally:

```r
# In R console, from the book directory
bookdown::render_book("index.Rmd", "bookdown::gitbook")
```

This will generate the HTML book in the `docs/` folder.

### PDF Version

To build the PDF:

```r
bookdown::render_book("index.Rmd", "bookdown::pdf_book")
```

## Project Structure

```
book/
├── index.Rmd              # Preface and front matter
├── 01-brownian-motion.Rmd # Chapter 1
├── 02-ito-calculus.Rmd    # Chapter 2
├── 03-sdes.Rmd            # Chapter 3
├── 04-feynman-kac.Rmd     # Chapter 4
├── 05-risk-neutral.Rmd    # Chapter 5
├── 06-black-scholes.Rmd   # Chapter 6
├── 07-jumps.Rmd           # Chapter 7
├── 08-levy.Rmd            # Chapter 8
├── _bookdown.yml          # Bookdown config
├── _output.yml            # Output config
├── book.bib               # Bibliography
├── style.css              # Custom CSS
└── docs/                  # Output directory (created after build)
```

## Deployment to GitHub Pages

### Step 1: Create GitHub Repository

1. Go to https://github.com/new
2. Create a new repository called `book`
3. Do NOT initialize with README (we'll push existing content)

### Step 2: Initialize Git and Push

From the `book/` directory:

```bash
# Initialize git repository
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit: Stochastic Calculus book"

# Add remote (replace USERNAME with your GitHub username)
git remote add origin https://github.com/abhinavananddwivedi/book.git

# Push to GitHub
git branch -M main
git push -u origin main
```

### Step 3: Enable GitHub Pages

1. Go to your repository on GitHub
2. Click "Settings" → "Pages" (in left sidebar)
3. Under "Source", select:
   - Branch: `main`
   - Folder: `/docs`
4. Click "Save"

GitHub will automatically deploy your site. After a few minutes, it will be available at:
**https://abhinavananddwivedi.github.io/book/**

### Step 4: Update Your Book on GitHub

Whenever you make changes:

```bash
# Build the book locally first
R -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"

# Add changes
git add .

# Commit with a message
git commit -m "Update content"

# Push to GitHub
git push
```

GitHub Pages will automatically update within a few minutes.

## Adding a Link to Your Main Website

You need to modify your main website repository to add a "Book" tab.

### Option 1: Simple HTML/CSS Website

If your main site uses plain HTML, add this to your navigation menu:

```html
<nav>
  <a href="https://abhinavananddwivedi.github.io/">Home</a>
  <a href="https://abhinavananddwivedi.github.io/book/">Book</a>
  <!-- other links -->
</nav>
```

### Option 2: Jekyll Website

If using Jekyll, edit your `_config.yml` or navigation file:

```yaml
# In _config.yml or _data/navigation.yml
- title: Book
  url: /book/
```

### Option 3: Hugo Website

If using Hugo, edit your menu configuration:

```toml
# In config.toml
[[menu.main]]
  name = "Book"
  url = "/book/"
  weight = 30
```

### Option 4: R Markdown Website

If your main site is an R Markdown website, edit `_site.yml`:

```yaml
navbar:
  title: "My Website"
  left:
    - text: "Home"
      href: index.html
    - text: "Book"
      href: book/
```

## Customization

### Styling

Edit `style.css` to customize the appearance.

### Book Metadata

Edit `index.Rmd` to change:
- Title
- Author
- Description
- URL

### Chapter Order

Edit `_bookdown.yml` to reorder chapters or add new ones.

### Output Formats

Edit `_output.yml` to configure:
- PDF output settings
- Download options
- Sharing buttons
- GitHub links

## Troubleshooting

### Build Errors

If you get LaTeX errors:
```r
# Install TinyTeX
install.packages('tinytex')
tinytex::install_tinytex()
```

### GitHub Pages Not Updating

1. Check that `/docs` folder is committed and pushed
2. Verify GitHub Pages settings point to `/docs` folder
3. Wait a few minutes for GitHub to rebuild
4. Clear your browser cache

### Broken Links

Make sure all internal links use relative paths:
- Good: `[Chapter 1](01-brownian-motion.html)`
- Bad: `[Chapter 1](/book/01-brownian-motion.html)`

## Resources

- [bookdown documentation](https://bookdown.org/yihui/bookdown/)
- [GitHub Pages guide](https://docs.github.com/en/pages)
- [R Markdown guide](https://rmarkdown.rstudio.com/)

## License

[Add your license here]

## Contact

[Your contact information]
