FROM node:20-slim AS build
WORKDIR /app

# Copy package files first (better caching)
COPY package*.json ./
RUN npm ci --legacy-peer-deps --omit=dev

# Copy source and build
COPY . .
RUN npm run build

# Production stage
FROM nginx:alpine

# Copy custom nginx config if needed
# COPY nginx.conf /etc/nginx/nginx.conf

# Copy built assets
COPY --from=build /app/dist /usr/share/nginx/html

# Create non-root user for security
RUN addgroup -g 1001 -S nodejs && \
    adduser -S nodejs -u 1001 && \
    chown -R nodejs:nodejs /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
