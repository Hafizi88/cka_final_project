import { createApp } from 'vue'
import { createMemoryHistory, createRouter } from 'vue-router'

import './style.css'

import App from './App.vue'
import New from './views/New.vue'
import List from './views/List.vue'


const routes = [
    { path: '/', component: New },
    { path: '/list2', component: List },
  ]

const router = createRouter({
    history: createMemoryHistory(),
    routes,
})

createApp(App)
.use(router)
.mount('#app')
