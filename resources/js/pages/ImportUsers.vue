<script setup lang="ts">
import { ref, onMounted } from 'vue'
import AppLayout from '@/layouts/AppLayout.vue'
import { Head, router } from '@inertiajs/vue3'
import axios from 'axios'

interface ImportStatus {
    id: number
    status: 'pending' | 'processing' | 'completed' | 'failed'
    total_rows: number
    success_count: number
    failed_count: number
    created_at: string
}

const breadcrumbs = [
    { title: 'Dashboard', href: '/dashboard' },
    { title: 'Import Users', href: '/import' },
]

const file = ref<File | null>(null)
const loading = ref(false)
const imports = ref<ImportStatus[]>([])
const polling = ref(false)

function onFileChange(e: Event) {
    const target = e.target as HTMLInputElement
    if (target.files?.length) {
        file.value = target.files[0]
    }
}

async function uploadFile() {
    if (!file.value) return

    loading.value = true

    const formData = new FormData()
    formData.append('file', file.value)

    try {
        await axios.post('/import/upload', formData)
        file.value = null
        fetchImports()
        startPolling()
    } catch (e) {
        alert('Upload failed')
    } finally {
        loading.value = false
    }
}

async function fetchImports() {
    const { data } = await axios.get('/imports')
    imports.value = data
}

function startPolling() {
    if (polling.value) return

    polling.value = true

    const interval = setInterval(async () => {
        await fetchImports()

        const active = imports.value.some(
            i => i.status === 'pending' || i.status === 'processing'
        )

        if (!active) {
            clearInterval(interval)
            polling.value = false
        }
    }, 3000)
}

onMounted(fetchImports)
</script>

<template>
    <Head title="Import Users" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="p-6 space-y-6">

            <!-- Upload Card -->
            <div class="rounded-xl border p-6 bg-white dark:bg-neutral-900">
                <h2 class="text-lg font-semibold mb-4">Upload CSV</h2>

                <div class="flex items-center gap-4">
                    <input
                        type="file"
                        accept=".csv"
                        @change="onFileChange"
                        class="block w-full text-sm"
                    />

                    <button
                        @click="uploadFile"
                        :disabled="loading"
                        class="px-4 py-2 rounded bg-black text-white disabled:opacity-50"
                    >
                        {{ loading ? 'Uploading...' : 'Upload' }}
                    </button>
                </div>
            </div>

            <!-- Imports Table -->
            <div class="rounded-xl border p-6 bg-white dark:bg-neutral-900">
                <h2 class="text-lg font-semibold mb-4">Imports</h2>

                <table class="w-full text-sm border-collapse">
                    <thead>
                        <tr class="border-b">
                            <th class="text-left p-2">ID</th>
                            <th class="text-left p-2">Status</th>
                            <th class="text-left p-2">Total</th>
                            <th class="text-left p-2">Success</th>
                            <th class="text-left p-2">Failed</th>
                            <th class="text-left p-2">Created</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr
                            v-for="importItem in imports"
                            :key="importItem.id"
                            class="border-b"
                        >
                            <td class="p-2">{{ importItem.id }}</td>
                            <td class="p-2">
                                <span
                                    :class="{
                                        'text-yellow-600': importItem.status === 'processing',
                                        'text-green-600': importItem.status === 'completed',
                                        'text-red-600': importItem.status === 'failed',
                                    }"
                                >
                                    {{ importItem.status }}
                                </span>
                            </td>
                            <td class="p-2">{{ importItem.total_rows }}</td>
                            <td class="p-2">{{ importItem.success_count }}</td>
                            <td class="p-2">{{ importItem.failed_count }}</td>
                            <td class="p-2">{{ importItem.created_at }}</td>
                        </tr>

                        <tr v-if="imports.length === 0">
                            <td colspan="6" class="p-4 text-center text-gray-500">
                                No imports yet
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>
    </AppLayout>
</template>
