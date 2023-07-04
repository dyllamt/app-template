# Frontend Dockerfile
# Build stage
FROM node:20-alpine as build

# Set work directory
WORKDIR /app

# Copy package.json and package-lock.json before other files
# Utilize Docker cache to save re-installing dependencies if unchanged
COPY package.json package-lock.json ./

# Install dependencies
RUN npm ci

# Copy all files
COPY . .

# Build application
RUN npm run build

# Production stage
FROM node:20-alpine as production

WORKDIR /app

# Copy over built artifacts from build stage
COPY --from=build /app/.next ./.next
COPY --from=build /app/public ./public
COPY --from=build /app/package.json ./package.json
COPY --from=build /app/package-lock.json ./package-lock.json

# Install production dependencies
RUN npm ci --only=production

# Start the application
CMD ["npm", "start"]
