<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { useSupabaseSafe } from '~/composables/useSupabaseSafe'

const supabase = useSupabaseSafe()
const data = ref<any>(null)
const error = ref<any>(null)

onMounted(async () => {
  try {
    const response = await supabase.safeQuery(() => supabase.client.from('test_connection').select('*'))
    data.value = response.data
    error.value = response.error
  } catch (e) {
    error.value = e
  }
})
</script>

<template>
  <div>
    <pre v-if="data">{{ JSON.stringify(data, null, 2) }}</pre>
    <pre v-if="error" style="color: red">{{ JSON.stringify(error, null, 2) }}</pre>
  </div>
</template>
