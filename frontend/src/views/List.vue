<script >
  import axios from "axios";
  var url = "http://127.0.0.1:8000/api/articles";
  var url_delete = "http://127.0.0.1:8000/api/delete";
  export default {
    name: 'articles',
    data(){
      return {
        articles: [],
        total_items: 0, 
        start_item: 0,
        end_item: 0,
        next_url: '',
        prev_url: ''
      }
    },
    mounted(){
      this.getArticles();
    },
    methods: {
      getArticles(){
        axios.get(url).then(res =>{
          this.articles = res.data.data
          this.start_item = 1
          this.end_item = res.data.to
          this.total_items = res.data.total
          this.next_url =  res.data.next_page_url
          this.prev_url =  res.data.prev_page_url
          if(res.data.current_page != 1){
            this.start_item = res.data.per_page
            if(res.data.current_page > 2){
              this.start_item = res.data.per_page * (res.data.current_page - 1) + 1
            } 
          }
        });
      },
      getNext(){
        url = this.next_url
        this.getArticles()
      },
      getPrev(){
        url = this.prev_url
        this.getArticles()
      },
      deleteItem(id){
        axios.delete(url + '/' + id).then(res =>{
          
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
          <tr v-for="(item , index) in this.articles">
            <td class="border-b border-gray-200 bg-white px-5 py-5 text-sm">
              <p class="whitespace-no-wrap">{{ item.id }}</p>
            </td>
            <td class="border-b border-gray-200 bg-white px-5 py-5 text-sm">
              <div class="flex items-center">
                <div class="h-10 w-10 flex-shrink-0">
                  <!-- <img class="h-full w-full rounded-full" src="" alt="" /> -->
                </div>
                <div class="ml-3">
                  <p class="whitespace-no-wrap">{{ item.title }}</p>
                </div>
              </div>
            </td>
            <td class="border-b border-gray-200 bg-white px-5 py-5 text-sm">
              <p class="whitespace-no-wrap">{{ item.user.name }}</p>
            </td>
            <td class="border-b border-gray-200 bg-white px-5 py-5 text-sm">
              <p class="whitespace-no-wrap">{{ item.created_at }}</p>
            </td>

            <td class="border-b border-gray-200 bg-white px-5 py-5 text-sm">
              <span 
              class="rounded-full px-3 py-1 text-xs font-semibold "
              :class="{ 
                'bg-yellow-200 text-yellow-900': (item.status == 'Draft') 
              , 'bg-green-200 text-green-900': (item.status == 'Published')
              , 'bg-red-200 text-red-900': (item.status == 'Closed')
              }"
              >{{ item.status }}</span>
            </td>
            <td class="border-b border-gray-200 bg-white px-5 py-5 text-sm">
              <div class="ml-10 space-x-34 lg:ml-1">
                <button
                  @click="deleteItem(item.id)"
                  type="button"
                  data-twe-ripple-init
                  data-twe-ripple-color="light"
                  class="mb-2 inline-block rounded bg-red-500 hover:bg-red-300 px-6 py-2.5 text-xs font-medium uppercase leading-normal text-white shadow-md transition duration-150 ease-in-out hover:shadow-lg focus:shadow-lg focus:outline-none focus:ring-0 active:shadow-lg">
                  <span class="[&>svg]:h-4 [&>svg]:w-4">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                      <path stroke-linecap="round" stroke-linejoin="round" d="m14.74 9-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 0 1-2.244 2.077H8.084a2.25 2.25 0 0 1-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 0 0-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 0 1 3.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 0 0-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 0 0-7.5 0" />
                    </svg>
                  </span>
                </button>

                <button
                 @click="editItem(item.id)"
                  type="button"
                  data-twe-ripple-init
                  data-twe-ripple-color="light"
                  class="mb-2 inline-block rounded bg-blue-500 hover:bg-blue-300 px-6 py-2.5 text-xs font-medium uppercase leading-normal text-white shadow-md transition duration-150 ease-in-out hover:shadow-lg focus:shadow-lg focus:outline-none focus:ring-0 active:shadow-lg">
                  <span class="[&>svg]:h-4 [&>svg]:w-4">
                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="size-6">
                      <path stroke-linecap="round" stroke-linejoin="round" d="m16.862 4.487 1.687-1.688a1.875 1.875 0 1 1 2.652 2.652L10.582 16.07a4.5 4.5 0 0 1-1.897 1.13L6 18l.8-2.685a4.5 4.5 0 0 1 1.13-1.897l8.932-8.931Zm0 0L19.5 7.125M18 14v4.75A2.25 2.25 0 0 1 15.75 21H5.25A2.25 2.25 0 0 1 3 18.75V8.25A2.25 2.25 0 0 1 5.25 6H10" />
                    </svg>
                  </span>
                </button>
              </div>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="flex flex-col items-center border-t bg-white px-5 py-5 sm:flex-row sm:justify-between">
      <span class="text-xs text-gray-600 sm:text-sm"> Showing {{ start_item }} to {{ end_item }} of {{ total_items }} Entries </span>
      <div class="mt-2 inline-flex sm:mt-0">
        <button 
        :disabled="prev_url == null"
        @click="getPrev" 
        :class="{ 'cursor-not-allowed': (prev_url == null) }"
        class="mr-2 h-12 w-12 rounded-full border text-sm font-semibold text-gray-600 transition duration-150 hover:bg-gray-100">Prev</button>
        <button
        :disabled="next_url == null"
        @click="getNext" 
        :class="{ 'cursor-not-allowed': (next_url == null) }"
        class="h-12 w-12 rounded-full border text-sm font-semibold text-gray-600 transition duration-150 hover:bg-gray-100">Next</button>
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
