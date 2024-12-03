FROM node:18-alpine3.20

LABEL name=myapp

# Set the working directory in the container
WORKDIR /src

# Copy package.json and package-lock.json first (better caching strategy)
COPY package*.json .

# Install dependencies
RUN npm ci --verbose

# Add the rest of the application
COPY main.js .
COPY public public
COPY views views

# Set environment variables (default values)
ENV PORT=5000
ENV INSTANCE_NAME=myapp
ENV INSTANCE_HASH=myhash

# Can add healthcheck here
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
 CMD curl https://localhost:${PORT}/healthz > /dev/null || exit 1
# Expose the port
EXPOSE ${PORT}

# Simplify the ENTRYPOINT to just run node main.js (since PORT is an env var)
ENTRYPOINT ["node", "main.js"]
