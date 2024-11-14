<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Car Enthusiast Quiz Results</title>
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');

    body {
      font-family: 'Inter', sans-serif;
      background-image: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)),
      url("https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?auto=format&fit=crop&q=80");
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      min-height: 100vh;
    }

    .icon-pulse {
      animation: pulse 2s cubic-bezier(0.4, 0, 0.6, 1) infinite;
    }

    @keyframes pulse {
      0%, 100% {
        opacity: 1;
      }
      50% {
        opacity: .5;
      }
    }

    .feature-card {
      background: rgba(255, 255, 255, 0.05);
      backdrop-filter: blur(10px);
      border: 1px solid rgba(220, 38, 38, 0.1);
      transition: all 0.3s ease;
    }

    .feature-card:hover {
      transform: translateY(-2px);
      box-shadow: 0 4px 20px rgba(220, 38, 38, 0.2);
    }

    .cta-button {
      background: rgb(220, 38, 38);
      transition: all 0.3s ease;
    }

    .cta-button:hover {
      background: rgb(185, 28, 28);
      transform: scale(1.05);
      box-shadow: 0 4px 20px rgba(220, 38, 38, 0.3);
    }

    .glass-container {
      background: rgba(0, 0, 0, 0.8);
      backdrop-filter: blur(10px);
      border: 1px solid rgba(220, 38, 38, 0.2);
    }
  </style>
</head>
<body class="flex flex-col min-h-screen">
<!-- Header Section -->
<header class="w-full text-center py-8 px-4">
  <div class="flex items-center justify-center gap-3 mb-2">
    <!-- Trophy Icon -->
    <svg class="w-12 h-12 text-red-500 icon-pulse" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 3v4M3 5h4M6 17v4m-2-2h4m5-16l2.286 6.857L21 12l-5.714 2.143L13 21l-2.286-6.857L5 12l5.714-2.143L13 3z"/>
    </svg>

    <h1 class="text-6xl font-bold text-white tracking-tight">
      Quiz <span class="text-red-500">Results</span>
    </h1>

    <!-- Trophy Icon -->
    <svg class="w-12 h-12 text-red-500 icon-pulse" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 3v4M3 5h4M6 17v4m-2-2h4m5-16l2.286 6.857L21 12l-5.714 2.143L13 21l-2.286-6.857L5 12l5.714-2.143L13 3z"/>
    </svg>
  </div>
</header>

<!-- Main Content -->
<main class="container mx-auto px-4 flex-1 flex items-center justify-center">
  <div class="glass-container p-12 rounded-2xl max-w-2xl w-full shadow-2xl">
    <div class="space-y-8 text-center">
      <!-- Medal Icon -->
      <svg class="w-20 h-20 text-red-500 mx-auto" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4M7.835 4.697a3.42 3.42 0 001.946-.806 3.42 3.42 0 014.438 0 3.42 3.42 0 001.946.806 3.42 3.42 0 013.138 3.138 3.42 3.42 0 00.806 1.946 3.42 3.42 0 010 4.438 3.42 3.42 0 00-.806 1.946 3.42 3.42 0 01-3.138 3.138 3.42 3.42 0 00-1.946.806 3.42 3.42 0 01-4.438 0 3.42 3.42 0 00-1.946-.806 3.42 3.42 0 01-3.138-3.138 3.42 3.42 0 00-.806-1.946 3.42 3.42 0 010-4.438 3.42 3.42 0 00.806-1.946 3.42 3.42 0 013.138-3.138z"/>
      </svg>

      <div class="space-y-4">
        <h2 class="text-3xl font-bold text-white">
          Your Performance
        </h2>
        <div class="feature-card rounded-lg p-8 mx-auto max-w-sm">
          <h3 class="text-red-500 text-4xl font-bold mb-2">
            <%= request.getAttribute("score") %> / <%= request.getAttribute("totalQuestions") %>
          </h3>
          <p class="text-gray-300">Correct Answers</p>
        </div>
      </div>

      <!-- CTA Button -->
      <a href="index.jsp" class="cta-button inline-block text-white px-12 py-4 rounded-full text-lg font-bold">
        Take the Quiz Again
      </a>

      <p class="text-gray-400 text-sm">
        Keep practicing to become a true car expert!
      </p>
    </div>
  </div>
</main>
</body>
</html>