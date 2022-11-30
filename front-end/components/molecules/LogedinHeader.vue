<template>
  <div>
    <v-navigation-drawer
      v-model="drawer"
      absolute
      temporary
    >
      <v-list-item>
        <v-list-item-avatar>
          <v-img
            max-height="50"
            max-width="50"
            v-bind:src="require('@/assets/image/undraw_male_avatar_323b.svg')"
          ></v-img>
        </v-list-item-avatar>

        <v-list-item-content>
          <v-list-item-title>Test User</v-list-item-title>
        </v-list-item-content>
      </v-list-item>

      <v-divider></v-divider>

      <v-list dense>
        <v-list-item
          v-for="item in items"
          :key="item.title"
          link
          :to="item.to"
        >
          <v-list-item-icon>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item link>
         <v-list-item-icon>
            <v-icon>mdi-exit-to-app</v-icon>
          </v-list-item-icon>
          <v-list-item-content @click="LogOutEvent">
            <v-list-item-title>Log Out</v-list-item-title>
          </v-list-item-content> 
        </v-list-item>
      </v-list>
    </v-navigation-drawer>
    <v-app-bar color="#a7f9ff" class="text-h4">
      <v-img
        @click.stop="drawer = !drawer"
        max-height="50"
        max-width="50"
        v-bind:src="require('@/assets/image/undraw_male_avatar_323b.svg')"
      ></v-img>
      <v-spacer />
        <slot></slot>
      <v-spacer />
    </v-app-bar>
  </div>
</template>

<script>
 import axios from 'axios';
  export default {
    data () {
      return {
        drawer: null,
        items: [
          { title: 'Following', icon: 'mdi-account-multiple',to: '/following', },
          { title: 'Followers', icon: 'mdi-account-multiple-outline',to: '/followers',},
          { title: 'My Profile', icon: 'mdi-card-account-details-outline',to: '/myProfile',},
          { title: 'Quiz List', icon: 'mdi-help-box',to: '/quizList',},
          { title: 'Description', icon: 'mdi-forum',to: '/description',},
        ],
      }
    },
    methods: {
      LogOutEvent() {
      axios
        .get('http://localhost:3000/logout')
        .then(response => {
          if (response.data.message === "ログアウトしました") {
              this.$router.push('/')
          }
        })
        .catch(error => {
          console.error(error);
        });  
        },
    }
  }
</script>

<style>

</style>