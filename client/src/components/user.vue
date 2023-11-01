<template>
    <div class="bg-red-300 h-full">
        <div class="w-11/12 relative overflow-x-auto shadow-md sm:rounded-lg">
            <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                    <tr>
                        <th scope="col" class="px-6 py-3">
                            User name
                        </th>
                        <th scope="col" class="px-6 py-3">
                            E-mail
                        </th>
                        <th scope="col" class="px-6 py-3">
                            Actions
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="user in users" :key="user.email"
                        class="bg-white border-b even:bg-gray-700 odd:bg-gray-900 border-gray-900 even:">
                        <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                            {{ user.name }}
                        </th>
                        <td class="px-6 py-4">
                            {{ user.email }}
                        </td>
                        <td class="px-6 py-4">
                            <a href="">More</a>
                            <a href="">Edit</a>
                            <a href="">Delete</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <button class="bg-red-500">
            BUTTTOOOON
        </button>
    </div>
</template>

<script>

export default {
    name: 'user-profile',
    data() {
        return {
            users: [
                { name: 'John Doe', email: 'john@example.com' },
                { name: 'Jane Smith', email: 'jane@example.com' },
            ]
        };
    }
}

</script>

<style scoped></style>

// faire un composant pour choisir le nom de l'utilisateur et 
// le mettre dans le localstorage 
// 
// faire une nav bar avec le profile de l'utilisateur en menu deroulant