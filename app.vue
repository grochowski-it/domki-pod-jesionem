<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useSupabaseClient } from '#imports'

const supabase = useSupabaseClient()
const data = ref<any>(null)
const error = ref<any>(null)

onMounted(async () => {
  try {
    const response = await supabase.from('test_connection').select('*')
    data.value = response.data
    error.value = response.error
  } catch (e) {
    error.value = e
  }
})
</script>

<template>
  <div class="container">
    <header class="header">
      <h1 class="title">Projekt Agro Domki - Audyt Red Team</h1>
      <p class="subtitle">Pełna refaktoryzacja UI bez Shadcn-Vue</p>
    </header>
    <main class="main-content">
      <section class="data-section">
        <h2 class="section-title">Dane z bazy:</h2>
        <div class="data-container">
          <pre v-if="data" class="json-data">{{ JSON.stringify(data, null, 2) }}</pre>
          <div v-else-if="!error" class="loading">Ładowanie danych...</div>
        </div>
        <div v-if="error" class="error-container">
          <h3 class="error-title">Wystąpił błąd:</h3>
          <pre class="error-data">{{ JSON.stringify(error, null, 2) }}</pre>
        </div>
      </section>
      <section class="reservation-section">
         <h2 class="section-title">Rezerwacja</h2>
         <form class="reservation-form">
            <div class="form-group">
                <label for="date-start">Data przyjazdu:</label>
                <input type="date" id="date-start" class="form-input">
            </div>
            <div class="form-group">
                <label for="date-end">Data wyjazdu:</label>
                <input type="date" id="date-end" class="form-input">
            </div>
            <button type="submit" class="submit-btn">Rezerwuj (Demo)</button>
         </form>
      </section>
    </main>
  </div>
</template>

<style scoped>
:root {
  --primary-color: #2c3e50;
  --secondary-color: #34495e;
  --accent-color: #3498db;
  --background-color: #f8f9fa;
  --text-color: #333;
  --error-color: #e74c3c;
  --border-radius: 8px;
  --box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  --transition: all 0.3s ease;
}

body {
  margin: 0;
  font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif;
  background-color: var(--background-color);
  color: var(--text-color);
  line-height: 1.6;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 2rem;
  background-color: #ffffff;
  min-height: 100vh;
  box-shadow: 0 0 20px rgba(0,0,0,0.05);
}

.header {
  text-align: center;
  padding-bottom: 2rem;
  border-bottom: 2px solid #eee;
  margin-bottom: 2rem;
}

.title {
  color: #2c3e50;
  font-size: 2.5rem;
  margin-bottom: 0.5rem;
  font-weight: 700;
  letter-spacing: -0.5px;
}

.subtitle {
  color: #7f8c8d;
  font-size: 1.2rem;
  font-weight: 300;
}

.main-content {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 2rem;
}

@media (max-width: 768px) {
  .main-content {
    grid-template-columns: 1fr;
  }
}

.section-title {
  color: #34495e;
  font-size: 1.5rem;
  margin-bottom: 1rem;
  padding-bottom: 0.5rem;
  border-bottom: 1px solid #eee;
}

.data-section, .reservation-section {
  background: #fff;
  padding: 2rem;
  border-radius: 8px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.05);
  border: 1px solid #f0f0f0;
  transition: transform 0.3s ease;
}

.data-section:hover, .reservation-section:hover {
  transform: translateY(-5px);
  box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
}

.data-container {
  background: #f8f9fa;
  border-radius: 6px;
  padding: 1rem;
  overflow-x: auto;
  border: 1px solid #e9ecef;
}

.json-data {
  font-family: 'Fira Code', 'Courier New', Courier, monospace;
  font-size: 0.9rem;
  color: #2ecc71;
  margin: 0;
  white-space: pre-wrap;
}

.loading {
  color: #3498db;
  font-style: italic;
  text-align: center;
  padding: 2rem;
  animation: pulse 1.5s infinite;
}

@keyframes pulse {
  0% { opacity: 0.6; }
  50% { opacity: 1; }
  100% { opacity: 0.6; }
}

.error-container {
  margin-top: 1.5rem;
  padding: 1.5rem;
  background-color: #fdf0ed;
  border-left: 4px solid #e74c3c;
  border-radius: 4px;
}

.error-title {
  color: #e74c3c;
  margin-top: 0;
  margin-bottom: 0.5rem;
  font-size: 1.2rem;
}

.error-data {
  color: #c0392b;
  font-family: 'Fira Code', 'Courier New', Courier, monospace;
  font-size: 0.85rem;
  margin: 0;
  white-space: pre-wrap;
}

.reservation-form {
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
}

.form-group {
  display: flex;
  flex-direction: column;
  gap: 0.5rem;
}

.form-group label {
  font-weight: 500;
  color: #2c3e50;
  font-size: 0.95rem;
}

.form-input {
  padding: 0.75rem 1rem;
  border: 1px solid #ddd;
  border-radius: 6px;
  font-size: 1rem;
  transition: border-color 0.3s ease, box-shadow 0.3s ease;
  font-family: inherit;
}

.form-input:focus {
  outline: none;
  border-color: #3498db;
  box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
}

.submit-btn {
  background-color: #3498db;
  color: white;
  border: none;
  padding: 1rem 1.5rem;
  font-size: 1.1rem;
  font-weight: 600;
  border-radius: 6px;
  cursor: pointer;
  transition: background-color 0.3s ease, transform 0.1s ease;
  margin-top: 1rem;
}

.submit-btn:hover {
  background-color: #2980b9;
}

.submit-btn:active {
  transform: scale(0.98);
}
</style>
