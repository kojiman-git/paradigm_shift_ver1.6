<template>
  <div>
    <v-app-bar color="#cefffb" class="text-h4">
        <v-row no-gutters align=center>
          <v-col class=center>
          </v-col>
          <v-col class=center>
          </v-col>
          <v-col class=center>
           Posts
          </v-col>
          <v-col class=center>
          </v-col>
          <v-col class=center>
            <v-menu offset-y>
              <template v-slot:activator="{ on, attrs }">
                <v-btn
                  color="#a7f9ff"
                  v-bind="attrs"
                  v-on="on"
                >
                  filter
                </v-btn>
              </template>
              <v-list>
                <v-list-item
                  v-for="(item, index) in items"
                  :key="index"
                  link
                >
                  <v-list-item-title>{{ item.title }}</v-list-item-title>
                </v-list-item>
              </v-list>
            </v-menu>
          </v-col>
        </v-row>
    </v-app-bar>
  </div>
</template>

<script>
  export default {
    data: () => ({
      items: [
        { title: '英語' },
        { title: '数学' },
        { title: '国語' },
        { title: '理科' },
        { title: '社会' },
        { title: 'その他' },
      ],
    }),
  }
</script>

<style scoped>
.center {
 display: flex;
 justify-content: center;
}
</style>