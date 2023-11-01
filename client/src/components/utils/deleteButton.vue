<template>
    <button @click="delEvent">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-red-500 hover:text-red-700" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M6 18L18 6M6 6l12 12" />
        </svg>
    </button>
</template>

<script>
export default {
    name: 'delete-button',
    props: {
        id: {
            type: String,
            required: true,
            default: "plop"
        },
        delFunction: {
            type: Function,
        },
        idworkingtime: {
            type: Number,
            required: true,
        },
    },
    components: {
    },
    data() {
        return {
        }
    },
    methods: {
        delEvent() {
            console.log(this.id)
            this.delFunction(this.idworkingtime)
        }
    }
   }
</script>