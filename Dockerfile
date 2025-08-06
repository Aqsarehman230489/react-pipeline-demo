# Step 1: Use a small Node image
FROM node:18-alpine

# Step 2: Set working directory
WORKDIR /app

# Step 3: Copy only package.json first (cache dependencies)
COPY package*.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the rest of the project
COPY . .

# Step 6: Build React app
RUN npm run build

# Step 7: Serve with a lightweight web server
RUN npm install -g serve
CMD ["serve", "-s", "build"]

# Expose the port
EXPOSE 3000
