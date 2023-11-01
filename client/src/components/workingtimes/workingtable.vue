<template>
  <div class=" shadow-md sm:rounded-lg bg-red-500">
    <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
      <thead
        class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400"
      >
        <tr>
            <th scope="col" class="px-6 py-3">User name</th>
            <th scope="col" class="px-6 py-3">Start time</th>
            <th scope="col" class="px-6 py-3">End time</th>
            <th scope="col" class="px-6 py-3">Actions</th>
        </tr>
      </thead>
      <tbody>
        <OneWorkingTime v-for="data in workingTimes" :key="data.id" :id="this.$route.params.id" :start="data.start" :end="data.end" :idwork="data.id"/>
      </tbody>
       
     
    </table>
  </div>
  <!-- </div> -->
</template>
<script>
import axios from "axios";
import OneWorkingTime from "@/components/workingTime/displayOneInfo.vue";

export default {
  name: "working-table",
  props: [],
  components: {
    OneWorkingTime,
  },
  data() {
    return {
      workingTimes: [],
    };
  },
  mounted() {
    this.getWorkingTimes();
  },

  methods: {
    moveTo(id) {
      this.$router.push({
        name: "WorkingTime",
        query: { workingTimeId: id, userId: this.$route.params.id },
      });
    },

    getWorkingTimes() {
      let userid = this.$route.params.id;
      axios
        .get(
          "http://ec2-35-180-189-136.eu-west-3.compute.amazonaws.com:4000/api/workingtimes/search/" +
            userid +
            "?start=2023&end=2023"
        )
        .then((response) => {
          this.workingTimes = response.data.data;
        })
        .catch(() => console.log("error request"));
    },
  },
};
</script>

<style scoped></style>
