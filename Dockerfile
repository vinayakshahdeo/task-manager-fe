# =========================
# Stage 1: Build Vite app
# =========================
FROM node:lts-alpine AS build
WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm ci

# Copy source and build
COPY . .
RUN npm run build

# =========================
# Stage 2: Serve with Nginx
# =========================
FROM nginx:alpine

# Remove default nginx static content
RUN rm -rf /usr/share/nginx/html/*

# Copy built assets from the build stage
COPY --from=build /app/dist /usr/share/nginx/html

# Expose port 80 in the container
EXPOSE 80

# Run nginx in foreground
CMD ["nginx", "-g", "daemon off;"]
