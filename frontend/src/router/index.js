import Vue from "vue";
import VueRouter from "vue-router";

import top from "../views/top.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "top",
    component: top,
  },
  {
    path: "/login",
    name: "new",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/new.vue"),
  },
  {
    path: "/users/new",
    name: "users_new",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/users_new.vue"),
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

export default router;
