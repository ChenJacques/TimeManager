<template >
    <div id="app" class="h-screen grid grid-rows-6 bg-gray-300 ">
      <div class="row-span-1">
        <NavBar></NavBar>
      </div>
      <div class="flex justify-center h-full row-span-5">
          <router-view></router-view>
      </div>
    </div>
</template>

<script>
import router from "./router/router"
import NavBar from "./components/nav-bar.vue";
export default {
    name: 'App',
    router,
    components: { NavBar }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin: 0;
  padding: 0;
}

body, #app {
  margin: 0;
  padding: 0;
}

</style>
