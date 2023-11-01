<template>
  <div class="flex flex-col">
    <div class="py-2 h-auto">
      <h2>WorkingTimes</h2>
      <AddWorkingTime :id="this.id" :createFunction="createFunction"  />
    </div>
    <div class="h-auto overflow-auto m-5">
      <WorkingTable />
    </div>
  </div>
</template>

<script>
import WorkingTable from "./workingtimes/workingtable.vue";
import AddWorkingTime from "./workingtimes/addworkingtime.vue";
import axios from "axios";

export default {
  name: "working-times",
  components: {
    WorkingTable,
    AddWorkingTime,
  },
  data() {
    return {
      id: this.$route.params.id,
    };
  },
  mounted() {
    console.log(".env", process.env.VUE_APP_ENDPOINT);
  },
  methods: {

    createFunction(start, end) {
      let data = {
        workingtime: {
          start: start,
          end: end,
          user: this.id,
        },
      };
      axios.post("http://ec2-35-180-189-136.eu-west-3.compute.amazonaws.com:4000/workingtimes/", data).then((response) => {
        console.log(response);
        // this.$router.go();
      });
    },
  },
};
</script>

<style scoped></style>
