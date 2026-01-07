# Complete Setup Guide: Stochastic Calculus Book on GitHub Pages

This is a comprehensive, step-by-step guide to get your book online.

## Overview

You will:
1. Set up the bookdown project locally
2. Build the book
3. Create a GitHub repository
4. Deploy to GitHub Pages at `abhinavananddwivedi.github.io/book/`
5. Add a link from your main website

Estimated time: 30-45 minutes

---

## Part 1: Local Setup and Build

### 1.1 Install Prerequisites

Make sure you have:
- **R** (version 4.0+): Download from https://www.r-project.org/
- **RStudio** (recommended): Download from https://posit.co/download/rstudio-desktop/
- **Git**: Download from https://git-scm.com/

### 1.2 Install R Packages

Open R or RStudio and run:

```r
install.packages(c("bookdown", "rmarkdown", "knitr"))
```

### 1.3 Organize Your Files

Place all the book files in a directory called `book/`:

```
book/
├── index.Rmd
├── 01-brownian-motion.Rmd
├── 02-ito-calculus.Rmd
├── 03-sdes.Rmd
├── 04-feynman-kac.Rmd
├── 05-risk-neutral.Rmd
├── 06-black-scholes.Rmd
├── 07-jumps.Rmd
├── 08-levy.Rmd
├── _bookdown.yml
├── _output.yml
├── book.bib
├── style.css
├── build_book.R
└── README.md
```

### 1.4 Build the Book Locally

**Method 1: Using R Console**

```r
# Set working directory to the book folder
setwd("path/to/book")

# Build the book
bookdown::render_book("index.Rmd", "bookdown::gitbook")
```

**Method 2: Using the Build Script**

From terminal/command prompt in the book directory:

```bash
Rscript build_book.R
```

**Method 3: Using RStudio**

1. Open the book folder as a project in RStudio
2. Open `index.Rmd`
3. Click the "Build Book" button in the Build pane

### 1.5 Preview Locally

After building, open `docs/index.html` in your web browser to preview the book.

If everything looks good, proceed to GitHub deployment!

---

## Part 2: GitHub Repository Setup

### 2.1 Create a New Repository

1. Go to https://github.com/new
2. Fill in:
   - Repository name: `book`
   - Description: "Online book on Stochastic Calculus"
   - Visibility: Public
   - **Do NOT check** "Initialize with README"
3. Click "Create repository"

### 2.2 Push Your Code to GitHub

From the `book/` directory in terminal:

```bash
# Initialize git (if not already done)
git init

# Add all files
git add .

# Make your first commit
git commit -m "Initial commit: Stochastic Calculus book"

# Add GitHub as remote (replace with your username)
git remote add origin https://github.com/abhinavananddwivedi/book.git

# Push to GitHub
git branch -M main
git push -u origin main
```

If this is your first time, Git may ask you to configure your identity:

```bash
git config --global user.email "your_email@example.com"
git config --global user.name "Your Name"
```

---

## Part 3: Enable GitHub Pages

### 3.1 Configure GitHub Pages

1. Go to your repository: https://github.com/abhinavananddwivedi/book
2. Click **Settings** (top right)
3. In the left sidebar, click **Pages**
4. Under "Build and deployment":
   - Source: Deploy from a branch
   - Branch: `main`
   - Folder: `/docs`
5. Click **Save**

### 3.2 Wait for Deployment

GitHub will build and deploy your site. This takes 2-5 minutes.

You can monitor progress:
1. Go to the "Actions" tab in your repository
2. You should see a workflow running
3. Wait for it to complete (green checkmark)

### 3.3 Verify Your Book is Live

Visit: **https://abhinavananddwivedi.github.io/book/**

You should see your book! 🎉

---

## Part 4: Add Link to Main Website

Now let's add a "Book" tab to your main website.

### 4.1 Clone Your Main Website Repository

```bash
cd ..  # Go up one directory
git clone https://github.com/abhinavananddwivedi/abhinavananddwivedi.github.io.git
cd abhinavananddwivedi.github.io
```

### 4.2 Determine Website Type

Look for these files to identify your website type:

- **Jekyll**: `_config.yml`
- **Hugo**: `config.toml`
- **R Markdown**: `_site.yml`
- **Plain HTML**: `index.html`

### 4.3 Add the Navigation Link

**For Jekyll sites:**

Find your navigation file (often `_config.yml` or `_includes/navigation.html`) and add:

```yaml
- title: Book
  url: /book/
```

**For Plain HTML:**

Find your navigation menu in `index.html`:

```html
<nav>
  <a href="/">Home</a>
  <a href="/book/">Book</a>
  <a href="/research/">Research</a>
</nav>
```

**For R Markdown:**

Edit `_site.yml`:

```yaml
navbar:
  title: "Abhinav Anand"
  left:
    - text: "Home"
      href: index.html
    - text: "Book"
      href: book/
```

See `ADD_BOOK_TAB.md` for more detailed instructions for each type.

### 4.4 Commit and Push

```bash
git add .
git commit -m "Add Book tab to navigation"
git push
```

### 4.5 Verify the Link

Wait 2-5 minutes, then visit: https://abhinavananddwivedi.github.io/

You should see a "Book" tab that links to your book!

---

## Part 5: Updating Your Book

Whenever you want to update the book:

### 5.1 Make Your Changes

Edit the .Rmd files as needed.

### 5.2 Rebuild

```bash
cd path/to/book
Rscript build_book.R
```

Or in R:
```r
bookdown::render_book("index.Rmd", "bookdown::gitbook")
```

### 5.3 Commit and Push

```bash
git add .
git commit -m "Update chapter X with new content"
git push
```

GitHub Pages will automatically rebuild and deploy your changes in 2-5 minutes.

---

## Troubleshooting

### "Permission denied" when pushing to GitHub

Set up SSH keys or use a personal access token. See:
https://docs.github.com/en/authentication

### Book builds but GitHub Pages shows 404

1. Verify `docs/` folder is committed and pushed
2. Check GitHub Pages settings point to `main` branch and `/docs` folder
3. Wait 5 minutes and try again
4. Check the Actions tab for build errors

### Changes not appearing on website

1. GitHub Pages caches aggressively - wait 5-10 minutes
2. Clear your browser cache
3. Try in an incognito/private window
4. Check the Actions tab to ensure deployment completed

### LaTeX math not rendering

Add to your `_output.yml`:

```yaml
bookdown::gitbook:
  config:
    math:
      config: TeX-AMS-MML_HTMLorMML
```

### Build errors in R

Try:
```r
# Update packages
update.packages(ask = FALSE)

# Reinstall bookdown
remove.packages("bookdown")
install.packages("bookdown")
```

---

## Quick Reference

**Build book:**
```r
bookdown::render_book("index.Rmd", "bookdown::gitbook")
```

**Update and deploy:**
```bash
Rscript build_book.R
git add .
git commit -m "Update book"
git push
```

**Your URLs:**
- Book: https://abhinavananddwivedi.github.io/book/
- Main site: https://abhinavananddwivedi.github.io/
- Repository: https://github.com/abhinavananddwivedi/book

---

## Next Steps

Once your book is live, you can:

1. **Customize the appearance**: Edit `style.css`
2. **Add more content**: Create new .Rmd chapter files
3. **Enable PDF downloads**: Uncomment PDF settings in `_output.yml`
4. **Add analytics**: Insert Google Analytics code
5. **Enable comments**: Integrate Disqus or Hypothesis

Enjoy your new book! 📚

---

## Getting Help

- Bookdown documentation: https://bookdown.org/yihui/bookdown/
- GitHub Pages docs: https://docs.github.com/en/pages
- R Markdown guide: https://rmarkdown.rstudio.com/

For questions specific to this project, refer to the other documentation files:
- `README.md` - General information
- `ADD_BOOK_TAB.md` - Detailed navigation instructions
- The book chapters themselves - they're also learning resources!
