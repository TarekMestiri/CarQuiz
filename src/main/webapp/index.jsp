<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Enthusiast Quiz</title>
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
        <!-- Speedometer Icon -->
        <svg class="w-12 h-12 text-red-500 icon-pulse" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 17a2 2 0 11-4 0 2 2 0 014 0zM19 17a2 2 0 11-4 0 2 2 0 014 0z"/>
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16V6a1 1 0 00-1-1H4a1 1 0 00-1 1v10a1 1 0 001 1h1m8-1a1 1 0 01-1 1H9m4-1V8a1 1 0 011-1h2.586a1 1 0 01.707.293l3.414 3.414a1 1 0 01.293.707V16a1 1 0 01-1 1h-1m-6-1a1 1 0 001 1h1M5 17a2 2 0 104 0m-4 0a2 2 0 114 0m6 0a2 2 0 104 0m-4 0a2 2 0 114 0"/>
        </svg>

        <h1 class="text-6xl font-bold text-white tracking-tight">
            Car Enthusiast <span class="text-red-500">Quiz</span>
        </h1>

        <!-- Car Icon -->
        <svg class="w-12 h-12 text-red-500 icon-pulse" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 17a2 2 0 11-4 0 2 2 0 014 0zM19 17a2 2 0 11-4 0 2 2 0 014 0z"/>
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16V6a1 1 0 00-1-1H4a1 1 0 00-1 1v10a1 1 0 001 1h1m8-1a1 1 0 01-1 1H9m4-1V8a1 1 0 011-1h2.586a1 1 0 01.707.293l3.414 3.414a1 1 0 01.293.707V16a1 1 0 01-1 1h-1m-6-1a1 1 0 001 1h1M5 17a2 2 0 104 0m-4 0a2 2 0 114 0m6 0a2 2 0 104 0m-4 0a2 2 0 114 0"/>
        </svg>
    </div>
    <p class="text-gray-300 text-xl mt-4">
        Rev up your knowledge and test your automotive expertise
    </p>
</header>

<!-- Main Content -->
<main class="container mx-auto px-4 flex-1 flex items-center justify-center">
    <div class="glass-container p-12 rounded-2xl max-w-2xl w-full shadow-2xl">
        <div class="space-y-8 text-center">
            <!-- Trophy Icon -->
            <svg class="w-20 h-20 text-red-500 mx-auto" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 3v4M3 5h4M6 17v4m-2-2h4m5-16l2.286 6.857L21 12l-5.714 2.143L13 21l-2.286-6.857L5 12l5.714-2.143L13 3z"/>
            </svg>

            <div class="space-y-4">
                <h2 class="text-3xl font-bold text-white">
                    Ready to Test Your Car Knowledge?
                </h2>
                <p class="text-gray-300 text-lg">
                    From classic cars to modern supercars, prove you're a true automotive aficionado.
                </p>
            </div>

            <!-- Features Grid -->
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6 my-8">
                <div class="feature-card rounded-lg p-4">
                    <h3 class="text-red-500 font-bold">20 Questions</h3>
                    <p class="text-gray-400 text-sm">Covering all eras</p>
                </div>
                <div class="feature-card rounded-lg p-4">
                    <h3 class="text-red-500 font-bold">Multiple Categories</h3>
                    <p class="text-gray-400 text-sm">From classics to supercars</p>
                </div>
                <div class="feature-card rounded-lg p-4">
                    <h3 class="text-red-500 font-bold">Instant Results</h3>
                    <p class="text-gray-400 text-sm">See how you rank</p>
                </div>
            </div>

            <!-- CTA Button -->
            <form action="quiz" method="get">
                <button type="submit"
                        class="cta-button text-white px-12 py-4 rounded-full text-lg font-bold">
                    Start The Quiz
                </button>
            </form>

            <p class="text-gray-400 text-sm">
                Test your knowledge across multiple automotive categories
            </p>
        </div>
    </div>
</main>

</body>
</html>
