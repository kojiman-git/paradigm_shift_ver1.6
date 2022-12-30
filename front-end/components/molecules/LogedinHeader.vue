
<template>
  <div>
    <v-navigation-drawer
      v-model="drawer"
      absolute
      temporary
    >
      <v-list-item>
        <v-list-item-avatar>
         <div v-if="this.$store.state.currentUser.image === null">
            <v-img
                max-height="75"
                max-width="75"
                v-bind:src="require('@/assets/image/undraw_male_avatar_323b.svg')"
            ></v-img>
          </div>
          <div v-else>
            <v-img
                class="user-icon"
                max-height="75"
                max-width="75"
                :src="`http://localhost:3000${this.$store.state.currentUser.image}`"
            ></v-img>
          </div>
        </v-list-item-avatar>

        <v-list-item-content>
          <v-list-item-title>{{this.$store.state.currentUser.name}}</v-list-item-title>
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
      <div v-if="this.$store.state.currentUser.image === null">
        <v-img
          @click.stop="drawer = !drawer"
          max-height="50"
          max-width="50"
          v-bind:src="require('@/assets/image/undraw_male_avatar_323b.svg')"
        ></v-img>
      </div>
      <div v-else>
        <v-img
          @click.stop="drawer = !drawer"
          class="user-icon"
          max-height="50"
          max-width="50"
          :src="`http://localhost:3000${this.$store.state.currentUser.image}`"
        ></v-img>
      </div>
      <v-spacer />
        <slot></slot>
      <v-spacer />
    </v-app-bar>
    <v-divider></v-divider>
  </div>
</template>

<script>
 import axios from 'axios';
  export default {
    data () {
      return {
        drawer: null,
        items: [
          { title: 'Following', icon: 'mdi-account-multiple',to:`/DrawerMenu/${this.$store.state.currentUser.id}/following`},
          { title: 'Followers', icon: 'mdi-account-multiple-outline',to:`/DrawerMenu/${this.$store.state.currentUser.id}/followers`},
          { title: 'My Profile', icon: 'mdi-card-account-details-outline',to:`/DrawerMenu/${this.$store.state.currentUser.id}/myProfile`},
          { title: 'Quiz List', icon: 'mdi-help-box',to:`/DrawerMenu/${this.$store.state.currentUser.id}/quizList`},
          { title: 'Description', icon: 'mdi-forum',to: '/DrawerMenu/description',},
        ],
      }
    },
    methods: {
      LogOutEvent() {
      axios
        .get('http://localhost:3000/logout',{ withCredentials: true })
        .then(response => {
          if (response.data.message === "ログアウトしました") {
              this.$store.dispatch('logoutEvent')
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