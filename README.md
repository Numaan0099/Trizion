# Laravel CSV User Import System

A robust Laravel application featuring asynchronous CSV file import with batch processing, real-time progress tracking, and a modern Vue.js frontend.

## Features

- ✅ **Asynchronous CSV Processing** - Upload and process CSV files in the background
- ✅ **Batch Processing** - Large files are split into chunks of 100 rows for parallel processing
- ✅ **Real-time Progress Tracking** - Live updates on import status, success/failure counts
- ✅ **Email Validation** - Validates email format before importing
- ✅ **Error Handling** - Graceful error handling with detailed logging
- ✅ **Modern UI** - Clean, responsive Vue.js interface with Tailwind CSS
- ✅ **Queue-based Architecture** - Uses Laravel queues for scalable processing

## Tech Stack

- **Backend:** Laravel 11.x
- **Frontend:** Vue.js 3 + TypeScript + Inertia.js
- **Database:** MySQL
- **Queue:** Laravel Database Queue
- **Styling:** Tailwind CSS

## Installation

### Prerequisites

- PHP 8.2 or higher
- Composer
- Node.js & NPM
- MySQL

### Setup Steps

1. **Clone the repository**
```bash
git clone <repository-url>
cd <project-directory>
```

2. **Install PHP dependencies**
```bash
composer install
```

3. **Install Node dependencies**
```bash
npm install
```

4. **Environment Configuration**
```bash
cp .env.example .env
php artisan key:generate
```

5. **Configure Database**

Update your `.env` file with database credentials:
```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=your_database_name
DB_USERNAME=your_username
DB_PASSWORD=your_password
```

6. **Configure Queue**

Set queue connection to database in `.env`:
```env
QUEUE_CONNECTION=database
```

7. **Import Database**

Import the SQL dump file located in the project root directory:
```bash
mysql -u your_username -p your_database_name < database.sql
```

**Note:** A sample CSV file (`sample_users.csv`) is included in the project root for testing the import feature.

8. **Build Frontend Assets**
```bash
npm run dev
```

9. **Start the Application**

In one terminal, start the Laravel server:
```bash
php artisan serve
```

In another terminal, start the queue worker:
```bash
php artisan queue:work
```

## Usage

### Accessing the Import Page

1. Register/Login to your account
2. Navigate to `/import` or click "Import Users" from the dashboard
3. Click "Choose File" and select a CSV file
4. Click "Upload" to start the import process

### CSV File Format

Your CSV file should have the following format:

```csv
name,email
John Doe,john.doe@example.com
Jane Smith,jane.smith@example.com
Michael Johnson,michael.johnson@example.com
```

**Requirements:**
- First row must be a header row with `name,email`
- Name field is required
- Email field is required and must be valid email format
- Maximum file size: 10MB
