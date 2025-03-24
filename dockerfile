# Use a lightweight base image
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Copy only necessary files to avoid cache busting
COPY package.json package-lock.json ./

# Install dependencies
RUN npm ci --only=production

# Copy application files
COPY . .

# Use a non-root user for security
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Expose the application port
EXPOSE 3000

# Start the application
CMD ["npm", "run", "dev"]
