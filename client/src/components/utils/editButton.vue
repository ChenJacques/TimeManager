<template>
    <button @click="editEvent">
        <svg class="w-6 h-6 text-gray-800 dark:text-white  hover:dark:text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 24 24">
            <path d="M12.687 14.408a3.01 3.01 0 0 1-1.533.821l-3.566.713a3 3 0 0 1-3.53-3.53l.713-3.566a3.01 3.01 0 0 1 .821-1.533L10.905 2H2.167A2.169 2.169 0 0 0 0 4.167v11.666A2.169 2.169 0 0 0 2.167 18h11.666A2.169 2.169 0 0 0 16 15.833V11.1l-3.313 3.308Zm5.53-9.065.546-.546a2.518 2.518 0 0 0 0-3.56 2.576 2.576 0 0 0-3.559 0l-.547.547 3.56 3.56Z"/>
            <path d="M13.243 3.2 7.359 9.081a.5.5 0 0 0-.136.256L6.51 12.9a.5.5 0 0 0 .59.59l3.566-.713a.5.5 0 0 0 .255-.136L16.8 6.757 13.243 3.2Z"/>
        </svg>
    </button>

    <div class="fixed bg-white left-40 w-9/12 top-60 rounded-2xl " v-show="this.hidden">
        <div class="modal-content p-10">
            <div class="modal-header flex">
                <span class="close" @click="close">
                     <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-red-500 hover:text-red-700" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="M6 18L18 6M6 6l12 12" />
                    </svg>
                </span>
                <h2 class="text-xl font-bold">Edit working time</h2>
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
    name: 'edit-button',
    props: {
        id: {
            type: String,
            required: true,
            default: "plop"
        },
        updateFunction: {
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
            hidden: false
        }
    },
    methods: {
        editEvent() {
            this.hidden = !this.hidden
            // this.updateFunction(this.id)
        },

        close() {
            this.hidden = !this.hidden
        },
        save() {
            if(this.start && this.end) {
                this.updateFunction(this.idworkingtime, this.start, this.end)
                this.hidden = !this.hidden
            }
            else {
                alert("Please fill all the fields")
            }
        }

    }
   }
</script>
