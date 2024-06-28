<script >
  import axios from "axios";

  export default {
    name: 'articles',
    data(){
      return {
        articles: []
      }
    },
    mounted(){
      this.getArticles();
    },
    methods: {
      getArticles(){
        axios.get('http://127.0.0.1:8000/api/articles').then(res =>{
          this.articles = res.data.data
        });
      }
    }
  };
</script>

<template>
  <div class="mx-auto max-w-screen-lg px-4 py-8 sm:px-8">
  <div class="flex items-center justify-between pb-6">
    <div>
      <h2 class="font-semibold text-gray-700">List of articles</h2>
    </div>
    <div class="flex items-center justify-between">
      <div class="ml-10 space-x-8 lg:ml-40">
        <router-link :to="{ name: 'new' }">
          <button class="flex items-center gap-2 rounded-md bg-blue-600 px-4 py-2 text-sm font-semibold text-white focus:outline-none focus:ring hover:bg-blue-700">
            Create New Articles
          </button>
        </router-link>
      </div>
    </div>
  </div>
  <div class="overflow-y-hidden rounded-lg border">
    <div class="overflow-x-auto">
      <table class="w-full">
        <thead>
          <tr class="bg-blue-600 text-left text-xs font-semibold uppercase tracking-widest text-white text-center">
            <th class="px-5 py-3">ID</th>
            <th class="px-5 py-3">Title</th>
            <th class="px-5 py-3">User</th>
            <th class="px-5 py-3">Created at</th>
            <th class="px-5 py-3">Status</th>
            <th class="px-5 py-3"></th>
          </tr>
        </thead>
        <tbody class="text-gray-500">
          <tr v-for="(article , index) in this.articles">
            <td class="border-b border-gray-200 bg-white px-5 py-5 text-sm">
              <p class="whitespace-no-wrap">{{ article.id }}</p>
            </td>
            <td class="border-b border-gray-200 bg-white px-5 py-5 text-sm">
              <div class="flex items-center">
                <div class="h-10 w-10 flex-shrink-0">
                  <!-- <img class="h-full w-full rounded-full" src="" alt="" /> -->
                </div>
                <div class="ml-3">
                  <p class="whitespace-no-wrap">{{ article.title }}</p>
                </div>
              </div>
            </td>
            <td class="border-b border-gray-200 bg-white px-5 py-5 text-sm">
              <p class="whitespace-no-wrap">{{ article.user.name }}</p>
            </td>
            <td class="border-b border-gray-200 bg-white px-5 py-5 text-sm">
              <p class="whitespace-no-wrap">{{ article.created_at }}</p>
            </td>

            <td class="border-b border-gray-200 bg-white px-5 py-5 text-sm">
              <span 
              class="rounded-full px-3 py-1 text-xs font-semibold "
              :class="{ 
                'bg-yellow-200 text-yellow-900': (article.status == 'Draft') 
              , 'bg-green-200 text-green-900': (article.status == 'Published')
              , 'bg-red-200 text-red-900': (article.status == 'Closed')
              }"
              >{{ article.status }}</span>
            </td>
            <td class="border-b border-gray-200 bg-white px-5 py-5 text-sm">
              <div class="ml-10 space-x-34 lg:ml-1">
                <router-link :to="{ name: 'home' }" class="mr-2 flex items-center gap-2 rounded-md border-2 px-4 py-2 text-sm font-semibold text-gray-500 sm:inline focus:outline-none focus:ring hover:bg-gray-200">Cancel</router-link>
                <router-link class="hidden flex items-center rounded-md border-2 border-transparent bg-blue-600 px-4 py-2 text-sm font-semibold  text-white sm:inline focus:outline-none focus:ring hover:bg-blue-700">Save</router-link>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="flex flex-col items-center border-t bg-white px-5 py-5 sm:flex-row sm:justify-between">
      <span class="text-xs text-gray-600 sm:text-sm"> Showing 1 to 5 of 12 Entries </span>
      <div class="mt-2 inline-flex sm:mt-0">
        <button class="mr-2 h-12 w-12 rounded-full border text-sm font-semibold text-gray-600 transition duration-150 hover:bg-gray-100">Prev</button>
        <button class="h-12 w-12 rounded-full border text-sm font-semibold text-gray-600 transition duration-150 hover:bg-gray-100">Next</button>
      </div>
    </div>
  </div>
</div>
</template>

<style scoped>
.read-the-docs {
  color: #888;
}
</style>
