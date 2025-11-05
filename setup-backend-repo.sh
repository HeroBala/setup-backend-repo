const fs = require("fs");
const path = require("path");
const { execSync } = require("child_process");

// Helper: create directory
function createDir(dirPath) {
  if (!fs.existsSync(dirPath)) {
    fs.mkdirSync(dirPath, { recursive: true });
    console.log(`📁 Created directory: ${dirPath}`);
  }
}

// Helper: create file
function createFile(filePath, content = "") {
  fs.writeFileSync(filePath, content);
  console.log(`📄 Created file: ${filePath}`);
}

// Base directory
const baseDir = path.join(__dirname, "backend");

// Directory structure
const folders = [
  "config",
  "controllers",
  "middleware",
  "models",
  "routes",
  "services",
  "utils",
  "views/emails"
];

// Create directories
folders.forEach(folder => createDir(path.join(baseDir, folder)));

// File map
const files = {
  "config/db.config.js": "// Database configuration\n",
  "config/env.config.js": "// Environment variables configuration\n",

  "controllers/auth.controller.js": "// Authentication controller\n",
  "controllers/booking.controller.js": "// Booking-related logic\n",
  "controllers/product.controller.js": "// Product-related logic\n",
  "controllers/blog.controller.js": "// Blog management logic\n",
  "controllers/payment.controller.js": "// Payment-related logic\n",

  "middleware/auth.middleware.js": "// Middleware to protect routes\n",
  "middleware/error.middleware.js": "// Global error handling\n",

  "models/user.model.js": "// User schema and model\n",
  "models/booking.model.js": "// Booking schema and model\n",
  "models/product.model.js": "// Product schema and model\n",
  "models/blog.model.js": "// Blog schema and model\n",
  "models/payment.model.js": "// Payment schema and model\n",

  "routes/auth.routes.js": "// Authentication routes\n",
  "routes/booking.routes.js": "// Booking routes\n",
  "routes/product.routes.js": "// Product routes\n",
  "routes/blog.routes.js": "// Blog routes\n",
  "routes/payment.routes.js": "// Payment routes\n",

  "services/email.service.js": "// Email service to send notifications\n",
  "services/payment.service.js": "// Payment gateway integration\n",

  "utils/email.utils.js": "// Email utilities\n",
  "utils/payment.utils.js": "// Payment utilities\n",
  "utils/logger.js": "// Logger configuration\n",

  "views/emails/resetPassword.html": "<!-- Email template for password reset -->\n",

  ".env": "# Environment variables\n",
  ".gitignore": "# Files to ignore by Git\nnode_modules/\n.env\n",
  ".prettierrc": "{\n  \"singleQuote\": true,\n  \"semi\": true\n}\n",
  "app.js": "// Main application entry point\n",
  "server.js": "// Express server setup\n",
  "package.json": "{\n  \"name\": \"backend\",\n  \"version\": \"1.0.0\",\n  \"main\": \"server.js\"\n}\n"
};

// Create files
Object.entries(files).forEach(([file, content]) => {
  createFile(path.join(baseDir, file), content);
});

console.log("\n✅ Folder structure created!");

// --- Initialize Git repository ---
try {
  process.chdir(baseDir);
  execSync("git init", { stdio: "inherit" });
  execSync("git add .", { stdio: "inherit" });
  execSync('git commit -m "Initial backend folder structure"', { stdio: "inherit" });
  console.log("\n🚀 Git repository initialized and first commit created!");
} catch (error) {
  console.error("❌ Error setting up Git:", error.message);
}

console.log("\n✅ Setup complete!");
