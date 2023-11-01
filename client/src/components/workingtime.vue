<template>
  <div>
    <OneWorkingTime />
  </div>
  <div></div>
</template>

<script>
// import WorkingTimesAdd from "./workingtimes/addworkingtime.vue"
import OneWorkingTime from "@/components/workingTime/displayOneInfo.vue";

export default {
  name: "working-time",
  props: [],
  components: {
    OneWorkingTime,
  },
  data() {
    return {};
  },
  mounted() {},
  methods: {},
};
</script>

<style scoped></style>
