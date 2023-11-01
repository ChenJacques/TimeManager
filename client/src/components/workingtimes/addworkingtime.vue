<template>
    <button @click="addEvent" type="button" class=" text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">New entry</button>
    
    <div class="fixed bg-white left-40 w-9/12 top-60 rounded-2xl " v-show="this.hidden">
        <div class="modal-content p-10">
            <div class="modal-header flex">
                <span class="close" @click="close">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-red-500 hover:text-red-700" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M6 18L18 6M6 6l12 12" />
                    </svg>
                </span>
                <h2 class="text-xl font-bold">Add working time</h2>
            </div>
            <div class="modal-body">
                <div class="flex flex-col">
                    <label class="text-sm font-bold">Start time</label>
                    <input class="border border-gray-400 rounded-lg px-4 py-2 mt-2" type="datetime-local" v-model="start">
                </div>
                <div class="flex flex-col mt-4">
                    <label class="text-sm font-bold">End time</label>
                    <input class="border border-gray-400 rounded-lg px-4 py-2 mt-2" type="datetime-local" v-model="end">
                </div>
            </div>
            <div class="modal-footer">
                <button class="bg-green-500 hover:bg-green-600 text-white font-bold py-2 px-4 rounded" @click="save">Save</button>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: 'working-times-add',
    props: {
        id: {
            type: String,
            required: true,
            default: "plop"
        },
        createFunction: {
            type: Function,
        },
      
    },
    components: {
    },
    data() {
        return {
            hidden: false
        }
    },
    methods: {
        addEvent() {
            this.hidden = !this.hidden
        },
        close() {
            this.hidden = !this.hidden
        },
        save() {
            if (this.start && this.end) {
                this.createFunction(this.start, this.end)
                this.hidden = !this.hidden
            }
            else {
                alert("Please fill all the fields")
            }
        }
    }
}
</script>