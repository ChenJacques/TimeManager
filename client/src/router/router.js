import { createRouter, createWebHistory } from 'vue-router'
import WorkingTimes from "../components/workingtimes.vue";
import UserProfile from "../components/user.vue";
// import NotFound from "@/components/utils/notFound.vue"



const routes = [
    {
        path: '/',
        name: 'Home',
        component: UserProfile
    },
    //     {
    //         path: '/:pathMatch(.*)*',
    //         name: 'NotFound',
    //         component: NotFound
    //     }
    {
        path: '/user',
        name: 'User',
        component: UserProfile
    },
    {
        path: '/workingtimes/:id',
        name: 'WorkingTimes',
        component: WorkingTimes
    },
    // {
    //     path: '/workingtime',
    //     name: 'WorkingTime',
    //     component: WorkingTime
    // }

]

export default createRouter({
    history: createWebHistory(),
    routes
});