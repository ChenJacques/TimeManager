<template>
    <tr class="hover:cursor-pointer border-b even:bg-gray-50 even:dark:bg-gray-800 even:dark:border-gray-700 hover:even:bg-gray-500 odd:bg-white odd:dark:bg-gray-900 hover:odd:bg-gray-500 odd:dark:border-gray-700"
    >
    <th
        scope="row"
        class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white"
    >
        Plop
    </th>
    <td class="px-6 py-4">
        {{ formatDate(this.start) }}
    </td>
    <td class="px-6 py-4">
        {{ formatDate(this.end) }}
    </td>
    <td class="px-6 py-4 flex space-x-3 items-center">
        <Edit-button :id="this.id" :updateFunction="updateWorkingTime" :idworkingtime="this.idwork"/>
        <Delete-button :id="this.id" :delFunction="deleteWorkingTime" :idworkingtime="this.idwork" />
    </td>
    </tr>
</template>

<script>
import axios from "axios";
import EditButton from "@/components/utils/editButton.vue";
import DeleteButton from "@/components/utils/deleteButton.vue";
import dayjs from "dayjs";

export default {
  name: "one-working-time",
    props: {
        id: {
            type: Number,
            required: true,
            default: 0,
        },
        start: {
            type: String,
            required: true,
            default: "asd",
        },
        end: {
            type: String,
            required: true,
            default: "asd",
        },
        data: {
            type: Object,
            required: true,
            default: () => {},
      },
        idwork: {
            type: Number,
            required: true,
        },
  },
  components: {
    EditButton,
    DeleteButton,
  },
  data() {
    return {
      workingTimeData: [],
    };
  },
  mounted() {
    // this.listWorkingTime();
  },
  methods: {
    listWorkingTime() {
      let userid = this.$route.query.userId;
      let workingtimeid = this.$route.query.workingTimeId;
      axios
        .get("http://ec2-35-180-189-136.eu-west-3.compute.amazonaws.com:4000/api/workingtimes/" + userid + "/" + workingtimeid)
        .then((response) => {
          this.workingTimeData = response.data.data;
        });
    },

    updateWorkingTime(workingtimeid, start, end) {
      let data = {
        workingtime: {
          start: start,
          end: end,
          user: 1
        }
      };

      axios.put("http://ec2-35-180-189-136.eu-west-3.compute.amazonaws.com:4000/api/workingtimes/" + workingtimeid, data)
        .then(() => {
          this.$router.go()
        }).catch((error) => {
          console.log(error);
        });
    },

    deleteWorkingTime(id) {
      axios
        .delete(
          "http://ec2-35-180-189-136.eu-west-3.compute.amazonaws.com:4000/api/workingtimes/" + id).then(() => {
          this.$router.go()
        });
    },

   formatDate(dateString) {
      const date = dayjs(dateString);
      // Then specify how you want your dates to be formatted
      return date.format('dddd MMMM D, YYYY, HH:mm');
    }
  },
};
</script>
