# CamBeezy.com

Official website for independent artist CamBeezy. A simple static site (HTML/CSS/JS) with links to music, contact info, and streaming platforms.

## Tech Stack

- **Frontend:** Static HTML, CSS, and vanilla JavaScript — no framework or build step
- **Hosting:** AWS S3 static website hosting
- **DNS:** Route 53
- **Infrastructure:** Managed with Terraform (`/terraform`) — S3 bucket, Route 53 record, IAM
- **CI/CD:** GitHub Actions — automatically syncs the site to S3 on every push to `main`

## Project Structure

├── index.html          # Home page
├── music.html           # Music/links page
├── contact.html         # Contact page
├── assets/
│   ├── css/styles.css   # Site styling
│   ├── js/main.js       # Site scripts
│   └── img/             # Images
├── terraform/           # Infrastructure as code (S3, Route 53, IAM)
└── .github/workflows/   # Deploy pipeline (S3 sync on push to main)



## How It Works

1. Site files live at the repo root and in `assets/`.
2. On every push to `main`, a GitHub Actions workflow runs `aws s3 sync . s3://cambeezy.com --delete`, which mirrors the repo directly to the live S3 bucket.
3. Route 53 points `cambeezy.com` at the S3 bucket, so changes go live automatically once merged to `main`.

## Making Changes

1. Create a feature branch off `main`.
2. Make your edits locally and preview by opening the HTML files in a browser.
3. Open a pull request into `main`.
4. Once merged, the site deploys automatically — no manual upload needed.

⚠️ Because the deploy syncs with `--delete`, merging to `main` will remove any live file that's no longer present in the repo.
