# GitHub Actions Workflows

This project includes comprehensive GitHub Actions workflows for CI/CD automation.

## Workflows

### 1. CI/CD Pipeline (`.github/workflows/ci-cd.yml`)

- **Triggers**: Push to `main`/`develop` branches, Pull Requests to `main`
- **Jobs**:
  - **Test & Lint**: Runs ESLint, Prettier, TypeScript check, and build on Node.js 18.x & 20.x
  - **Coverage**: Generates test coverage reports and uploads to Codecov
  - **Deploy**: Deploys to GitHub Pages from `main` branch
  - **Security**: Runs npm security audit

### 2. Pull Request Checks (`.github/workflows/pr-checks.yml`)

- **Triggers**: Pull Request events on `main`/`develop` branches
- **Jobs**:
  - **Code Quality**: Type checking, linting, formatting check, build verification
  - **Bundle Size Check**: Monitors bundle size changes

### 3. Development Workflow (`.github/workflows/dev.yml`)

- **Triggers**: Push to `develop` branch, manual dispatch
- **Jobs**:
  - **Development Build**: Runs tests, linting, and builds artifacts

## Setup Instructions

### Prerequisites

1. GitHub repository with GitHub Actions enabled
2. Node.js project with the scripts defined in package.json

### GitHub Pages Setup

1. Go to repository Settings > Pages
2. Set Source to "GitHub Actions"
3. Ensure Actions permissions allow writing to Pages

### Codecov Setup (Optional)

1. Sign up at [Codecov](https://codecov.io)
2. Connect your GitHub repository
3. Add `CODECOV_TOKEN` secret to your repository

### Environment Variables

- `GITHUB_TOKEN`: Automatically provided by GitHub Actions
- `CODECOV_TOKEN`: Add to repository secrets for coverage reporting (optional)

## Available Scripts

```bash
# Development
npm run start:dev      # Start development server
npm run build          # Build for production
npm run preview        # Preview production build

# Code Quality
npm run lint           # Run ESLint
npm run lint:fix       # Fix ESLint issues
npm run format         # Format code with Prettier
npm run format:check   # Check code formatting

# Testing
npm run test           # Run tests
npm run test:coverage  # Run tests with coverage
npm run test:ui        # Run tests with UI
```

## Workflow Features

✅ **Multi-version Testing**: Tests on Node.js 18.x and 20.x  
✅ **Caching**: Dependency caching for faster builds  
✅ **Security**: Automated dependency vulnerability scanning  
✅ **Code Quality**: ESLint, Prettier, TypeScript checks  
✅ **Coverage**: Test coverage reporting with Codecov integration  
✅ **Deployment**: Automatic GitHub Pages deployment  
✅ **Bundle Size**: Monitoring of bundle size changes  
✅ **Artifacts**: Build artifacts preservation for debugging

## Branch Strategy

- `main`: Production-ready code, triggers deployment
- `develop`: Development branch, triggers dev workflow
- Feature branches: Trigger PR checks when creating pull requests
